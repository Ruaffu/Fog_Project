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

    @Override
    protected void woodCalculator() throws UserException {
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
    }

    @Override
    protected void mountCalculator() throws UserException {
        bottomScrews();
        perforatedTape(carportLength);
        rafterMount();
        sternScrew();
        mountScrews();
        bolt();
    }

    protected void calcPost() throws UserException {

        // Get material
        String description = "Stolper nedgraves 90 cm. i jord";
        String type = "stolpe";
        String name = "97x97 mm. trykimp. Stolpe";
        List<Material> materialList = makeMaterialList(name);

        // Calculate
        int quantityByWidth = amountOfPosts(carportWidth, MAX_WIDTH, OFFSET_W1, OFFSET_W2);
        int quantityByLength = amountOfPosts(carportLength, MAX_LENGTH, OFFSET_L1, OFFSET_L2);

        // amount of Posts Width multiplied by amount of Posts Length
        int quantity = quantityByWidth * quantityByLength;

        bom.add(newItem(quantity, materialList.get(0).getId(), description, type, materialList.get(0)));
    }

    @Override
    protected void bolt() throws UserException {
        // Get materials from database
        Material material = materialFacade.getMaterial("bræddebolt 10 x 120 mm.");
        String type = "bolt";
        String description = "Til montering af rem på stolper";


        int quantity = 0;
        for (Material m : bom) {
            if(m.getType().equals("stolpe")){
                quantity += m.getQuantity();
            }
        }

        int amountOfBoltPrPost = 2;
        quantity *= amountOfBoltPrPost;

        bom.add(newItem(quantity, material.getId(), description, type, material));

        //firkantskiver
        material = materialFacade.getMaterial("firkantskiver 40x40x11mm");
        type = "firkantskriver";

        bom.add(newItem(quantity, material.getId(), description, type, material));
    }


}
