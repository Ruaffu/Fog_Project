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

public class SaveOfferCommand extends CommandProtectedPage{
    private OrderFacade orderFacade;
    UserFacade userFacade;
    public SaveOfferCommand(String pageToShow, String role) {
        super(pageToShow, role);
        orderFacade = new OrderFacade(database);
        userFacade = new UserFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        Order order = (Order) session.getAttribute("makeoffer");
        order.setStatus("offer");
        orderFacade.updateBom(order);

        ArrayList<User> users = null;
        try {
            users = userFacade.getAllUsers();
        } catch (UserException e) {
            e.printStackTrace();
        }
        ArrayList<Order> orders = null;
        try {
            orders = orderFacade.getAllRequests(users);
        } catch (UserException e) {
            e.printStackTrace();
        }
        session.setAttribute("allrequests", orders);

        return pageToShow;
    }
}
