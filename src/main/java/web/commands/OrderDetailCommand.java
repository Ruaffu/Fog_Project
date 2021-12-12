package web.commands;

import business.entities.Order;
import business.entities.User;
import business.exceptions.UserException;
import business.services.OrderFacade;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class OrderDetailCommand extends CommandProtectedPage{
    private OrderFacade orderFacade;
    private UserFacade userFacade;
    public OrderDetailCommand(String pageToShow, String role) {
        super(pageToShow, role);
        orderFacade = new OrderFacade(database);
        userFacade = new UserFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        int index = Integer.parseInt(request.getParameter("order"));
        ArrayList<Order> orders;
        Order order;

        orders = (ArrayList<Order>) session.getAttribute("allorders");

        order = orders.get(index);
        session.setAttribute("editorder", order);
        return pageToShow;
    }
}
