package web.commands;

import business.entities.Material;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class EditMaterialListCommand extends CommandProtectedPage{
    public EditMaterialListCommand(String pageToShow, String role) {
        super(pageToShow, role);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        ArrayList<Material> materials = (ArrayList<Material>) session.getAttribute("materials");

        //bruges for ikke at ændre direkte i materials-listen med det samme, når der laves ændringer inden det gemmes
        session.setAttribute("editmateriallist",materials);

        return pageToShow;
    }
}
