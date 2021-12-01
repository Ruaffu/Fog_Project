package web.commands;

import business.entities.Order;
import business.services.OrderFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;

public class SendOfferCommand extends CommandProtectedPage {

    OrderFacade orderFacade;

    public SendOfferCommand(String pageToShow, String role) {
        super(pageToShow, role);
        orderFacade = new OrderFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();

        Order sendRequest = (Order) session.getAttribute("makeoffer");

        int length = Integer.parseInt(request.getParameter("length"));
        int width = Integer.parseInt(request.getParameter("width"));
        String roof = request.getParameter("roof");
        int roofAngle = Integer.parseInt(request.getParameter("roofangle"));
        int shedLength = Integer.parseInt(request.getParameter("shedlength"));
        int shedWidth = Integer.parseInt(request.getParameter("shedwidth"));
        float price = Float.parseFloat(request.getParameter("price"));

        // TODO: if carport is being changed, make new BOM and redirect på makeofferpage again

        sendRequest.setCarportLength(length);
        sendRequest.setCarportWidth(width);
        sendRequest.setRoofType(roof);
        sendRequest.setRoofAngle(roofAngle);
        sendRequest.setShedLength(shedLength);
        sendRequest.setShedWidth(shedWidth);
        sendRequest.setTotalPrice(price);
        sendRequest.setOrderDate(new Timestamp(System.currentTimeMillis()));

        sendRequest.setStatus("offer");

        orderFacade.updateOrder(sendRequest);


        return REDIRECT_INDICATOR + pageToShow;
    }
}
