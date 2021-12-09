package web.commands;

import business.entities.Material;
import business.entities.Order;
import business.services.OrderFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class UpdateOrderCommand extends CommandProtectedPage
{
    OrderFacade orderFacade;
    public UpdateOrderCommand(String pageToShow, String role)
    {
        super(pageToShow, role);
        orderFacade = new OrderFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("makeoffer");
        ArrayList<Material> bomcopy = (ArrayList<Material>) session.getAttribute("bomlist");
        order.setBOM(bomcopy);
        orderFacade.updateOrder(order);


        return pageToShow;
    }
}
