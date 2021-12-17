package web.commands;

import business.entities.Order;
import business.persistence.OrderFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.ArrayList;

public class AcceptOfferCommand extends CommandProtectedPage {

    OrderFacade orderFacade;

    public AcceptOfferCommand(String pageToShow, String role) {
        super(pageToShow, role);
        orderFacade = new OrderFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();

        ArrayList<Order> orders = (ArrayList<Order>) session.getAttribute("customerOrders");
        ArrayList<Order> offers = (ArrayList<Order>) session.getAttribute("customerrequests");

        Order acceptOrder = (Order) session.getAttribute("request");

        acceptOrder.setStatus("accepted");
        acceptOrder.setOrderDate(new Timestamp(System.currentTimeMillis()));

        orderFacade.updateOrder(acceptOrder);

        orders.add(acceptOrder);
        offers.remove(acceptOrder);

        session.setAttribute("customerrequests", offers);
        session.setAttribute("customerOrders", orders);
        session.setAttribute("payorder", acceptOrder);

        return REDIRECT_INDICATOR + pageToShow;
    }
}
