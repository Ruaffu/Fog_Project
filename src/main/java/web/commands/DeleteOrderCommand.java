package web.commands;

import business.entities.Order;
import business.persistence.OrderFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class DeleteOrderCommand extends CommandProtectedPage{
    private OrderFacade orderFacade;

    public DeleteOrderCommand(String pageToShow, String role) {
        super(pageToShow, role);
        orderFacade = new OrderFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        int index = Integer.parseInt(request.getParameter("order"));
        ArrayList<Order> orders = (ArrayList<Order>) session.getAttribute("allorders");
        Order order = orders.get(index);
        orders.remove(order);
        orderFacade.deleteOrder(order);
        session.setAttribute("allorders", orders);
        return pageToShow;
    }
}
