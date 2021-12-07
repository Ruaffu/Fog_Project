package web.commands;

import business.entities.Order;
import business.exceptions.UserException;
import business.services.DrawCarport;
import business.services.OrderFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class DrawSVGCommand extends CommandUnprotectedPage
{
    OrderFacade orderFacade;
    public DrawSVGCommand(String pageToShow)
    {
        super(pageToShow);
        orderFacade = new OrderFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException
    {
        HttpSession session = request.getSession();
        int index = Integer.parseInt(request.getParameter("order"));
        ArrayList<Order> orderList = (ArrayList<Order>) session.getAttribute("customerOrders");
        Order order = orderList.get(index);
        DrawCarport drawCarport = new DrawCarport(order, database);

        if (order.getShedLength() > 0){
            session.setAttribute("svgdrawing", drawCarport.drawFullCarportWithShed());
        } else {
            session.setAttribute("svgdrawing", drawCarport.drawFullCarportWithOut());
        }
        return pageToShow;
    }
}
