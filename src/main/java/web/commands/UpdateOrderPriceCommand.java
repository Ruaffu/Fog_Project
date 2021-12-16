package web.commands;

import business.entities.Order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateOrderPriceCommand extends CommandProtectedPage{
    public UpdateOrderPriceCommand(String pageToShow, String role) {
        super(pageToShow, role);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();

        Order order = (Order) session.getAttribute("makeoffer");
        float price = Float.parseFloat(request.getParameter("price"));
        order.setTotalPrice(price);
        order.setCoverageRatio(order.coverageRatio());

        session.setAttribute("makeoffer", order);
        return pageToShow;
    }
}
