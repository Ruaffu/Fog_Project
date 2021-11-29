package business.persistence;

import business.entities.Material;
import business.entities.Order;

import java.sql.*;

public class OrderMapper {

    Database database;

    public OrderMapper(Database database) {
        this.database = database;
    }

    public void saveOrder(Order order) {

        try (Connection connection = database.connect()) {

            String sql = "INSERT INTO user_orders (user_id, admin_id, totalprice, totalcost, orderdate, status, carport_lenght, carport_width, roof_type, roof_angle, shed_length, shed_width) " +
                    "VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setInt(1, order.getUserId());
                ps.setInt(2, order.getAdminId());
                ps.setFloat(3, order.getTotalPrice());
                ps.setFloat(4, order.getTotalCost());
                ps.setTimestamp(5, order.getOrderDate());
                ps.setString(6, order.getStatus());
                ps.setInt(7, order.getCarportLength());
                ps.setInt(8, order.getCarportWidth());
                ps.setString(9, order.getRoofType());
                ps.setInt(10, order.getRoofAngle());
                ps.setInt(11, order.getShedLength());
                ps.setInt(12, order.getShedWidth());

                ps.executeUpdate();
                ResultSet ids = ps.getGeneratedKeys();
                ids.next();
                int id = ids.getInt(1);
                order.setId(id);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
