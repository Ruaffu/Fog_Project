package business.services;

import business.entities.Material;
import business.entities.Order;
import business.entities.User;
import business.exceptions.UserException;
import business.persistence.BOMMapper;
import business.persistence.Database;
import business.persistence.OrderMapper;

import java.util.ArrayList;

public class OrderFacade {
    OrderMapper orderMapper;
    BOMMapper bomMapper;

    public OrderFacade(Database database) {
        orderMapper = new OrderMapper(database);
        bomMapper = new BOMMapper(database);
    }

    public void saveOrder(Order order){
        orderMapper.saveOrder(order);
        bomMapper.saveBOM(order);
    }

    public ArrayList<Order> getAllUserOrders(User user) {
        ArrayList<Order> orders = new ArrayList<>();
        ArrayList<Integer> idOrders;
        try {
            idOrders = orderMapper.getOrderId(user.getId());
            for (int id : idOrders) {
                ArrayList<Material> BOM = bomMapper.getAllMaterials(id);
                Order order = orderMapper.getAllOrdersUser(id, user, BOM);
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    public ArrayList<Order> getAllOrders(ArrayList<User> users) throws UserException {
        ArrayList<Order> orders = new ArrayList<>();
        for (User user : users) {
            orders.addAll(getAllUserOrders(user));
        }
        return orders;
    }


}
