package business.services;

import business.calculators.SVGHelper;
import business.entities.Material;
import business.entities.Order;

import java.util.ArrayList;

public class DrawCarport {
    private Order order;
    SVGHelper svgHelper;

    public DrawCarport(Order order) {
        this.order = order;
        svgHelper = new SVGHelper(order.getCarportWidth(), order.getCarportLength(), order.getShedWidth(), order.getShedLength());

    }

    public String drawFullCarportWithShed() {
        SVG svg = new SVG(0, 0, "0 0 855 855", 100, 100);

        //makes first two markers
        makeMarkers(svg);

        // shed width
        svg.addArrow(30, 15, 30, order.getShedWidth() - 15);
        svg.addText(30, order.getCarportWidth()/2, -90, order.getShedWidth(), "cm");

        svg.SVGNest(40, 0, "0 0 900 900", 100, 100);
        svg.drawFrame(order.getCarportLength(), order.getCarportWidth());

        svg.drawRem(0, order.getCarportWidth(), order.getCarportLength());
        svg.drawRafter(findQuantity("spær"), order.getCarportLength(), order.getCarportWidth());

        svg.drawShedWood(order.getShedLength(), order.getCarportLength(), order.getShedWidth());

        int postShed = svgHelper.calcPostsShed();
        int postCarport = svgHelper.calcPostsCarPort();

        svg.drawPost(postCarport, order.getCarportLength() - order.getShedLength(), order.getCarportWidth(), true);
        svg.drawShedPosts(postShed, order.getCarportLength(), order.getShedLength(), order.getShedWidth());

        svg.drawMetalBand(order.getCarportLength() - order.getShedLength(), order.getCarportWidth());

        return svg.toString();
    }

    public String drawFullCarportWithOut() {
        SVG svg = new SVG(0, 0, "0 0 855 855", 100, 100);

        makeMarkers(svg);

        svg.SVGNest(40, 0, "0 0 900 900", 100, 100);
        svg.drawFrame(order.getCarportLength(), order.getCarportWidth());

        svg.drawRem(0, order.getCarportWidth(), order.getCarportLength());
        svg.drawRafter(findQuantity("spær"), order.getCarportLength(), order.getCarportWidth());

        svg.drawPost(findQuantity("stolpe"), order.getCarportLength(), order.getCarportWidth(), false);

        svg.drawMetalBand(order.getCarportLength(), order.getCarportWidth());

        return svg.toString();
    }


    private int findQuantity(String type) {
        int quantity = 0;
        ArrayList<Material> bom = order.getBOM();
        for (Material material : bom) {
            if (material.getType().equals(type)) {
                quantity = material.getQuantity();
            }

        }
        return quantity;
    }

    private void makeMarkers(SVG svg) {
        svg.addMarker();
        // carport width
        svg.addArrow(15, 0, 15, order.getCarportWidth()-30);
        svg.addText(15, order.getCarportWidth()/2, -90, order.getCarportWidth(), "cm");
        // carport length
        svg.addArrow(40, order.getCarportWidth(), order.getCarportLength()+5, order.getCarportWidth());
        svg.addText(order.getCarportLength()/2, order.getCarportWidth() + 15, 0, order.getCarportLength(), "cm");
    }
}
