package web.commands;

import business.entities.Material;
import business.entities.Order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class BOMCopyCommand  extends CommandProtectedPage
{
    public BOMCopyCommand(String pageToShow, String role)
    {
        super(pageToShow, role);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("makeoffer");

        ArrayList<Material> bom = order.getBOM();

        session.setAttribute("bomlist", bom);

        return pageToShow;
    }
}
