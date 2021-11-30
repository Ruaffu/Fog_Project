package business.persistence;

import business.entities.Material;
import business.entities.Order;

import java.sql.*;
import java.util.ArrayList;

public class BOMMapper {

    Database database;

    public BOMMapper(Database database) {
        this.database = database;
    }

    public void saveBOM(Order order) {

        try (Connection connection = database.connect()) {

            for (Material material : order.getBOM()) {
                String sql = "INSERT INTO bom (order_id, material_id, quantity, description) " +
                        "VALUES(?,?,?,?)";

                try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                    ps.setInt(1, order.getId());
                    ps.setInt(2, material.getId());
                    ps.setInt(3, material.getQuantity());
                    ps.setString(4, material.getDescription());
                    ps.executeUpdate();
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<Material> getAllMaterials(int order_id) throws Exception {
        ArrayList<Material> BOM = new ArrayList<>();
        try (Connection connection = database.connect()) {
            String sql = "SELECT * FROM billofmaterial WHERE order_id = ?";
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1,order_id);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id_material");
                    String name = rs.getString("name");
                    String type = rs.getString("type");
                    float cost = rs.getFloat("cost");
                    float price = rs.getFloat("price");
                    String description = rs.getString("description");
                    int length = rs.getInt("length");
                    int height = rs.getInt("height");
                    int width = rs.getInt("width");
                    String unit = rs.getString("unit");
                    int quantity = rs.getInt("quantity");

                    BOM.add(new Material(id, name, type, description, cost, price, length, height, width, unit, quantity));
                }
                return BOM;
            } catch (Exception e) {
                throw new Exception("Could not find materials");
            }
        } catch (SQLException throwables) {
            throw new Exception("Could not find materials");
        }
    }
}


