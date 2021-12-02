package business.calculators;

import business.entities.Material;
import business.exceptions.UserException;
import business.persistence.Database;

import java.util.ArrayList;
import java.util.List;

public class FlatRoofWithShedCalc extends MaterialCalculator{

    private final int OFFSET_L1 = 1000;
    private final int OFFSET_L2 = 200;
    private final int MAX_LENGTH = 3300;

    private final int MAX_WIDTH_SHED = 3000;

    public FlatRoofWithShedCalc(Database database, int carportWidth, int carportLength, int shedWidth, int shedLength) {
        super(database, carportWidth, carportLength, shedWidth, shedLength);
    }


    public ArrayList<Material> BOMCalculator() throws UserException {
        // shed with the offset at the back of the carport
        int shedWithOffset = shedLength + OFFSET_L2;
        // the carport length without shed
        int baseCarport = carportLength - shedWithOffset;

        calcPost();

        calcBeam(carportWidth, shedWithOffset);
        calcBeam(carportWidth, baseCarport);

        // adds roof overlap
        int roofOverlap = 200;
        calcFlatRoofing(carportWidth, shedWithOffset + roofOverlap);
        calcFlatRoofing(carportWidth, baseCarport);

        addDoorMaterials();

        calcRafter(carportWidth, carportLength);
        calcSternUnderFrontAndBack(carportWidth);
        calcSternUnderSides(carportLength);
        calcSternOverFront(carportWidth);
        calcSternOverSides(carportLength);
        calcSternWaterFront(carportWidth);
        calcSternWaterSides(carportLength);

        calcShedWood();

        return bom;
    }

    protected void calcPost() throws UserException {
        // shed with the offset at the back of the carport
        int shedWithOffset = shedLength + OFFSET_L2;
        // the carport length without shed
        int baseCarport = carportLength - shedWithOffset;

        // Get material
        String description = "Stolper nedgraves 90 cm. i jord";
        String name = "97x97 mm. trykimp. Stolpe";
        List<Material> materialList = makeMaterialList(name);

        // Calculate
        // quantity for base carport
        int quantityByWidth = amountOfPosts(carportWidth, MAX_WIDTH, OFFSET_W1, OFFSET_W2);
        int quantityByLength = amountOfPosts(baseCarport, MAX_LENGTH, OFFSET_L1, 0);

        // quantity for shed
        int quantityByWidthShed = amountOfPosts(shedWidth, MAX_WIDTH_SHED, 0, 0);
        int quantityByLengthShed = amountOfPosts(shedLength, MAX_LENGTH, 0, OFFSET_L2);

        // amount of Posts Width multiplied by amount of Posts Length
        int quantityBase = quantityByWidth * quantityByLength;
        int quantityShed = quantityByWidthShed * quantityByLengthShed;

        int sharedPosts = 2;

        // post for the shed door
        int doorPost = 1;

        // total quantity
        int quantity = (quantityBase + quantityShed + doorPost) - sharedPosts;

        System.out.println(materialList.get(0).getName());
        bom.add(newItem(quantity, materialList.get(0).getId(), description, materialList.get(0)));
    }

    private void addDoorMaterials() throws UserException {
        Material material;

        // batten for the backside of the door;
        material = materialFacade.getMaterial("38x73 mm. Lægte ubh.");
        bom.add(newItem(1, material.getId(), "til z på bagside af dør", material));

        // door handle
        material = materialFacade.getMaterial("stalddørsgreb 50x75");
        bom.add(newItem(1, material.getId(), "Til lås på dør i skur", material));

        // hinges
        material = materialFacade.getMaterial("t hængsel 390 mm");
        bom.add(newItem(2, material.getId(), "Til skurdør", material));
    }

    // løsholter
    private  void calcShedWood() throws UserException {
        // Get material
        String description = "løsholter til skur gavle";
        String name = "45x95 mm. Reglar ubh.";
        List<Material> materialList = makeMaterialList(name);

        // calculates Wood for both Gables
        int quantityOfShedWoodWidth = amountOfPosts(shedWidth, MAX_WIDTH_SHED, 0, 0) - 1;
        int materialSizeWidth = shedWidth / quantityOfShedWoodWidth;

        int numbersOfGables = 2;
        int quantityOfBothGables = quantityOfShedWoodWidth * 3 * numbersOfGables;

        useOfMaterials(materialSizeWidth, quantityOfBothGables, description, materialList,null);

        // calculates Wood for both sides;
        description = "løsholter til skur sider";

        int quantityOfShedWoodLength = amountOfPosts(shedLength, MAX_LENGTH, 0, OFFSET_L2) - 1;
        int materialSizeLength = shedLength / quantityOfShedWoodWidth;

        int numbersOfSides = 2;
        int quantityOfBothSides = quantityOfShedWoodLength * 3 * numbersOfSides;

        useOfMaterials(materialSizeLength, quantityOfBothSides, description, materialList, null);
    }
}
