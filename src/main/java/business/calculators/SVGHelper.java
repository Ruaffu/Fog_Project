package business.calculators;

import business.persistence.Database;

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

    // shed with the offset at the back of the carport
    private final int shedWithOffset = shedLength + OFFSET_L2;
    // the carport length without shed
    private final int baseCarport = carportLength - shedWithOffset;

    public SVGHelper(int carportWidth, int carportLength, int shedWidth, int shedLength) {
        this.carportWidth = carportWidth;
        this.carportLength = carportLength;
        this.shedWidth = shedWidth;
        this.shedLength = shedLength;
    }

    public int calcPostsCarPort() {
        // quantity for base carport
        int quantityByWidth = amountOfPosts(carportWidth, MAX_WIDTH, OFFSET_W1, OFFSET_W2);
        int quantityByLength = amountOfPosts(baseCarport, MAX_LENGTH, OFFSET_L1, 0);

        // amount of Posts Width multiplied by amount of Posts Length
        return quantityByWidth * quantityByLength;
    }

    public int calcPostsShed() {
        // quantity for shed
        int quantityByWidthShed = amountOfPosts(shedWidth, MAX_WIDTH_SHED, 0, 0);
        int quantityByLengthShed = amountOfPosts(shedLength, MAX_LENGTH, 0, OFFSET_L2);

        // amount of Posts Width multiplied by amount of Posts Length
        return quantityByWidthShed * quantityByLengthShed;
    }

    protected int amountOfPosts(int carportLengthOrWidth, int maxLengthOrWidth, int offset1, int offset2) {
        return ((int) (ceil((double) (carportLengthOrWidth - (offset1 + offset2)) / (double) maxLengthOrWidth))) + 1;
    }
}
