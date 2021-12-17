package web.commands;

import business.entities.Material;
import business.exceptions.UserException;
import business.services.MaterialFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class MaterialListCommand extends CommandProtectedPage{
    private MaterialFacade materialFacade;

    public MaterialListCommand(String pageToShow, String role) {
        super(pageToShow, role);
        materialFacade = new MaterialFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        try {
            ArrayList<Material> materials = materialFacade.getAllMaterials();
            session.setAttribute("materials", materials);
        } catch (UserException e) {
            e.printStackTrace();
        }

        return pageToShow;
    }
}
