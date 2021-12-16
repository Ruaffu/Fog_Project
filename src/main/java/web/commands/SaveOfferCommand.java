package web.commands;

import business.entities.Order;
import business.services.OrderFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SaveOfferCommand extends CommandProtectedPage{
    private OrderFacade orderFacade;
    public SaveOfferCommand(String pageToShow, String role) {
        super(pageToShow, role);
        orderFacade = new OrderFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        Order order = (Order) session.getAttribute("makeoffer");
        order.setStatus("offer");
        orderFacade.updateBom(order);

        return pageToShow;
    }
}
