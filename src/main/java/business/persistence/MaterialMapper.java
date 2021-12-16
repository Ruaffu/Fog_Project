package business.persistence;

import business.entities.Material;
import business.entities.Order;
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

    public void saveMaterialList (ArrayList<Material> materials) {
        try (Connection connection = database.connect()) {

            for (Material material : materials) {
                String sql = "INSERT INTO material (name, cost, price, length, height, width, unit) " +
                        "VALUES(?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE price=?, cost=?";

                try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                    ps.setString(1, material.getName());
                    ps.setFloat(2, material.getCost());
                    ps.setFloat(3, material.getPrice());
                    ps.setInt(4, material.getLength());
                    ps.setInt(5, material.getHeight());
                    ps.setInt(6, material.getWidth());
                    ps.setString(7, material.getUnit());
                    ps.setFloat(8, material.getPrice());
                    ps.setFloat(9, material.getCost());
                    ps.executeUpdate();
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void saveMaterial(Material material) {

        try (Connection connection = database.connect()) {

            String sql = "INSERT INTO material (name, cost, price, length, height, width, unit) " +
                    "VALUES(?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE price=?, cost=?";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setString(1, material.getName());
                ps.setFloat(2, material.getCost());
                ps.setFloat(3, material.getPrice());
                ps.setInt(4, material.getLength());
                ps.setInt(5, material.getHeight());
                ps.setInt(6, material.getWidth());
                ps.setString(7, material.getUnit());
                ps.setFloat(8, material.getPrice());
                ps.setFloat(9, material.getCost());

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
                    float cost = rs.getFloat("cost");
                    float price = rs.getFloat("price");
                    int length = rs.getInt("length");
                    int height = rs.getInt("height");
                    int width = rs.getInt("width");
                    String unit = rs.getString("unit");

                    return new Material(id,name,cost,price,length,height,width,unit);
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

    public Material getMaterial(String name) throws UserException
    {
        try (Connection connection = database.connect())
        {
            String sql = "SELECT * FROM material WHERE name=?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, name);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    int id = rs.getInt("id_material");
                    float cost = rs.getFloat("cost");
                    float price = rs.getFloat("price");
                    int length = rs.getInt("length");
                    int height = rs.getInt("height");
                    int width = rs.getInt("width");
                    String unit = rs.getString("unit");
                    return new Material(id, name, cost, price, length, height, width, unit);
                }else {
                    throw new Exception("Could not find material");
                }
            }
            catch (Exception e) {
                throw new UserException("Could not find material " + name);
            }

        } catch (SQLException throwables) {
            throw new UserException("Could not find material");
        }
    }

    public ArrayList<Material> getMaterialByName(String name) throws UserException
    {
        ArrayList<Material> materials = new ArrayList<>();
        try (Connection connection = database.connect())
        {
            String sql = "SELECT * FROM material WHERE name=?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, name);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id_material");
                    float cost = rs.getFloat("cost");
                    float price = rs.getFloat("price");
                    int length = rs.getInt("length");
                    int height = rs.getInt("height");
                    int width = rs.getInt("width");
                    String unit = rs.getString("unit");
                    materials.add(new Material(id,name,cost,price,length,height,width,unit));

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

    public ArrayList<Material> getAllMaterials() throws UserException
    {
        ArrayList<Material> materials = new ArrayList<>();
        try (Connection connection = database.connect())
        {
            String sql = "SELECT * FROM material ";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id_material");
                    String name = rs.getString("name");
                    float cost = rs.getFloat("cost");
                    float price = rs.getFloat("price");
                    int length = rs.getInt("length");
                    int height = rs.getInt("height");
                    int width = rs.getInt("width");
                    String unit = rs.getString("unit");
                    materials.add(new Material(id,name,cost,price,length,height,width,unit));

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
}
