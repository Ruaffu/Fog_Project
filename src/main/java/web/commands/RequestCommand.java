package web.commands;

import business.calculators.FlatRoofCalc;
import business.calculators.FlatRoofWithShedCalc;
import business.calculators.MaterialCalculator;
import business.entities.Material;
import business.entities.Order;
import business.entities.User;
import business.exceptions.UserException;
import business.services.OrderFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.Timestamp;
import java.util.ArrayList;

public class RequestCommand extends CommandProtectedPage
{
    OrderFacade orderFacade;
    MaterialCalculator MC;

    public RequestCommand(String pageToShow, String role)
    {
        super(pageToShow, role);
        orderFacade = new OrderFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        int length = Integer.parseInt(request.getParameter("length"));
        int width = Integer.parseInt(request.getParameter("width"));
        String roof = request.getParameter("roof");
        int roofAngle = Integer.parseInt(request.getParameter("roofangle"));
        int shedLength = Integer.parseInt(request.getParameter("shedlength"));
        int shedWidth = Integer.parseInt(request.getParameter("shedwidth"));
        String remarks = request.getParameter("misc");

        if (length < shedLength || width < shedWidth) {
            session.setAttribute("failure", "Fejl, vælg en gyldig længde");
            return "requestcarportpage";
        }

        if (shedLength > 0){
            MC = new FlatRoofWithShedCalc(database, width, length, shedWidth, shedLength);
        } else {
            MC = new FlatRoofCalc(database, width, length);
        }

        request.setAttribute("length",length);
        request.setAttribute("width",width);
        request.setAttribute("roof",roof);
        request.setAttribute("roofangle",roofAngle);
        request.setAttribute("shedwidth",shedWidth);
        request.setAttribute("shedlength",shedLength);
        request.setAttribute("remarks", remarks);

        try {
            ArrayList<Material> BOM = MC.BOMCalculator();

            Order order = new Order(user, "request", length, width, roof, roofAngle, shedLength, shedWidth, remarks, BOM);
            orderFacade.saveOrder(order);

            ArrayList<Order> orders = (ArrayList<Order>) session.getAttribute("customerrequests");
            orders.add(order);
            session.setAttribute("customerrequests", orders);


        } catch (UserException e) {
            e.printStackTrace();
        }


        return pageToShow;
    }
}
