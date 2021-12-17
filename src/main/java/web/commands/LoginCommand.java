package web.commands;

import business.entities.Material;
import business.entities.Order;
import business.entities.User;
import business.services.MaterialFacade;
import business.services.OrderFacade;
import business.services.UserFacade;
import business.exceptions.UserException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class LoginCommand extends CommandUnprotectedPage {
    private UserFacade userFacade;
    private OrderFacade orderFacade;
    private MaterialFacade materialFacade;

    public LoginCommand(String pageToShow) {
        super(pageToShow);
        userFacade = new UserFacade(database);
        orderFacade = new OrderFacade(database);
        materialFacade = new MaterialFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            User user = userFacade.login(email, password);



            HttpSession session = request.getSession();

            session.setAttribute("user", user);
            session.setAttribute("role", user.getRole());
            session.setAttribute("email", email);

            if (user.getRole().equals("customer")) {
                ArrayList<Order> orders = orderFacade.getAllUserOrders(user);
                ArrayList<Order> requests = orderFacade.getAllUserOffersAndRequests(user);
                if (orders == null) {
                    orders = new ArrayList<>();
                }
                if (requests == null) {
                    requests = new ArrayList<>();
                }

                session.setAttribute("customerOrders", orders);
                session.setAttribute("customerrequests", requests);
            }
            if (user.getRole().equals("employee")){
                ArrayList<User> users;
                try
                {
                    users = userFacade.getAllUsers();
                    ArrayList<Order> requests = orderFacade.getAllRequests(users);
                    session.setAttribute("allrequests", requests);
                    ArrayList<Material> materials = materialFacade.getAllMaterials();
                    session.setAttribute("materials", materials);
                    ArrayList<Order> orders = orderFacade.getAllOrders(users);
                    session.setAttribute("allorders", orders);
                } catch (UserException e)
                {
                    e.printStackTrace();
                }



            }

            return REDIRECT_INDICATOR + pageToShow;
        } catch (UserException ex) {
            request.setAttribute("error", "Forkert e-mail eller adgangskode. Prøv igen.");
            return "loginpage";
        }
    }

}
