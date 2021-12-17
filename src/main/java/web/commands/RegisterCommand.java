package web.commands;

import business.entities.Order;
import business.entities.User;
import business.persistence.UserFacade;
import business.exceptions.UserException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class RegisterCommand extends CommandUnprotectedPage {
    private UserFacade userFacade;

    public RegisterCommand(String pageToShow) {
        super(pageToShow);
        userFacade = new UserFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        String email = request.getParameter("email");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String streetname = request.getParameter("streetname");
        String housenr = request.getParameter("housenr");
        String zipcode = request.getParameter("zipcode");
        String phonenr = request.getParameter("phonenr");

        if (password1.equals(password2)) {
            User user = userFacade.createUser(email, password1, firstname, lastname, streetname, housenr, zipcode, phonenr);
            user.setRole("customer");
            HttpSession session = request.getSession();

            user = userFacade.login(email, password1);

            session.setAttribute("email", email);
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRole());


            ArrayList<Order> customerRequests = new ArrayList<>();
            session.setAttribute("customerrequests", customerRequests);

            return REDIRECT_INDICATOR + pageToShow;

        } else {
            request.setAttribute("error", "the two passwords did not match");
            return "registerpage";
        }
    }

}
