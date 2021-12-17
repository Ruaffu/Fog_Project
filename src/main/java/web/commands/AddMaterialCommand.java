package web.commands;

import business.entities.Material;
import business.persistence.MaterialFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class AddMaterialCommand extends CommandProtectedPage{

    private MaterialFacade materialFacade;

    public AddMaterialCommand(String pageToShow, String role) {
        super(pageToShow, role);
        materialFacade = new MaterialFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        float cost = Float.parseFloat(request.getParameter("cost"));
        int length = Integer.parseInt(request.getParameter("length"));
        int height = Integer.parseInt(request.getParameter("height"));
        int width = Integer.parseInt(request.getParameter("width"));
        String unit = request.getParameter("unit");

        Material material = new Material(name, cost, price, length, height, width, unit);
        //materialFacade.saveMaterial(material);

        ArrayList<Material> materials = (ArrayList<Material>) session.getAttribute("editmateriallist");
        materials.add(material);
//        ArrayList<Material> materials = null;
//        try {
//            materials = materialFacade.getAllMaterials();
//        } catch (UserException e) {
//            e.printStackTrace();
//        }
        session.setAttribute("editmateriallist", materials);

        return pageToShow;
    }
}
