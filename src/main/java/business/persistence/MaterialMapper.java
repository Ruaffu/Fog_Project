package business.persistence;

import business.entities.Material;
import business.exceptions.UserException;

import java.sql.*;
import java.util.ArrayList;

public class MaterialMapper
{
    private Database database;

    public MaterialMapper(Database database)
    {
        this.database = database;
    }

    public void saveMaterial(Material material) {

        try (Connection connection = database.connect()) {

            String sql = "INSERT INTO material (name, type, description, cost, price, length, height, width, unit) " +
                    "VALUES(?,?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE price=?, cost=?";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setString(1, material.getName());
                ps.setString(2, material.getType());
                ps.setString(3, material.getDescription());
                ps.setFloat(4, material.getCost());
                ps.setFloat(5, material.getPrice());
                ps.setInt(6, material.getLength());
                ps.setInt(7, material.getHeight());
                ps.setInt(8, material.getWidth());
                ps.setString(9, material.getUnit());
                ps.setFloat(10, material.getPrice());
                ps.setFloat(11, material.getCost());

                ps.executeUpdate();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public Material getMaterialByID(int id) throws UserException
    {
        try (Connection connection = database.connect())
        {
            String sql = "SELECT * FROM material WHERE id_material=?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("name");
                    String type = rs.getString("type");
                    String description = rs.getString("description");
                    float cost = rs.getFloat("cost");
                    float price = rs.getFloat("price");
                    int length = rs.getInt("length");
                    int height = rs.getInt("height");
                    int width = rs.getInt("width");
                    String unit = rs.getString("unit");

                    return new Material(id,name,type,description,cost,price,length,height,width,unit);
                } else {
                    throw new Exception("Could not find material");
                }
            }
            catch (Exception e) {
                throw new UserException("Could not find material");
            }

        } catch (SQLException throwables) {
            throw new UserException("Could not find material");
        }

    }

    public ArrayList<Material> getMaterialByType(String type) throws UserException
    {
        ArrayList<Material> materials = new ArrayList<>();
        try (Connection connection = database.connect())
        {
            String sql = "SELECT * FROM material WHERE type=?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, type);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id_material");
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    float cost = rs.getFloat("cost");
                    float price = rs.getFloat("price");
                    int length = rs.getInt("length");
                    int height = rs.getInt("height");
                    int width = rs.getInt("width");
                    String unit = rs.getString("unit");
                    materials.add(new Material(id,name,type,description,cost,price,length,height,width,unit));

                }
                return materials;
            }
            catch (Exception e) {
                throw new UserException("Could not find material");
            }

        } catch (SQLException throwables) {
            throw new UserException("Could not find material");
        }

    }

//    public ArrayList<Material> getAllMaterials()
//    {
//
//    }
}
