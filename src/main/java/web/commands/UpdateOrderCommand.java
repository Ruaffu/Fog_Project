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

        for (int i = 0; i < bomcopy.size(); i++) {
            String makeString = "quantity"+i;
            int newQuantity = Integer.parseInt(request.getParameter(makeString));
            bomcopy.get(i).setQuantity(newQuantity);
        }

        order.setBOM(bomcopy);
        order.setTotalPrice(order.priceCalc());
        order.setTotalCost(order.costCalc());
        order.setCoverageRatio(order.coverageRatio());
        orderFacade.updateBom(order);

        return pageToShow;
    }
}
