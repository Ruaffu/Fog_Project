package web.commands;

import business.entities.Order;
import business.services.OrderFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.ArrayList;

public class RejectOfferCommand extends CommandProtectedPage {

    OrderFacade orderFacade;

    public RejectOfferCommand(String pageToShow, String role) {
        super(pageToShow, role);
        orderFacade = new OrderFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();

        ArrayList<Order> orders = (ArrayList<Order>) session.getAttribute("customerOrders");
        ArrayList<Order> offers = (ArrayList<Order>) session.getAttribute("customerrequests");

        Order rejectOrder = (Order) session.getAttribute("request");

        rejectOrder.setStatus("rejected");
        rejectOrder.setOrderDate(new Timestamp(System.currentTimeMillis()));

        orderFacade.updateOrder(rejectOrder);

        return REDIRECT_INDICATOR + pageToShow;
    }
}
