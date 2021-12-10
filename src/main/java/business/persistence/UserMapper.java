package business.persistence;

import business.exceptions.UserException;
import business.entities.User;

import java.sql.*;
import java.util.ArrayList;

public class UserMapper {
    private Database database;

    public UserMapper(Database database) {
        this.database = database;
    }

    public void createUser(User user) throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "INSERT INTO users (email, password, role, firstname, lastname, streetname, housenr, zipcode, phonenr) VALUES (?, ?, ?, ?, ?, ?,?, ?, ?)";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setString(1, user.getEmail());
                ps.setString(2, user.getPassword());
                ps.setString(3, user.getRole());
                ps.setString(4, user.getFirstname());
                ps.setString(5, user.getLastname());
                ps.setString(6, user.getStreetname());
                ps.setString(7, user.getHouseNr());
                ps.setString(8, user.getZipcode());
                ps.setString(9, user.getPhoneNr());
                ps.executeUpdate();
                ResultSet ids = ps.getGeneratedKeys();
                ids.next();
                int id = ids.getInt(1);
                user.setId(id);
            } catch (SQLException ex) {
                throw new UserException(ex.getMessage());
            }
        } catch (SQLException ex) {
            throw new UserException(ex.getMessage());
        }
    }

    public User login(String email, String password) throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "SELECT * FROM userinfo WHERE email=? AND password=?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, email);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("id_user");
                    String role = rs.getString("role");
                    String firstname = rs.getString("firstname");
                    String lastname = rs.getString("lastname");
                    String streetname = rs.getString("streetname");
                    String housenr = rs.getString("housenr");
                    String city = rs.getString("city");
                    String zipcode = rs.getString("zipcode");
                    String regionName = rs.getString("region_name");
                    String phonenr = rs.getString("phonenr");

                    return new User(id, email, password, role, firstname, lastname, streetname, housenr, city, zipcode, regionName, phonenr);
                } else {
                    throw new UserException("Could not validate user");
                }
            } catch (UserException ex) {
                throw new UserException(ex.getMessage());
            }
        } catch (SQLException ex) {
            throw new UserException("Connection to database could not be established");
        }
    }

    public ArrayList<User> getAllUsers() throws UserException {
        ArrayList<User> users = new ArrayList<>();

        try (Connection connection = database.connect()) {
            String sql = "SELECT * FROM userinfo ";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id_user");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String role = rs.getString("role");
                    String firstname = rs.getString("firstname");
                    String lastname = rs.getString("lastname");
                    String streetName = rs.getString("streetname");
                    String houseNr = rs.getString("housenr");
                    String city = rs.getString("city");
                    String zipcode = rs.getString("zipcode");
                    String regionName = rs.getString("region_name");
                    String phoneNr = rs.getString("phonenr");

                    User user = new User(id, email, password, role, firstname, lastname, streetName, houseNr, city, zipcode, regionName, phoneNr);

                    users.add(user);
                }
                return users;
            } catch (Exception e) {
                throw new UserException("Could not find users");
            }
        } catch (SQLException throwables) {
            throw new UserException("Could not find users");
        }
    }

    public void updateUser(User user) {
        try (Connection connection = database.connect()) {
            String sql = "UPDATE users " +
                    "SET email = ?, password = ?, firstname = ?, lastname = ?, phonenr = ?, streetname = ?, housenr = ?, zipcode = ? " +
                    "WHERE id_user = ? ";
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFirstname());
            ps.setString(4, user.getLastname());
            ps.setString(5, user.getPhoneNr());
            ps.setString(6, user.getStreetname());
            ps.setString(7, user.getHouseNr());
            ps.setString(8, user.getZipcode());
            ps.setInt(9, user.getId());
            ps.executeUpdate();
        } catch (SQLException throwables) {
            System.out.println("could not update user");
            throwables.printStackTrace();
        }
    }

}
