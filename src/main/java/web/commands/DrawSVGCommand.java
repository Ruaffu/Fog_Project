package web.commands;

import business.entities.Order;
import business.exceptions.UserException;
import business.persistence.BOMMapper;
import business.services.OrderFacade;
import business.services.SVG;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DrawSVGCommand extends CommandUnprotectedPage
{
    OrderFacade orderFacade;
    public DrawSVGCommand(String pageToShow)
    {
        super(pageToShow);
        orderFacade = new OrderFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException
    {
        HttpSession session = request.getSession();
//        Order order = orderFacade.

        SVG svg = new SVG(0,0,"0 0 855 855",100, 100);

        svg.drawRem(15,583, 780);

        svg.drawPost(3,780,583);

        svg.drawMetalBand();

        svg.drawRafter();
        svg.addMarker();
        svg.addArrow(10,10,10,587);
        svg.addArrow(15,610,795,610);
        request.setAttribute("svgdrawing", svg.toString());
        return pageToShow;
    }
}
