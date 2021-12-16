package business.calculators;

import static java.lang.Math.ceil;

public class SVGHelper {

    protected final int OFFSET_W1 = 350;
    protected final int OFFSET_W2 = 350;
    protected final int MAX_WIDTH = 6000 - (OFFSET_W1 + OFFSET_W2);

    private final int OFFSET_L1 = 1000;
    private final int OFFSET_L2 = 200;
    private final int MAX_LENGTH = 3300;

    private final int MAX_WIDTH_SHED = 3000;

    int carportWidth,
            carportLength,
            shedWidth,
            shedLength;



    public SVGHelper(int carportWidth, int carportLength, int shedWidth, int shedLength) {
        this.carportWidth = carportWidth * 10;
        this.carportLength = carportLength * 10;
        this.shedWidth = shedWidth * 10;
        this.shedLength = shedLength * 10;
    }

    public int calcPostsCarPort() {
        // shed with the offset at the back of the carport
        int shedWithOffset = shedLength + OFFSET_L2;
        // the carport length without shed
        int baseCarport = carportLength - shedWithOffset;

        // quantity for base carport
        int quantityByWidth = amountOfPosts(carportWidth, MAX_WIDTH, OFFSET_W1, OFFSET_W2);
        int quantityByLength = amountOfPosts(baseCarport, MAX_LENGTH, OFFSET_L1, 0);

        // amount of Posts Width multiplied by amount of Posts Length
        return quantityByWidth * quantityByLength;
    }

    public int calcPostsShedLength() {
        // quantity for shed
        return amountOfPosts(shedLength, MAX_LENGTH, 0, OFFSET_L2);
    }
    public int calcPostsShedWidth() {
        // quantity for shed
        int quantityByWidthShed = amountOfPosts(shedWidth, MAX_WIDTH_SHED, 0, 0);

        int shedWidthOffset = 30;
        if (!((carportWidth - shedWidthOffset) == shedWidth)){
            quantityByWidthShed += 1;
        }

        return quantityByWidthShed;
    }

    public int calcPostsShed() {
        // quantity for shed
        int quantityByWidthShed = amountOfPosts(shedWidth, MAX_WIDTH_SHED, 0, 0);
        int quantityByLengthShed = amountOfPosts(shedLength, MAX_LENGTH, 0, OFFSET_L2);

        //
        return quantityByWidthShed * quantityByLengthShed;
    }

    private int amountOfPosts(int carportLengthOrWidth, int maxLengthOrWidth, int offset1, int offset2) {
        return ((int) (ceil((double) (carportLengthOrWidth - (offset1 + offset2)) / (double) maxLengthOrWidth))) + 1;
    }
}
