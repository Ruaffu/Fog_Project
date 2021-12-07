package business.services;

import business.calculators.FlatRoofWithShedCalc;
import business.calculators.MaterialCalculator;
import business.entities.Material;
import business.entities.Order;
import business.persistence.Database;

import java.util.ArrayList;

public class DrawCarport {
    private Order order;
    FlatRoofWithShedCalc mc;

    public DrawCarport(Order order, Database database) {
        this.order = order;
        mc = new FlatRoofWithShedCalc(database, order.getShedWidth(), order.getCarportLength(), order.getShedWidth(), order.getShedLength());

    }

    public String drawFullCarport() {
        SVG svg = new SVG(0, 0, "0 0 855 855", 100, 100);
        svg.addMarker();
        svg.addArrow(15, 10, 15, 587);
        svg.addText(15, 300, -90, order.getCarportWidth(), "cm");
        svg.addArrow(20, 610, 795, 610);
        svg.addText(400, 630, 0, order.getCarportLength(), "cm");

        svg.SVGNest(20, 0, "0 0 855 810", 100, 100);
        svg.drawFrame();

        svg.drawRem(15, order.getCarportWidth(), order.getCarportLength());
        svg.drawRafter(findQuantity("spær"), order.getCarportLength(), order.getCarportWidth());

        svg.drawShedWood(order.getShedLength(), order.getCarportLength(), order.getShedWidth());

        int postShed = mc.calcPostsShed();
        int postCarport = mc.calcPostsCarPort();

        svg.drawPost(postCarport, order.getCarportLength()-order.getShedLength(), order.getCarportWidth());
        svg.drawShedPosts(postShed, order.getCarportLength(), order.getShedLength(), order.getShedWidth());

        svg.drawMetalBand(order.getCarportLength() - order.getShedLength(), order.getCarportWidth());


//        System.out.println(svg.toString());

        return svg.toString();
    }

    public int findQuantity(String type) {
        int quantity = 0;
        ArrayList<Material> bom = order.getBOM();
        for (Material material : bom) {
            if (material.getType().equals(type)) {
                quantity = material.getQuantity();
            }

        }
        return quantity;
    }
}
