package web.commands;

import business.entities.User;
import business.persistence.Database;
import business.services.UserFacade;
import business.exceptions.UserException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        String city = request.getParameter("city");
        String phonenr = request.getParameter("phonenr");

        if (password1.equals(password2)) {
            User user = userFacade.createUser(email, password1, firstname, lastname, streetname, housenr, zipcode, city, phonenr);
            user.setRole("customer");
            HttpSession session = request.getSession();

            session.setAttribute("email", email);
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRole());
            session.setAttribute("firstname", user.getFirstname());
            session.setAttribute("lastname", user.getLastname());
            session.setAttribute("streetname", user.getHouseNr());



            return REDIRECT_INDICATOR + pageToShow;

        } else {
            request.setAttribute("error", "the two passwords did not match");
            return "registerpage";
        }
    }

}
