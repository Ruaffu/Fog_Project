package web.commands;

import business.entities.Order;
import business.exceptions.UserException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RemoveFromBOMListCommand extends CommandProtectedPage{
    public RemoveFromBOMListCommand(String pageToShow, String role) {
        super(pageToShow, role);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)  {
        HttpSession session = request.getSession();

        int materialID = Integer.parseInt(request.getParameter("materialid"));
        Order order = (Order) session.getAttribute("makeoffer");
        order.getBOM().remove(materialID);

        session.setAttribute("makeoffer", order);

        return "bompage";
    }
}
