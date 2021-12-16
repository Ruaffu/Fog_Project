package web.commands;

import business.entities.Order;
import business.entities.User;
import business.exceptions.UserException;
import business.services.DrawCarport;
import business.services.OrderFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class DrawOrderSVGCommand extends CommandUnprotectedPage {
    OrderFacade orderFacade;

    public DrawOrderSVGCommand(String pageToShow) {
        super(pageToShow);
        orderFacade = new OrderFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("editorder");
        DrawCarport drawCarport = new DrawCarport(order);

        if (order.getShedLength() > 0) {
            session.setAttribute("svgdrawing", drawCarport.drawFullCarportWithShed());
            session.setAttribute("svgdrawingsideview", drawCarport.drawFullCarportSideViewWithShed());
        } else {
            session.setAttribute("svgdrawing", drawCarport.drawFullCarportWithOut());
            session.setAttribute("svgdrawingsideview", drawCarport.drawFullCarportSideWithOut());
        }
        return pageToShow;
    }
}
