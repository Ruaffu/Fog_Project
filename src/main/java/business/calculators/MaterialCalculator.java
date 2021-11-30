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

    public ArrayList<Material> BOMCalculator(int carportWidth, int carportLength) throws UserException
    {
        //#magic :)
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
    public Material newItem(int quantity, int materialID, Material material) {
        return new Material(materialID,
                material.getName(),
                material.getType(),
                material.getDescription(),
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
        int materialID = 1601;
        Material material = materialFacade.getMaterialByID(1601); //TODO: fix id

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

        bom.add(newItem(quantity, materialID, material));
    }

    // Remme
    private void calcBeam(int carportWidth, int carportLength) throws UserException {

        // Get materials from database
        String type = "Remme i sider, sadles ned i stolper";
        List<Material> materialList = materialFacade.getMaterialByType(type); //TODO: fix type

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
                bom.add(newItem(quantity, materialList.get(i).getId(), materialList.get(i))); //TODO: fix calculation
                length -= availableLengths.get(i);
            }
        }

        // Minimum length
        if (length > 0) {
            bom.add(newItem(quantity, materialList.get(0).getId(), materialList.get(0)));
        }

    }

    // Spær
    private void calcRafter(int carportWidth, int carportLength) throws UserException {

        // Get materials from database
        String type = "Spær, monteres på rem";
        List<Material> materialList = materialFacade.getMaterialByType(type); //TODO: fix type

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
                bom.add(newItem(quantity, materialList.get(i).getId(), materialList.get(i))); //TODO: fix calculation
                length -= availableLengths.get(i);
            }
        }

        // Minimum length
        if (length > 0) {
            bom.add(newItem(quantity, materialList.get(0).getId(), materialList.get(0)));
        }

    }

    // Stern
    private void calcStern(int quantity, int length, String type) throws UserException {

        // Get materials from database
        List<Material> materialList = materialFacade.getMaterialByType(type); //TODO: fix type

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
                    bom.add(newItem(quantity, materialList.get(i).getId(), materialList.get(i)));
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
            bom.add(newItem(quantity, materialList.get(0).getId(), materialList.get(0)));
        }

    }

    private void calcSternUnderFrontAndBack(int carportWidth) throws UserException {
        String type = "Understernbrædder til for- & bagende";
        int surfaceAmount = 2;
        calcStern(surfaceAmount, carportWidth, type);
    }

    private void calcSternUnderSides(int carportLength) throws UserException {
        String type = "Understernbrædder til siderne";
        int surfaceAmount = 2;
        calcStern(surfaceAmount, carportLength, type);
    }

    private void calcSternOverFront(int carportWidth) throws UserException {
        String type = "Oversternbrædder til forende";
        int surfaceAmount = 1;
        calcStern(surfaceAmount, carportWidth, type);
    }

    private void calcSternOverSides(int carportLength) throws UserException {
        String type = "Oversternbrædder til siderne";
        int surfaceAmount = 2;
        calcStern(surfaceAmount, carportLength, type);
    }

    private void calcSternWaterFront(int carportWidth) throws UserException {
        String type = "Oversternbrædder til siderne";
        int surfaceAmount = 1;
        calcStern(surfaceAmount, carportWidth, type);
    }

    private void calcSternWaterSides(int carportLength) throws UserException {
        String type = "Oversternbrædder til siderne";
        int surfaceAmount = 2;
        calcStern(surfaceAmount, carportLength, type);
    }
    //</editor-fold>

    //<editor-fold desc="Roofing">
    // Tag
    private void calcRoofing(int carportWidth, int carportLength) throws UserException {

        // Get materials from database
        String type = "Tagplader monteres på spær";
        List<Material> materialList = materialFacade.getMaterialByType(type); //TODO: fix type

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

                bom.add(newItem(quantity, materialList.get(i).getId(), materialList.get(i)));
                length -= availableLengths.get(i) - overlapLength;
            }
        }

        // Minimum length
        if (length > 0) {

            // Width count
            int itemWidth = materialList.get(0).getWidth() - overlapWidth;
            quantity = (int) ceil((double) carportWidth / (double) itemWidth);

            bom.add(newItem(quantity, materialList.get(0).getId(), materialList.get(0)));
        }

    }
    //</editor-fold>
}