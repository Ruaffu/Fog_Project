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
        svg.drawRem(15,order.getCarportWidth(), order.getCarportLength());


//        svg.drawPost(findQuantity("stolpe"), order.getCarportLength(), order.getCarportWidth());

        svg.drawMetalBand();

        svg.drawRafter();
        svg.addMarker();
        svg.addArrow(10,10,10,587);
        svg.addText(30,300,-90,570,"cm");
        svg.addArrow(15,610,795,610);
        svg.addText(400,630,0,780,"cm");

        String drawing = svg.toString();

        return drawing;
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
