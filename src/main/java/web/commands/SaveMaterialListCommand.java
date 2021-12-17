package web.commands;

import business.entities.Material;
import business.persistence.MaterialFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class SaveMaterialListCommand extends CommandProtectedPage{

    private MaterialFacade materialFacade;

    public SaveMaterialListCommand(String pageToShow, String role) {
        super(pageToShow, role);
        materialFacade = new MaterialFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        ArrayList<Material> materials = (ArrayList<Material>) session.getAttribute("editmateriallist");
        materialFacade.saveMaterialList(materials);
        session.setAttribute("materials", materials);

        return pageToShow;
    }
}
