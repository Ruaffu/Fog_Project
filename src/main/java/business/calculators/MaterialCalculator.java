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

    int offsetW1 = 350;
    int offsetW2 = 350;
    int maxWidth = 6000 - (offsetW1 + offsetW2);
    int offsetL1 = 1000;
    int offsetL2 = 200;
    int maxLength = 3300;


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
        int quantityByWidth = amountOfPostsWidth(carportWidth);
        int quantityByLength = amountOfPostsLength(carportLength);

        // amount of Posts Width multiplied by amount of Posts Length
        int quantity = quantityByWidth * quantityByLength;

        bom.add(newItem(quantity, materialList.get(0).getId(), description, materialList.get(0)));
    }

    private int amountOfPostsLength(int carportLength) {
        int offsetL1 = 1000;
        int offsetL2 = 200;
        int maxLength = 3300;
        return (int) ceil((double) (carportLength - (offsetL1 + offsetL2)) / (double) maxLength) + 1;
    }

    private int amountOfPostsWidth(int carportWidth) {
        int offsetW1 = 350;
        int offsetW2 = 350;
        int maxWidth = 6000 - (offsetW1 + offsetW2);
        return (int) ceil((double) (carportWidth - (offsetW1 + offsetW2)) / (double) maxWidth) + 1;
    }

    private int spaceBetweenPostLength(int carportLength) {
        int offsetL1 = 1000;
        int offsetL2 = 200;
        int innerCarportLength = (carportLength - (offsetL1 + offsetL2));
        int innerPosts = amountOfPostsLength(carportLength) - 1;

        return innerCarportLength / innerPosts;
    }

    // Remme
    private void calcBeam(int carportWidth, int carportLength) throws UserException {

        // Get materials from database
        String description = "Remme i sider, sadles ned i stolper";
        String name = "45x195 mm. spærtræ ubh.";
        List<Material> materialList = materialFacade.getMaterialByName(name);

        // Calculate
        // amount of beams
        int offsetW1 = 350;
        int offsetW2 = 350;
        int maxWidth = 6000 - (offsetW1 + offsetW2);
        int quantity = (int) ceil((double) (carportWidth - (offsetW1 + offsetW2)) / (double) maxWidth) + 1;

        // sort list by length... from short to long
        materialList.sort(Comparator.comparing(Material::getLength));
        Collections.reverse(materialList);

        // amount of materials pr beam
        materialsPrBeam(carportLength, quantity, description, materialList);
    }

    // helper function
    private void materialsPrBeam(int carportLength, int quantity, String description, List<Material> materialList) {
        int materialIDX = 0;
        while (true) {

            // checks for perfect fit beam
            for (Material material : materialList) {
                if (material.getLength() == carportLength) {
                    bom.add(newItem(quantity, material.getId(), description, material));
                    return;
                }
            }
            // checks if longest beam fits
            if (carportLength > materialList.get(materialIDX).getLength()) {
                // if not then it splits it in to 2;
                ArrayList<Integer> offsets = new ArrayList<>();

                int spaceBetweenPostLength = spaceBetweenPostLength(carportLength);
                offsets.add(spaceBetweenPostLength + offsetL1);
                offsets.add(spaceBetweenPostLength + offsetL2);

                // then it looks for best fit of materials
                for (Integer offset : offsets) {
                    Material material = materialList.get(0);
                    int bestFit = material.getLength() - offset;

                    // runs through materials to find the one with the lowest waste of wood
                    for (Material m : materialList) {
                        int wastedWood = m.getLength() - offset;

                        if (bestFit > wastedWood && wastedWood >= 0) {
                            bestFit = wastedWood;
                            material = m;
                        }
                    }
                    bom.add(newItem(quantity, material.getId(), description, material));
                    return;
                }
            } else {
                materialIDX += 1;
                if (materialIDX == materialList.size() - 1) {
                    bom.add(newItem(quantity, materialList.get(materialIDX).getId(), description, materialList.get(materialIDX)));
                    return;
                }
            }
        }
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

        // Add the right lengths

        for (Material material : materialList) {
            if (material.getLength() == carportLength) {
                bom.add(newItem(quantity, material.getId(), description, material));
                return;
            }
        }


//        int length = carportWidth;
//        for (int i = materialList.size() - 1; i > 0; i--) {
//            if ((length) >= materialList.get(i).getLength()) {
//                bom.add(newItem(quantity, materialList.get(i).getId(), description, materialList.get(i))); //TODO: fix calculation
//                length -= materialList.get(i).getLength();
//            }
//        }
//
//        // Minimum length
//        if (length > 0) {
//            bom.add(newItem(quantity, materialList.get(0).getId(), description, materialList.get(0)));
//        }

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
}