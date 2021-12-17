package web.commands;

import business.entities.Material;
import business.entities.Order;
import business.exceptions.UserException;
import business.services.MaterialFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class BOMCopyCommand  extends CommandProtectedPage
{
    MaterialFacade materialFacade;
    public BOMCopyCommand(String pageToShow, String role)
    {
        super(pageToShow, role);
        materialFacade = new MaterialFacade(database);
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
