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

public class OrderListCommand extends CommandProtectedPage
{
    OrderFacade orderFacade;
    UserFacade userFacade;
    public OrderListCommand(String pageToShow, String role)
    {
        super(pageToShow, role);
        orderFacade = new OrderFacade(database);
        userFacade = new UserFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
        HttpSession session = request.getSession();

        ArrayList<User> users;
        try
        {
            users = userFacade.getAllUsers();
            ArrayList<Order> orders = orderFacade.getAllOrders(users);
            session.setAttribute("allorders", orders);
        } catch (UserException e)
        {
            e.printStackTrace();
        }

        return "allorderpage";

    }
}
