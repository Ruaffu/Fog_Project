package web.commands;

import business.calculators.FlatRoofCalc;
import business.calculators.FlatRoofWithShedCalc;
import business.calculators.MaterialCalculator;
import business.entities.Material;
import business.entities.Order;
import business.exceptions.UserException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class UpdateCarportCommand extends CommandProtectedPage{
    MaterialCalculator MC;
    public UpdateCarportCommand(String pageToShow, String role) {
        super(pageToShow, role);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("makeoffer");

        int length = Integer.parseInt(request.getParameter("length"));
        int width = Integer.parseInt(request.getParameter("width"));
        String roof = request.getParameter("roof");
        int roofAngle = Integer.parseInt(request.getParameter("roofangle"));
        int shedLength = Integer.parseInt(request.getParameter("shedlength"));
        int shedWidth = Integer.parseInt(request.getParameter("shedwidth"));

        order.setCarportLength(length);
        order.setCarportWidth(width);
        order.setRoofType(roof);
        order.setRoofAngle(roofAngle);
        order.setShedLength(shedLength);
        order.setShedWidth(shedWidth);

        if (shedLength > 0){
            MC = new FlatRoofWithShedCalc(database, width, length, shedWidth, shedLength);
        } else {
            MC = new FlatRoofCalc(database, width, length);
        }

        ArrayList<Material> BOM = null;
        try {
            BOM = MC.BOMCalculator();
        } catch (UserException e) {
            e.printStackTrace();
        }

        order.setBOM(BOM);
        order.setTotalPrice(order.priceCalc());
        order.setTotalCost(order.costCalc());
        order.setCoverageRatio(order.coverageRatio());
        session.setAttribute("makeoffer", order);

        return pageToShow;
    }
}
