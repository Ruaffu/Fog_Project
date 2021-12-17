package web.commands;

import business.entities.Order;
import business.entities.User;
import business.persistence.OrderFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class AdminEditUserCommand extends CommandProtectedPage
{
    OrderFacade orderFacade;
    public AdminEditUserCommand(String pageToShow, String role)
    {
        super(pageToShow, role);
        orderFacade = new OrderFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        int index = Integer.parseInt(request.getParameter("index"));
        ArrayList<User> users = (ArrayList<User>) session.getAttribute("users");
        User user = users.get(index);

        session.setAttribute("seemoreuser", user);

        ArrayList<Order> orders = orderFacade.getAllUserOrders(user);
        ArrayList<Order> requests = orderFacade.getAllUserOffersAndRequests(user);
        session.setAttribute("orderlist", orders);
        session.setAttribute("requestlist", requests);

        return REDIRECT_INDICATOR + pageToShow;
    }
}
