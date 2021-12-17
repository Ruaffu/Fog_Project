package web.commands;

import business.entities.Order;
import business.entities.User;
import business.exceptions.UserException;
import business.services.OrderFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class UpdateStatusCommand extends CommandProtectedPage
{
    OrderFacade orderFacade;
    public UpdateStatusCommand(String pageToShow, String role)
    {
        super(pageToShow, role);
        orderFacade = new OrderFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        String status = request.getParameter("status");
        Order order = (Order) session.getAttribute("editorder");
        order.setStatus(status);
        orderFacade.updateOrder(order);
        session.setAttribute("editorder", order);
        ArrayList<User> users = (ArrayList<User>) session.getAttribute("users");
        ArrayList<Order> orders = null;
        try {
            orders = orderFacade.getAllOrders(users);
        } catch (UserException e) {
            e.printStackTrace();
        }
        session.setAttribute("allorders", orders);

        return pageToShow;
    }
}
