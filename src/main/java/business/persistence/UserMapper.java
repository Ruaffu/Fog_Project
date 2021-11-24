package business.persistence;

import business.exceptions.UserException;
import business.entities.User;

import java.sql.*;

public class UserMapper {
    private Database database;

    public UserMapper(Database database) {
        this.database = database;
    }

    public void createUser(User user) throws UserException {
        //TODO: fix address.
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
            String sql = "SELECT * FROM users WHERE email=? AND password=?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(2, password);
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    String role = rs.getString("role");
                    String firstname = rs.getString("firstname");
                    String lastname = rs.getString("lastname");
                    String phonenr = rs.getString("phone_nr");
                    String streetname = rs.getString("street_name");
                    String housenr = rs.getString("house_nr");
                    String zipcode = rs.getString("user_zipcode");
                    String city = rs.getString("city");
                    int id = rs.getInt("id");
                    return new User(id, email, password, role, firstname, lastname, streetname, housenr, zipcode, phonenr);
                } else {
                    throw new UserException("Could not validate user");
                }
            } catch (SQLException ex) {
                throw new UserException(ex.getMessage());
            }
        } catch (SQLException ex) {
            throw new UserException("Connection to database could not be established");
        }
    }

}
