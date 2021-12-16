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

    /** save and update **/

    public void saveOrder(Order order){
        orderMapper.saveOrder(order);
        bomMapper.saveBOM(order);
    }

    public void updateOrder(Order order) {
        orderMapper.updateOrder(order);
    }


    //bruges til at opdater en order
    public void updateBom(Order order)
    {
        bomMapper.deleteBom(order);
        bomMapper.saveBOM(order);
        orderMapper.updateOrder(order);
    }

    public void deleteOrder(Order order) {
        bomMapper.deleteBom(order);
        orderMapper.deleteOrder(order);
    }

    /** load data **/

    public ArrayList<Order> getAllOrders(ArrayList<User> users) throws UserException {
        ArrayList<Order> orders = new ArrayList<>();
        for (User user : users) {
            orders.addAll(getAllUserOrders(user));
        }
        return orders;
    }

    public ArrayList<Order> getAllRequests(ArrayList<User> users) throws UserException {
        ArrayList<Order> requests = new ArrayList<>();
        for (User user : users) {
            requests.addAll(getAllUserOffersAndRequests(user));
        }
        return requests;
    }

    public ArrayList<Order> getAllUserOrders(User user) {
        return getOrdersByID(orderMapper.getOrderId(user.getId()),user);
    }

    public ArrayList<Order> getAllUserOffersAndRequests(User user) {
            return getOrdersByID(orderMapper.getOfferAndRequestId(user.getId()), user);
    }

    private ArrayList<Order> getOrdersByID(ArrayList<Integer> ID, User user){
        ArrayList<Order> orders = new ArrayList<>();

        for (int id : ID) {
            ArrayList<Material> BOM = bomMapper.getAllMaterials(id);
            Order order = orderMapper.getAllOrdersUser(id, user, BOM);
            orders.add(order);
        }
        return orders;
    }

}
