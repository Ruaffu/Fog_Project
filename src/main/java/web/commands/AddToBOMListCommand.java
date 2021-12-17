package web.commands;

import business.entities.Material;
import business.exceptions.UserException;
import business.persistence.MaterialFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class AddToBOMListCommand extends CommandProtectedPage
{
    MaterialFacade materialFacade;
    public AddToBOMListCommand(String pageToShow, String role)
    {
        super(pageToShow, role);
        materialFacade = new MaterialFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        try
        {
            Material material = materialFacade.getMaterial(name);
            material.setDescription(description);
            material.setQuantity(quantity);
            material.setType("added to list");
            ArrayList<Material> bomList = (ArrayList<Material>) session.getAttribute("bomlist");
            bomList.add(material);
            session.setAttribute("bomlist", bomList);

        } catch (UserException e)
        {
            e.printStackTrace();
        }

        return pageToShow;
    }
}
