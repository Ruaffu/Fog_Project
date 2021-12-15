package web.commands;

import business.entities.Order;
import business.entities.User;
import business.services.OrderFacade;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class MakeOfferCommand extends CommandProtectedPage {

    public MakeOfferCommand(String pageToShow, String role) {
        super(pageToShow, role);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        int index = Integer.parseInt(request.getParameter("request"));
        ArrayList<Order> requests = (ArrayList<Order>) session.getAttribute("allrequests");
        Order makeRequest = requests.get(index);

        session.setAttribute("makeoffer", makeRequest); //bruges til at ændre data af tilbuddet før det er gemt
        session.setAttribute("currentrequest", makeRequest); //Bruges til at se det nuværrende sendte forespørgsel fra kunden

        return pageToShow;
    }
}
