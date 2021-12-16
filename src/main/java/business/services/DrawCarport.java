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
        SVG svg = new SVG(0, 0, "0 0 800 650", 100, 100);

        //makes first two markers
        makeMarkers(svg);

        // shed width
        svg.addArrow(30, 15, 30, order.getShedWidth() - 15);
        svg.addText(30, order.getCarportWidth()/2, -90, order.getShedWidth(), "cm");

        svg.SVGNest(40, 0, "0 0 845 81", 100, 100);
        svg.drawFrame(order.getCarportLength(), order.getCarportWidth());

        svg.drawRem(0, order.getCarportWidth(), order.getCarportLength());
        svg.drawRafter(findQuantity("spær"), order.getCarportLength(), order.getCarportWidth());

        svg.drawShedWood(order.getShedLength(), order.getCarportLength(), order.getShedWidth());
        svg.drawShedWoodSide(order.getShedLength(), order.getCarportLength(), order.getShedWidth());


        int postsShedLength = svgHelper.calcPostsShedLength();
        int postsShedWidth = svgHelper.calcPostsShedWidth();
        int postsShed = svgHelper.calcPostsShed();
        int postCarport = svgHelper.calcPostsCarPort();

        svg.drawPost(postCarport, order.getCarportLength() - order.getShedLength(), order.getCarportWidth(), true);
        svg.drawShedPosts(postsShed ,postsShedLength, postsShedWidth, order.getCarportLength(), order.getShedLength(), order.getShedWidth());

        svg.drawMetalBand(order.getCarportLength() - order.getShedLength(), order.getCarportWidth());

        return svg.toString();
    }

    public String drawFullCarportWithOut() {
        SVG svg = new SVG(0, 0, "0 0 800 650", 100, 100);

        makeMarkers(svg);

        svg.SVGNest(40, 0, "0 0 845 81", 100, 100);
        svg.drawFrame(order.getCarportLength(), order.getCarportWidth());

        svg.drawRem(0, order.getCarportWidth(), order.getCarportLength());
        svg.drawRafter(findQuantity("spær"), order.getCarportLength(), order.getCarportWidth());

        svg.drawPost(findQuantity("stolpe"), order.getCarportLength(), order.getCarportWidth(), false);

        svg.drawMetalBand(order.getCarportLength(), order.getCarportWidth());

        return svg.toString();
    }

    public String drawFullCarportSideWithOut() {
        SVG svg = new SVG(0, 0, "0 0 800 300", 100, 100);
        int carportHeight = 230;

        makeMarkersSideView(svg, carportHeight);

        svg.SVGNest(40, 0, "0 0 845 81", 100, 100);
//        svg.drawFrame(order.getCarportLength(), order.getCarportWidth());

        svg.drawPostSideView(findQuantity("stolpe"), order.getCarportLength(), order.getCarportWidth(), false);
        svg.drawRemSideView(0, order.getCarportWidth(), order.getCarportLength());

        return svg.toString();
    }

    public String drawFullCarportSideViewWithShed() {
        SVG svg = new SVG(0, 0, "0 0 800 300", 100, 100);

        int carportHeight = 230;
        //makes first two markers
        makeMarkersSideView(svg, carportHeight);

        // shed width
        svg.addArrow(32, 25, 32, carportHeight);
        svg.addText(30, carportHeight/2, -90, 210, "cm");

        svg.SVGNest(40, 0, "0 0 845 81", 100, 100);
//        svg.drawFrameSideView(15,order.getCarportLength(), carportHeight);

        int postShed = svgHelper.calcPostsShed();
        int postCarport = svgHelper.calcPostsCarPort();

        svg.drawPostSideView(postCarport, order.getCarportLength() - order.getShedLength(), order.getCarportWidth(), true);
        svg.drawShedPostsSideView(postShed, order.getCarportLength(), order.getShedLength(), order.getShedWidth());
        svg.drawRemSideView(0, order.getCarportWidth(), order.getCarportLength());
        svg.drawShedCladding(findQuantity("beklædningsbrædder"), order.getShedLength(), order.getCarportWidth(), order.getCarportLength());


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


    private void makeMarkersSideView(SVG svg, int height) {
        svg.addMarker();
        // carport width
        svg.addArrow(14, 15, 14, height);
        svg.addText(12, height/2, -90, height, "cm");
        // carport length
        svg.addArrow(40, height+20, order.getCarportLength(), height+20);
        svg.addText(order.getCarportLength()/2, height + 20, 0, order.getCarportLength(), "cm");
    }
}
