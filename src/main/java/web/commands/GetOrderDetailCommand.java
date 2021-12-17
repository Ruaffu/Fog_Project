package web.commands;

import business.entities.Order;
import business.entities.User;
import business.exceptions.UserException;
import business.persistence.OrderFacade;
import business.persistence.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class GetOrderDetailCommand extends CommandUnprotectedPage {
    private OrderFacade orderFacade;
    private UserFacade userFacade;

    public GetOrderDetailCommand(String pageToShow) {
        super(pageToShow);
        orderFacade = new OrderFacade(database);
        userFacade = new UserFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        int index = Integer.parseInt(request.getParameter("order"));
        ArrayList<Order> orders = null;
        Order order = null;

        User user = (User) session.getAttribute("user");

        if (user.getRole().equals("employee")) {
            boolean isCustomerList = Boolean.parseBoolean(request.getParameter("customerorderlist"));
            if (isCustomerList) {
                orders = (ArrayList<Order>) session.getAttribute("orderlist");
            } else {
                ArrayList<User> users = null;
                try {
                    users = userFacade.getAllUsers();
                    orders = orderFacade.getAllOrders(users);
                } catch (UserException e) {
                    e.printStackTrace();
                }
            }
        } else {
            orders = orderFacade.getAllUserOrders(user);
        }
        order = orders.get(index);
        session.setAttribute("editorder", order);
        return pageToShow;
    }
}
