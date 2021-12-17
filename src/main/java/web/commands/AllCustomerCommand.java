package web.commands;

import business.entities.User;
import business.exceptions.UserException;
import business.persistence.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class AllCustomerCommand extends CommandProtectedPage
{
    private UserFacade userFacade;
    public AllCustomerCommand(String pageToShow, String role)
    {
        super(pageToShow, role);
        userFacade = new UserFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {

        HttpSession session = request.getSession();
        try
        {
            ArrayList<User> usersList = userFacade.getAllUsers();
            session.setAttribute("users", usersList);
        } catch (UserException e)
        {
            e.printStackTrace();
        }
        return REDIRECT_INDICATOR + pageToShow;
    }
}
