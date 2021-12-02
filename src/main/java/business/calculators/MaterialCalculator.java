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

    public ArrayList<Material> BOMCalculator(int carportWidth, int carportLength) throws UserException {

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
        calcRoofing(carportWidth, carportLength);

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
        int quantityByWidth = amountOfPosts(carportWidth, OFFSET_W1, OFFSET_W2, MAX_WIDTH);
        int quantityByLength = amountOfPosts(carportLength, OFFSET_L1, OFFSET_L2, MAX_LENGTH);

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
        useOfMaterials(carportLength, quantity, description, materialList, "length");
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

        // amount of materials pr beam
        useOfMaterials(carportWidth, quantity, description, materialList, "Rafter");
    }

    // Stern
    private void calcStern(int quantity, int length, String description, String name) throws UserException {

        // Get materials from database
        List<Material> materialList = materialFacade.getMaterialByName(name);

        // Calculate
        int prevLength = 0;
        for (int i = materialList.size() - 1; i > 0; i--) {
            if ((length) >= materialList.get(i).getLength()) {

                if (materialList.get(i).getLength() != prevLength) {
                    bom.add(newItem(quantity, materialList.get(i).getId(), description, materialList.get(i)));
                    prevLength = materialList.get(i).getLength();
                } else {
                    int prevAmount = bom.get(bom.size() - 1).getQuantity();
                    bom.get(bom.size() - 1).setQuantity(prevAmount + quantity);
                }
                length -= materialList.get(i).getLength();

                // Compare lengths to repeat current index
                if (length > materialList.get(i).getLength()) {
                    i++;
                }
            }
        }

        // Minimum length size
        if (length > 0) {
            bom.add(newItem(quantity, materialList.get(0).getId(), description, materialList.get(0)));
        }

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
        String description = "Oversternbrædder til siderne";
        String name = "19x100 mm. trykimp. Brædt";
        int surfaceAmount = 1;
        calcStern(surfaceAmount, carportWidth, description, name);
    }

    private void calcSternWaterSides(int carportLength) throws UserException {
        String description = "Oversternbrædder til siderne";
        String name = "19x100 mm. trykimp. Brædt";
        int surfaceAmount = 2;
        calcStern(surfaceAmount, carportLength, description, name);
    }


    // Tag

    private void calcRoofing(int carportWidth, int carportLength) throws UserException {

        // Get materials from database
        String description = "Tagplader monteres på spær";
        String name = "Plastmo Ecolite blåtonet";
        List<Material> materialList = materialFacade.getMaterialByName(name);

        // Create list with available lengths
        List<Integer> availableLengths = new ArrayList<>();
        for (Material material : materialList) {
            availableLengths.add(material.getLength());
        }

        // Calculate
        int overlapWidth = 70;
        int overlapLength = 200;
        int quantity;

        // Add the right lengths
        int length = carportLength;
        for (int i = availableLengths.size() - 1; i > 0; i--) {
            if ((length) >= availableLengths.get(i)) {

                // Width count
                int itemWidth = materialList.get(i).getWidth() - overlapWidth;
                quantity = (int) ceil((double) carportWidth / (double) itemWidth);

                bom.add(newItem(quantity, materialList.get(i).getId(), description, materialList.get(i)));
                length -= availableLengths.get(i) - overlapLength;
            }
        }

        // Minimum length
        if (length > 0) {

            // Width count
            int itemWidth = materialList.get(0).getWidth() - overlapWidth;
            quantity = (int) ceil((double) carportWidth / (double) itemWidth);

            bom.add(newItem(quantity, materialList.get(0).getId(), description, materialList.get(0)));
        }

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
            if (MaterialType.equals("Beam")) {
                int spaceBetweenPostLength = spaceBetweenPostLength(carportLengthOrWidth, OFFSET_L1, OFFSET_L2, MAX_LENGTH);

                offsets.add(spaceBetweenPostLength + OFFSET_L1);
                offsets.add(spaceBetweenPostLength + OFFSET_L2);

            } else if (MaterialType.equals("Rafter")) {
                int spaceBetweenPostLength = spaceBetweenPostLength(carportLengthOrWidth, 0, 0, MAX_WIDTH);

                offsets.add(spaceBetweenPostLength);
                offsets.add(spaceBetweenPostLength);
            }

            // then it looks for best fit of materials
            for (Integer offset : offsets) {
                material = bestFitMaterial(materialList, offset);
                bom.add(newItem(quantity, material.getId(), description, material));
                return;
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
        return (int) ceil((double) (carportLengthOrWidth - (offset1 + offset2)) / (double) maxLengthOrWidth) + 1;
    }

    private int spaceBetweenPostLength(int carportLength, int offset1, int offset2, int maxLengthOrWidth) {
        int innerCarportLengthOrWidth = (carportLength - (offset1 + offset2));
        int innerPosts = amountOfPosts(carportLength, offset1, offset2, maxLengthOrWidth) - 1;

        return innerCarportLengthOrWidth / innerPosts;
    }
}