package business.calculators;

import business.entities.Material;
import business.exceptions.UserException;
import business.persistence.Database;
import business.services.MaterialFacade;

import java.util.ArrayList;
import java.util.List;

import static java.lang.Math.ceil;

public class MaterialCalculator {
    MaterialFacade materialFacade;
    ArrayList<Material> bom = new ArrayList<>();

    public MaterialCalculator(Database database) {
        materialFacade = new MaterialFacade(database);
    }

    public ArrayList<Material> BOMCalculator(int carportWidth, int carportLength) throws UserException {
        //#magic :)

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

    //<editor-fold desc="New Material">
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
    //</editor-fold>

    //<editor-fold desc="Wood">
    // Stolper
    private void calcPost(int carportWidth, int carportLength) throws UserException {

        // Get material
        String description = "Stolper nedgraves 90 cm. i jord";
        String name = "97x97 mm. trykimp. Stolpe";
        List<Material> materialList = materialFacade.getMaterialByName(name);

        // Calculate
        int offsetW1 = 350;
        int offsetW2 = 350;
        int maxWidth = 6000 - (offsetW1 + offsetW2);
        int quantityByWidth = (int) ceil((double) (carportWidth - (offsetW1 + offsetW2)) / (double) maxWidth) + 1;

        int offsetL1 = 1000;
        int offsetL2 = 200;
        int maxLength = 3300;
        int quantityByLength = (int) ceil((double) (carportLength - (offsetL1 + offsetL2)) / (double) maxLength) + 1;

        int quantity = quantityByWidth * quantityByLength;

        bom.add(newItem(quantity, materialList.get(0).getId(), description, materialList.get(0)));
    }

    // Remme
    private void calcBeam(int carportWidth, int carportLength) throws UserException {

        // Get materials from database
        String description = "Remme i sider, sadles ned i stolper";
        String name = "45x195 mm. spærtræ ubh.";
        List<Material> materialList = materialFacade.getMaterialByName(name); //TODO: fix name

        // Create list with available lengths
        List<Integer> availableLengths = new ArrayList<>();
        for (Material material : materialList) {
            availableLengths.add(material.getLength());
        }

        // Calculate
        int offsetW1 = 350;
        int offsetW2 = 350;
        int maxWidth = 6000 - (offsetW1 + offsetW2);
        int quantity = (int) ceil((double) (carportWidth - (offsetW1 + offsetW2)) / (double) maxWidth) + 1;

        // Add the right lengths
        int length = carportLength;
        for (int i = availableLengths.size() - 1; i > 0; i--) {
            if ((length) >= availableLengths.get(i)) {
                bom.add(newItem(quantity, materialList.get(i).getId(), description, materialList.get(i))); //TODO: fix calculation
                length -= availableLengths.get(i);
            }
        }

        // Minimum length
        if (length > 0) {
            bom.add(newItem(quantity, materialList.get(0).getId(), description, materialList.get(0)));
        }

    }

    // Spær
    private void calcRafter(int carportWidth, int carportLength) throws UserException {

        // Get materials from database
        String description = "Spær, monteres på rem";
        String name = "45x195 mm. spærtræ ubh.";
        List<Material> materialList = materialFacade.getMaterialByName(name); //TODO: fix name

        // Create list with available lengths
        List<Integer> availableLengths = new ArrayList<>();
        for (Material material : materialList) {
            availableLengths.add(material.getLength());
        }

        // Calculate
        int maxWidth = 550;
        int quantity = (int) ceil((double) carportLength / (double) maxWidth);

        // Add the right lengths
        int length = carportWidth;
        for (int i = availableLengths.size() - 1; i > 0; i--) {
            if ((length) >= availableLengths.get(i)) {
                bom.add(newItem(quantity, materialList.get(i).getId(), description, materialList.get(i))); //TODO: fix calculation
                length -= availableLengths.get(i);
            }
        }

        // Minimum length
        if (length > 0) {
            bom.add(newItem(quantity, materialList.get(0).getId(), description, materialList.get(0)));
        }

    }

    // Stern
    private void calcStern(int quantity, int length, String description, String name) throws UserException {

        // Get materials from database
        List<Material> materialList = materialFacade.getMaterialByName(name); //TODO: fix name

        // Create list with available lengths
        List<Integer> availableLengths = new ArrayList<>();
        for (Material material : materialList) {
            availableLengths.add(material.getLength());
        }

        // Calculate

        int prevLength = 0;

        for (int i = availableLengths.size() - 1; i > 0; i--) {
            if ((length) >= availableLengths.get(i)) {

                if (availableLengths.get(i) != prevLength) {
                    bom.add(newItem(quantity, materialList.get(i).getId(), description, materialList.get(i)));
                    prevLength = availableLengths.get(i);
                } else {
                    int prevAmount = bom.get(bom.size() - 1).getQuantity();
                    bom.get(bom.size() - 1).setQuantity(prevAmount + quantity);
                }
                length -= availableLengths.get(i);

                // Compare lengths to repeat current index
                if (length > availableLengths.get(i)) {
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
    //</editor-fold>

    //<editor-fold desc="Roofing">
    // Tag
    private void calcRoofing(int carportWidth, int carportLength) throws UserException {

        // Get materials from database
        String description = "Tagplader monteres på spær";
        String name = "Plastmo Ecolite blåtonet";
        List<Material> materialList = materialFacade.getMaterialByName(name); //TODO: fix name

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
    //</editor-fold>
}