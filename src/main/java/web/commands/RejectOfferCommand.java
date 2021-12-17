package web.commands;

import business.entities.Order;
import business.persistence.OrderFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;

public class RejectOfferCommand extends CommandProtectedPage {

    OrderFacade orderFacade;

    public RejectOfferCommand(String pageToShow, String role) {
        super(pageToShow, role);
        orderFacade = new OrderFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();

        Order rejectOrder = (Order) session.getAttribute("request");

        rejectOrder.setStatus("rejected");
        rejectOrder.setOrderDate(new Timestamp(System.currentTimeMillis()));

        orderFacade.updateOrder(rejectOrder);

        return REDIRECT_INDICATOR + pageToShow;
    }
}
