package business.persistence;

import business.entities.Material;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

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
                    "VALUES(?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE price=?";

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

                ps.executeUpdate();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
