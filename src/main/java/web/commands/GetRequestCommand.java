package web.commands;

import business.entities.Order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class GetRequestCommand extends CommandUnprotectedPage{
    public GetRequestCommand(String pageToShow) {
        super(pageToShow);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        int requestIndex = Integer.parseInt(request.getParameter("request"));

        ArrayList<Order> orders = (ArrayList<Order>) session.getAttribute("customerrequests");

        Order order = orders.get(requestIndex);
        request.setAttribute("request", order);
        request.setAttribute("requestIndex", requestIndex);

        return pageToShow;
    }
}
