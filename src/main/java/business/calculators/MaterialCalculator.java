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

public abstract class MaterialCalculator {
    protected final MaterialFacade materialFacade;
    protected ArrayList<Material> bom;

    protected final int OFFSET_W1 = 350;
    protected final int OFFSET_W2 = 350;
    protected final int MAX_WIDTH = 6000 - (OFFSET_W1 + OFFSET_W2);

    protected int carportLength;
    protected int carportWidth;
    protected int shedWidth;
    protected int shedLength;

    public MaterialCalculator(Database database, int carportWidth, int carportLength, int shedWidth, int shedLength) {
        materialFacade = new MaterialFacade(database);
        bom = new ArrayList<>();
        this.carportWidth = carportWidth * 10;
        this.carportLength = carportLength * 10;
        this.shedWidth = shedWidth * 10;
        this.shedLength = shedLength * 10;
    }

    public MaterialCalculator(Database database, int carportWidth, int carportLength) {
        materialFacade = new MaterialFacade(database);
        bom = new ArrayList<>();
        this.carportWidth = carportWidth * 10;
        this.carportLength = carportLength * 10;
    }

    public ArrayList<Material> BOMCalculator() throws UserException{
        woodCalculator();
        mountCalculator();

        return bom;
    }

    protected abstract void woodCalculator() throws UserException;
    protected abstract void mountCalculator() throws UserException;

    protected abstract void calcPost() throws UserException;

    // methode to create material, with quantity and description
    protected Material newItem(int quantity, int materialID, String description, String type, Material material) {
        return new Material(materialID,
                material.getName(),
                type,
                description,
                material.getCost(),
                material.getPrice(),
                material.getLength(),
                material.getHeight(),
                material.getWidth(),
                material.getUnit(),
                quantity);
    }

    // Remme
    protected void calcBeam(int carLength) throws UserException {

        // Get materials from database
        String description = "Remme i sider, sadles ned i stolper";
        String type = "remme";
        String name = "45x195 mm. spærtræ ubh.";
        List<Material> materialList = makeMaterialList(name);

        // Calculate
        // amount of beams
        int quantity = (int) ceil((double) (carportWidth - (OFFSET_W1 + OFFSET_W2)) / (double) MAX_WIDTH) + 1;

        // amount of materials pr beam
        useOfMaterials(carLength, quantity, description, type, materialList, "Beam");
    }

    // Spær
    protected void calcRafter() throws UserException {

        // Get materials from database
        String description = "Spær, monteres på rem";
        String type = "spær";
        String name = "45x195 mm. spærtræ ubh.";
        List<Material> materialList = makeMaterialList(name);

        // Calculate
        int maxWidth = 550;
        int quantity = (int) ceil((double) carportLength / (double) maxWidth);

        //
        useOfMaterials(carportWidth, quantity, description, type, materialList, "Rafter");
    }

    // Tag
    protected void calcFlatRoofing(int carportLength) throws UserException {

        // Get materials from database
        String description = "Tagplader monteres på spær";
        String type = "tag";
        String name = "Plastmo Ecolite blåtonet";
        List<Material> materialList = makeMaterialList(name);

        // Calculate
        int overlapWidth = 70;

        int roofTileWidth = materialList.get(0).getWidth();

        int quantityWidth;

        //calc quantity
        quantityWidth = (int) ceil((double) carportWidth / (double) (roofTileWidth - overlapWidth));

        //calculate
        useOfMaterials(carportLength, quantityWidth, description, type, materialList, "FlatRoof");
    }

    /** mount and screw **/

    // screws for the roof
    protected void bottomScrews() throws UserException {
        // Get materials from database
        Material material = materialFacade.getMaterial("plastmo bundskruer 200 stk.");
        String type = "bundskruer";
        String description = "Skruer til tagplader";


        int screwPrSQM = 12;
        int carportSQM = (carportLength * carportWidth) / 1000;
        int quantityOfScrews = (int) ceil((double) carportSQM * (double) screwPrSQM);
        int screwPrPack = 200;

        quantityOfScrews = (int) ceil((double) quantityOfScrews * (double) screwPrPack);

        bom.add(newItem(quantityOfScrews, material.getId(), type, description, material));

    }

    protected void perforatedTape(int carportLength) throws UserException {
        // Get materials from database
        Material material = materialFacade.getMaterial("hulbånd 1x20 mm. 10 mtr.");
        String description = "Til vindkryds på spær";
        String type = "hulbånd";

        int tapeRollLength = material.getLength();
        int quantityOfTapeRolls = (int) ceil((Math.sqrt(Math.pow((double) carportLength,2) + Math.pow((double) carportWidth, 2))) / tapeRollLength) * 2;

        bom.add(newItem(quantityOfTapeRolls, material.getId(), description, type, material));
    }

    protected void mountScrews() throws UserException {
        // Get material
        Material material = materialFacade.getMaterial("4,5 x 50 mm. skruer 200 stk.");
        String type = "skrue";
        String description = "Til montering af universalbeslag + hulbånd";

        int amountOfScrewsPrMount = 21;
        int amountOfScrewsPrRafter = 4;

        int quantity = 0;
        for (Material material1 : bom) {
            if (material.getType().equals("universalbeslag")) {
                quantity += material.getQuantity() * amountOfScrewsPrMount;
            }
            if (material.getType().equals("spær")) {
                quantity += material.getQuantity() * amountOfScrewsPrRafter;
            }
        }

        int amountOfScrewPrPack = 200;
        quantity /= amountOfScrewPrPack;

        bom.add(newItem(quantity, material.getId(), description, type, material));
    }

    protected void rafterMount() throws UserException {
        // Get materials from database
        Material materialH = materialFacade.getMaterial("UNIVERSALBESLAG 190MM Højre");
        Material materialV = materialFacade.getMaterial("UNIVERSALBESLAG 190MM Ventre");
        String type = "universalbeslag";
        String description = "Til montering af spær på rem";

        int quantity;
        for (Material material : bom) {
            if (material.getType().equals("spær")){
                quantity = material.getQuantity();

                bom.add(newItem(quantity,materialH.getId(),description,type,materialH));
                bom.add(newItem(quantity,materialV.getId(),description,type,materialV));
            }
        }
    }

    protected void sternScrew() throws UserException {
        // Get materials from database
        Material material = materialFacade.getMaterial("4,5 x 60 mm. skruer 200 stk.");
        String type = "skrue";
        String description = "Til montering af stern & vandbrædt";

        int carportCircuit = (carportLength + carportWidth) * 2;
        int maxWidthRafter = 550;
        int screwsPrPack = 200;

        int quantity = (int) ceil((((double) carportCircuit / (double) maxWidthRafter) * 2) / screwsPrPack);

        bom.add(newItem(quantity, material.getId(), description, type, material));
    }

    protected abstract void bolt() throws UserException;

    /** all stern methods **/

    // Stern
    protected void calcStern(int quantity, int length, String description, String name) throws UserException {
        // Get materials from database
        List<Material> materialList = makeMaterialList(name);

        // set type
        String type = "sternbrædder";

        // amount of materials pr beam
        useOfMaterials(length, quantity, description, type, materialList, "Stern");
    }

    protected void calcSternUnderFrontAndBack() throws UserException {
        String description = "Understernbrædder til for- & bagende";
        String name = "25x200 mm. trykimp. Brædt";
        int surfaceAmount = 2;
        calcStern(surfaceAmount, carportWidth, description, name);
    }

    protected void calcSternUnderSides() throws UserException {
        String description = "Understernbrædder til siderne";
        String name = "25x200 mm. trykimp. Brædt";
        int surfaceAmount = 2;
        calcStern(surfaceAmount, carportLength, description, name);
    }

    protected void calcSternOverFront() throws UserException {
        String description = "Oversternbrædder til forende";
        String name = "25x125 mm. trykimp. Brædt";
        int surfaceAmount = 1;
        calcStern(surfaceAmount, carportWidth, description, name);
    }

    protected void calcSternOverSides() throws UserException {
        String description = "Oversternbrædder til siderne";
        String name = "25x125 mm. trykimp. Brædt";
        int surfaceAmount = 2;
        calcStern(surfaceAmount, carportLength, description, name);
    }

    protected void calcSternWaterFront() throws UserException {
        String description = "Vandbrædder til forende";
        String name = "19x100 mm. trykimp. Brædt";
        int surfaceAmount = 1;
        calcStern(surfaceAmount, carportWidth, description, name);
    }

    protected void calcSternWaterSides() throws UserException {
        String description = "Vandbrædder til siderne";
        String name = "19x100 mm. trykimp. Brædt";
        int surfaceAmount = 2;
        calcStern(surfaceAmount, carportLength, description, name);
    }

    /**
     * helper functions
     **/

    protected void useOfMaterials(int carportLengthOrWidth, int quantity, String description, String type, List<Material> materialList, String MaterialType) {
        Material material;

        // checks for perfect fit material
        for (Material m : materialList) {
            if (m.getLength() == carportLengthOrWidth) {
                bom.add(newItem(quantity, m.getId(), description, type, m));
                return;
            }
        }

        // if not... checks if carport is longer than the longest material
        if (carportLengthOrWidth > materialList.get(0).getLength()) {
            // if longer... then it splits it in to 2;
            ArrayList<Integer> offsets = new ArrayList<>();

            // MaterialType, for multiple use of method
            switch (MaterialType) {
                case "Beam":
                case "Rafter":
                case "Stern": {
                    quantity *= 2;
                    offsets.add(carportLengthOrWidth / 2);
                    break;
                }
                //todo: figure out to add overlap in previous method... then we can remove switch...
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
                bom.add(newItem(quantity, material.getId(), description, type, material));
            }
        } else {

            //TODO: hvis længden er under halvt så kort af en brædde, skal man kun have en brædde og ikke 2...

            //if not longer then longest material... then it checks for the best fit
            material = bestFitMaterial(materialList, carportLengthOrWidth);
            bom.add(newItem(quantity, material.getId(), description, type, material));
        }
    }

    protected Material bestFitMaterial(List<Material> materialList, int length) {
        // sets default material
        Material material = materialList.get(0);
        // wasted wood
        int bestFit = material.getLength() - length;

        // runs through materials to find the one with the lowest waste of wood
        for (Material m : materialList) {
            // find wood waste
            int wastedWood = m.getLength() - length;

            // if wasted wood is lower, but still longer then the length... then it's a better fit
            if (bestFit > wastedWood && wastedWood >= 0) {
                bestFit = wastedWood;
                material = m;
            }
        }
        // return best fit material
        return material;
    }

    protected int amountOfPosts(int carportLengthOrWidth, int maxLengthOrWidth, int offset1, int offset2) {
        return ((int) (ceil((double) (carportLengthOrWidth - (offset1 + offset2)) / (double) maxLengthOrWidth))) + 1;
    }

    protected ArrayList<Material> makeMaterialList(String name) throws UserException {
        // create list
        ArrayList<Material> materialList = materialFacade.getMaterialByName(name);

        // sort list by length... from short to long
        materialList.sort(Comparator.comparing(Material::getLength));
        Collections.reverse(materialList);

        return materialList;
    }
}