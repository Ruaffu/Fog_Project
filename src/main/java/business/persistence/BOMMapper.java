package business.persistence;

import business.entities.Material;
import business.entities.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class BOMMapper {

    Database database;

    public BOMMapper(Database database) {
        this.database = database;
    }

    public void saveBOM(Order order) {

        try (Connection connection = database.connect()) {

            for (Material material : order.getBOM()) {
                String sql = "INSERT INTO bom (order_id, material_id, quantity) " +
                        "VALUES(?,?,?)";

                try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                    ps.setInt(1, order.getId());
                    ps.setInt(2, material.getId());
                    ps.setInt(3, material.getQuantity());
                    ps.executeUpdate();
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}


