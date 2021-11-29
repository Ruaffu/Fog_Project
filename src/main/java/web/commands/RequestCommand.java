package web.commands;

import business.services.OrderFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RequestCommand extends CommandProtectedPage
{
    OrderFacade orderFacade;
    public RequestCommand(String pageToShow, String role)
    {
        super(pageToShow, role);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
        int length = Integer.parseInt(request.getParameter("length"));
        int width = Integer.parseInt(request.getParameter("width"));
        String roof = request.getParameter("roof");
        int roofAngle = Integer.parseInt(request.getParameter("roofangle"));
        int shedLength = Integer.parseInt(request.getParameter("shedlength"));
        int shedWidth = Integer.parseInt(request.getParameter("shedwidth"));

        request.setAttribute("length",length);
        request.setAttribute("width",width);
        request.setAttribute("roof",roof);
        request.setAttribute("roofangle",roofAngle);
        request.setAttribute("shedwidth",shedWidth);
        request.setAttribute("shedlength",shedLength);
        return pageToShow;
    }
}
