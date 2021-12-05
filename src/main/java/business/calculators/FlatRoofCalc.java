package business.calculators;

import business.entities.Material;
import business.exceptions.UserException;
import business.persistence.Database;

import java.util.ArrayList;
import java.util.List;

public class FlatRoofCalc extends MaterialCalculator{

    private int OFFSET_L1 = 1000;
    private int OFFSET_L2 = 1000;
    private final int MAX_LENGTH = 3300;

    private final int OFFSET_W1 = 350;
    private final int OFFSET_W2 = 350;
    private final int MAX_WIDTH = 6000 - (OFFSET_W1 + OFFSET_W2);


    public FlatRoofCalc(Database database, int carportWidth, int carportLength) {
        super(database, carportWidth, carportLength);


    }

    public ArrayList<Material> BOMCalculator() throws UserException {
        calcPost();

        calcBeam(carportLength);
        calcFlatRoofing(carportLength);

        calcRafter();
        calcSternUnderFrontAndBack();
        calcSternUnderSides();
        calcSternOverFront();
        calcSternOverSides();
        calcSternWaterFront();
        calcSternWaterSides();

        return bom;
    }

    protected void calcPost() throws UserException {

        // Get material
        String description = "Stolper nedgraves 90 cm. i jord";
        String name = "97x97 mm. trykimp. Stolpe";
        List<Material> materialList = makeMaterialList(name);

        // Calculate
        int quantityByWidth = amountOfPosts(carportWidth, MAX_WIDTH, OFFSET_W1, OFFSET_W2);
        int quantityByLength = amountOfPosts(carportLength, MAX_LENGTH, OFFSET_L1, OFFSET_L2);

        // amount of Posts Width multiplied by amount of Posts Length
        int quantity = quantityByWidth * quantityByLength;

        bom.add(newItem(quantity, materialList.get(0).getId(), description, materialList.get(0)));
    }


}
