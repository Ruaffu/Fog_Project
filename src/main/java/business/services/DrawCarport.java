package business.services;

import business.entities.Material;
import business.entities.Order;

import java.util.ArrayList;

public class DrawCarport
{
    private Order order;

    public DrawCarport(Order order)
    {
        this.order = order;
    }

    public String drawFullCarport()
    {
        SVG svg = new SVG(0,0,"0 0 855 855",100, 100);
        svg.addMarker();
        svg.addArrow(15,10,15,587);
        svg.addText(15,300,-90, order.getCarportWidth(), "cm");
        svg.addArrow(20,610,795,610);
        svg.addText(400,630,0, order.getCarportLength(), "cm");

        svg.SVGNest(20,0,"0 0 855 810",100, 100);
        svg.drawFrame();
        svg.drawRem(15,order.getCarportWidth(), order.getCarportLength());

        svg.drawShedWood(210,780,570);
        svg.drawShedPosts(6,780,210,570);

//        svg.drawPost(findQuantity("stolpe"), order.getCarportLength(), order.getCarportWidth());

        svg.drawMetalBand();

        svg.drawRafter();

//        System.out.println(svg.toString());

        return svg.toString();
    }

    public int findQuantity(String type)
    {
        int quantity = 0;
        ArrayList<Material> bom = order.getBOM();
        for (Material material : bom)
        {
            if (material.getType().equals(type))
            {
                quantity = material.getQuantity();
            }

        }
        return quantity;
    }
}
