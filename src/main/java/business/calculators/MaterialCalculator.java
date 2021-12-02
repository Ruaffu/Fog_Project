package business.calculators;

import business.entities.Material;
import business.exceptions.UserException;
import business.persistence.Database;
import business.services.MaterialFacade;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import static java.lang.Math.ceil;

public class MaterialCalculator {
    MaterialFacade materialFacade;
    ArrayList<Material> bom = new ArrayList<>();

    private final int OFFSET_L1 = 1000;
    private final int OFFSET_L2 = 200;
    private final int MAX_LENGTH = 3300;

    private final int OFFSET_W1 = 350;
    private final int OFFSET_W2 = 350;
    private final int MAX_WIDTH = 6000 - (OFFSET_W1 + OFFSET_W2);

    public MaterialCalculator(Database database) {
        materialFacade = new MaterialFacade(database);
    }

    public ArrayList<Material> BOMCalculator(int carportWidth, int carportLength, int shedLength, int shedWidth) throws UserException {

        carportLength *= 10;
        carportWidth *= 10;

        calcPost(carportWidth, carportLength);
        calcBeam(carportWidth, carportLength);
        calcRafter(carportWidth, carportLength);
        calcSternUnderFrontAndBack(carportWidth);
        calcSternUnderSides(carportLength);
        calcSternOverFront(carportWidth);
        calcSternOverSides(carportLength);
        calcSternWaterFront(carportWidth);
        calcSternWaterSides(carportLength);
        calcFlatRoofing(carportWidth, carportLength);

        return bom;
    }

    public Material newItem(int quantity, int materialID, String description, Material material) {
        return new Material(materialID,
                material.getName(),
                material.getType(),
                description,
                material.getCost(),
                material.getPrice(),
                material.getLength(),
                material.getHeight(),
                material.getWidth(),
                material.getUnit(),
                quantity);
    }

    // Stolper
    private void calcPost(int carportWidth, int carportLength) throws UserException {

        // Get material
        String description = "Stolper nedgraves 90 cm. i jord";
        String name = "97x97 mm. trykimp. Stolpe";
        List<Material> materialList = materialFacade.getMaterialByName(name);

        // Calculate
        System.out.println("carportWidth:" + carportWidth);
        System.out.println("carportLength:" + carportLength);
        int quantityByWidth = amountOfPosts(carportWidth, MAX_WIDTH, OFFSET_W1, OFFSET_W2);
        int quantityByLength = amountOfPosts(carportLength, MAX_LENGTH, OFFSET_L1, OFFSET_L2);

        // amount of Posts Width multiplied by amount of Posts Length
        int quantity = quantityByWidth * quantityByLength;

        bom.add(newItem(quantity, materialList.get(0).getId(), description, materialList.get(0)));
    }

    // Remme
    private void calcBeam(int carportWidth, int carportLength) throws UserException {

        // Get materials from database
        String description = "Remme i sider, sadles ned i stolper";
        String name = "45x195 mm. spærtræ ubh.";
        List<Material> materialList = materialFacade.getMaterialByName(name);

        // Calculate
        // amount of beams
        int quantity = (int) ceil((double) (carportWidth - (OFFSET_W1 + OFFSET_W2)) / (double) MAX_WIDTH) + 1;

        // sort list by length... from short to long
        materialList.sort(Comparator.comparing(Material::getLength));
        Collections.reverse(materialList);

        // amount of materials pr beam
        useOfMaterials(carportLength, quantity, description, materialList, "Beam");
    }

    // Spær
    private void calcRafter(int carportWidth, int carportLength) throws UserException {

        // Get materials from database
        String description = "Spær, monteres på rem";
        String name = "45x195 mm. spærtræ ubh.";
        List<Material> materialList = materialFacade.getMaterialByName(name);

        // Calculate
        int maxWidth = 550;
        int quantity = (int) ceil((double) carportLength / (double) maxWidth);

        // sort list by length... from short to long
        materialList.sort(Comparator.comparing(Material::getLength));
        Collections.reverse(materialList);

        // amount of materials pr beam
        useOfMaterials(carportWidth, quantity, description, materialList, "Rafter");
    }

    // Stern
    private void calcStern(int quantity, int length, String description, String name) throws UserException {

        // Get materials from database
        List<Material> materialList = materialFacade.getMaterialByName(name);

        // sort list by length... from short to long
        materialList.sort(Comparator.comparing(Material::getLength));
        Collections.reverse(materialList);

        // Calculate
        useOfMaterials(length, quantity, description, materialList, "Stern");
    }

    private void calcSternUnderFrontAndBack(int carportWidth) throws UserException {
        String description = "Understernbrædder til for- & bagende";
        String name = "25x200 mm. trykimp. Brædt";
        int surfaceAmount = 2;
        calcStern(surfaceAmount, carportWidth, description, name);
    }

    private void calcSternUnderSides(int carportLength) throws UserException {
        String description = "Understernbrædder til siderne";
        String name = "25x200 mm. trykimp. Brædt";
        int surfaceAmount = 2;
        calcStern(surfaceAmount, carportLength, description, name);
    }

    private void calcSternOverFront(int carportWidth) throws UserException {
        String description = "Oversternbrædder til forende";
        String name = "25x125 mm. trykimp. Brædt";
        int surfaceAmount = 1;
        calcStern(surfaceAmount, carportWidth, description, name);
    }

    private void calcSternOverSides(int carportLength) throws UserException {
        String description = "Oversternbrædder til siderne";
        String name = "25x125 mm. trykimp. Brædt";
        int surfaceAmount = 2;
        calcStern(surfaceAmount, carportLength, description, name);
    }

    private void calcSternWaterFront(int carportWidth) throws UserException {
        String description = "Vandbrædder til forende";
        String name = "19x100 mm. trykimp. Brædt";
        int surfaceAmount = 1;
        calcStern(surfaceAmount, carportWidth, description, name);
    }

    private void calcSternWaterSides(int carportLength) throws UserException {
        String description = "Vandbrædder til siderne";
        String name = "19x100 mm. trykimp. Brædt";
        int surfaceAmount = 2;
        calcStern(surfaceAmount, carportLength, description, name);
    }

    // Tag
    private void calcFlatRoofing(int carportWidth, int carportLength) throws UserException {

        // Get materials from database
        String description = "Tagplader monteres på spær";
        String name = "Plastmo Ecolite blåtonet";
        List<Material> materialList = materialFacade.getMaterialByName(name);

        // sort list by length... from short to long
        materialList.sort(Comparator.comparing(Material::getLength));
        Collections.reverse(materialList);

        // Calculate
        int overlapWidth = 70;

        int roofTileWidth = materialList.get(0).getWidth();

        int quantityWidth;

        //calc quantity
        quantityWidth = (int) ceil((double) carportWidth / (double) (roofTileWidth - overlapWidth));

        //calculate
        useOfMaterials(carportLength, quantityWidth, description, materialList, "FlatRoof");
    }

    /**
     * helper functions
     **/

    private void useOfMaterials(int carportLengthOrWidth, int quantity, String description, List<Material> materialList, String MaterialType) {

        // checks for perfect fit material
        for (Material material : materialList) {
            if (material.getLength() == carportLengthOrWidth) {
                bom.add(newItem(quantity, material.getId(), description, material));
                return;
            }
        }

        // if not... checks if carport is longer than the longest material
        Material material;
        if (carportLengthOrWidth > materialList.get(0).getLength()) {
            // if longer... then it splits it in to 2;
            ArrayList<Integer> offsets = new ArrayList<>();

            // offset MaterialType
            switch (MaterialType) {
                case "Beam": {
                    int spaceBetweenPostLength = spaceBetweenPostLength(carportLengthOrWidth, OFFSET_L1, OFFSET_L2, MAX_LENGTH);

                    offsets.add(spaceBetweenPostLength + OFFSET_L1);
                    offsets.add(spaceBetweenPostLength + OFFSET_L2);
                    break;
                }
                case "Rafter": {
                    int spaceBetweenPostLength = spaceBetweenPostLength(carportLengthOrWidth, 0, 0, MAX_WIDTH);

                    offsets.add(spaceBetweenPostLength);
                    offsets.add(spaceBetweenPostLength);
                    break;
                }
                case "Stern": {
                    quantity *= 2;
                    offsets.add(carportLengthOrWidth / 2);
                    break;
                }
                case "FlatRoof": {
                    int overlapLength = 200;
                    quantity *= 2;
                    offsets.add((carportLengthOrWidth + overlapLength) / 2);

                    break;
                }
            }

            // then it looks for best fit of materials
            for (Integer offset : offsets) {
                material = bestFitMaterial(materialList, offset);
                bom.add(newItem(quantity, material.getId(), description, material));
            }
        } else {
            //if not longer... then it checks for the best fit
            material = bestFitMaterial(materialList, carportLengthOrWidth);
            bom.add(newItem(quantity, material.getId(), description, material));
        }
    }

    public Material bestFitMaterial(List<Material> materialList, int length) {
        Material material = materialList.get(0);
        int bestFit = material.getLength() - length;

        // runs through materials to find the one with the lowest waste of wood
        for (Material m : materialList) {
            int wastedWood = m.getLength() - length;

            if (bestFit > wastedWood && wastedWood >= 0) {
                bestFit = wastedWood;
                material = m;
            }
        }
        return material;
    }

    private int amountOfPosts(int carportLengthOrWidth, int maxLengthOrWidth, int offset1, int offset2) {

        System.out.println("length/width - offset: " + (carportLengthOrWidth - (offset1 + offset2)));
        System.out.println("length/width - offset / max length/width: " + (ceil((double) (carportLengthOrWidth - (offset1 + offset2)) / (double) maxLengthOrWidth)));

        System.out.println("amount of post: " + ((int) (ceil((double) (carportLengthOrWidth - (offset1 + offset2)) / (double) maxLengthOrWidth))) + 1);

        return ((int) (ceil((double) (carportLengthOrWidth - (offset1 + offset2)) / (double) maxLengthOrWidth))) + 1;
    }

    private int spaceBetweenPostLength(int carportLength, int offset1, int offset2, int maxLengthOrWidth) {
        int innerCarportLengthOrWidth = (carportLength - (offset1 + offset2));
        int innerPosts = amountOfPosts(carportLength, maxLengthOrWidth, offset1, offset2) - 1;

        return innerCarportLengthOrWidth / innerPosts;
    }
}