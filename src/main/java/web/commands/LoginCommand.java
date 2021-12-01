package web.commands;

import business.entities.Order;
import business.entities.User;
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

    public LoginCommand(String pageToShow) {
        super(pageToShow);
        userFacade = new UserFacade(database);
        orderFacade = new OrderFacade(database);
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

            return REDIRECT_INDICATOR + pageToShow;
        } catch (UserException ex) {
            request.setAttribute("error", "Wrong username or password!");
            return "loginpage";
        }
    }

}
