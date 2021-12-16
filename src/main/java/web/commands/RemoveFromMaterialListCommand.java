package web.commands;

import business.entities.Material;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class RemoveFromMaterialListCommand extends CommandProtectedPage{
    public RemoveFromMaterialListCommand(String pageToShow, String role) {
        super(pageToShow, role);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)  {
        HttpSession session = request.getSession();

        int materialIndex = Integer.parseInt(request.getParameter("materialindex"));
        ArrayList<Material> materials = (ArrayList<Material>) session.getAttribute("editmateriallist");
        materials.remove(materialIndex);

        session.setAttribute("editmateriallist", materials);

        return pageToShow;
    }
}
