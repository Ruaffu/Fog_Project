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
        User user = (User) session.getAttribute("user");
        Order order;
        DrawCarport drawCarport;
        if (user.getRole().equals("customer"))
        {
            int index = Integer.parseInt(request.getParameter("order"));
            ArrayList<Order> orderList = (ArrayList<Order>) session.getAttribute("customerOrders");
            order = orderList.get(index);
            drawCarport = new DrawCarport(order);
            session.setAttribute("order", order);
        } else {
            order = (Order) session.getAttribute("makeoffer");
            drawCarport = new DrawCarport(order);
            session.setAttribute("order", order);
        }

        if (order.getShedLength() > 0){
            session.setAttribute("svgdrawing", drawCarport.drawFullCarportWithShed());
            session.setAttribute("svgdrawingsideview", drawCarport.drawFullCarportSideViewWithShed());
        } else {
            session.setAttribute("svgdrawing", drawCarport.drawFullCarportWithOut());
            session.setAttribute("svgdrawingsideview", drawCarport.drawFullCarportSideWithOut());
        }
        return pageToShow;
    }
}
