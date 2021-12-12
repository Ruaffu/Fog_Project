package web.commands;

import business.entities.Order;
import business.services.OrderFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateStatusCommand extends CommandProtectedPage
{
    OrderFacade orderFacade;
    public UpdateStatusCommand(String pageToShow, String role)
    {
        super(pageToShow, role);
        orderFacade = new OrderFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        String status = request.getParameter("status");
        Order order = (Order) session.getAttribute("editorder");
        order.setStatus(status);
        orderFacade.updateOrder(order);
        session.setAttribute("editorder", order);
        return pageToShow;
    }
}
