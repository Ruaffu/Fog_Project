package web.commands;

import business.entities.Material;
import business.entities.Order;
import business.exceptions.UserException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class RemoveFromBOMListCommand extends CommandProtectedPage{
    public RemoveFromBOMListCommand(String pageToShow, String role) {
        super(pageToShow, role);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)  {
        HttpSession session = request.getSession();

        int materialIndex = Integer.parseInt(request.getParameter("materialindex"));
        ArrayList<Material> bomcopy = (ArrayList<Material>) session.getAttribute("bomlist");
        bomcopy.remove(materialIndex);

        session.setAttribute("bomlist", bomcopy);

        return "bompage";
    }
}
