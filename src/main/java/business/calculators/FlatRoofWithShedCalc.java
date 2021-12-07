package business.calculators;

import business.entities.Material;
import business.exceptions.UserException;
import business.persistence.Database;

import java.util.List;

import static java.lang.Math.ceil;

public class FlatRoofWithShedCalc extends MaterialCalculator {

    private final int OFFSET_L1 = 1000;
    private final int OFFSET_L2 = 200;
    private final int MAX_LENGTH = 3300;

    private final int MAX_WIDTH_SHED = 3000;

    // shed with the offset at the back of the carport
    private final int shedWithOffset = shedLength + OFFSET_L2;
    // the carport length without shed
    private final int baseCarport = carportLength - shedWithOffset;

    public FlatRoofWithShedCalc(Database database, int carportWidth, int carportLength, int shedWidth, int shedLength) {
        super(database, carportWidth, carportLength, shedWidth, shedLength);
    }

    // calculates all the wood
    @Override
    protected void woodCalculator() throws UserException {
        calcPost();
        calcBeam(shedWithOffset);
        calcBeam(baseCarport);

        // adds roof overlap
        int roofOverlap = 200;
        calcFlatRoofing(shedWithOffset + roofOverlap);
        calcFlatRoofing(baseCarport);

        calcRafter();
        calcSternUnderFrontAndBack();
        calcSternUnderSides();
        calcSternOverFront();
        calcSternOverSides();
        calcSternWaterFront();
        calcSternWaterSides();
        calcShedWood();
        calcCladding();
    }

    // calculates all mount and screws
    @Override
    protected void mountCalculator() throws UserException {
        bottomScrews();
        perforatedTape(baseCarport);
        rafterMount();
        sternScrew();
        mountScrews();
        bolt();
        claddingScrews();
        addDoorMaterials();
        angleBracket();
    }

    protected void calcPost() throws UserException {
        // shed with the offset at the back of the carport
        int shedWithOffset = shedLength + OFFSET_L2;
        // the carport length without shed
        int baseCarport = carportLength - shedWithOffset;

        // Get material
        String description = "Stolper nedgraves 90 cm. i jord";
        String type = "stolpe";
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
        bom.add(newItem(quantity, materialList.get(0).getId(), description, type, materialList.get(0)));
    }

    // løsholter
    private void calcShedWood() throws UserException {
        // Get material
        String description = "løsholter til skur gavle";
        String type = "løsholter";
        String name = "45x95 mm. Reglar ubh.";
        List<Material> materialList = makeMaterialList(name);

        // calculates Wood for both Gables
        int quantityOfShedWoodWidth = amountOfPosts(shedWidth, MAX_WIDTH_SHED, 0, 0) - 1;
        int materialSizeWidth = shedWidth / quantityOfShedWoodWidth;

        int amountOfWoodPrSurface = 3;

        int numbersOfGables = 2;
        int quantityOfBothGables = quantityOfShedWoodWidth * amountOfWoodPrSurface * numbersOfGables;

        useOfMaterials(materialSizeWidth, quantityOfBothGables, description, type, materialList, null);

        // calculates Wood for both sides;
        description = "løsholter til skur sider";

        int quantityOfShedWoodLength = amountOfPosts(shedLength, MAX_LENGTH, 0, OFFSET_L2) - 1;
        int materialSizeLength = shedLength / quantityOfShedWoodWidth;

        int numbersOfSides = 2;
        int quantityOfBothSides = quantityOfShedWoodLength * amountOfWoodPrSurface * numbersOfSides;

        useOfMaterials(materialSizeLength, quantityOfBothSides, description, type, materialList, null);
    }

    private void calcCladding() throws UserException {

        // Get material
        String description = "til beklædning af skur 1 på 2";
        String type = "beklædningsbrædder";
        String name = "19x100 mm. trykimp. Brædt";
        List<Material> materialList = makeMaterialList(name);

        int materialLength = 2100;
        Material material = null;

        // tries to find the right material
        for (Material m : materialList) {
            if (m.getLength() == materialLength) {
                material = m;
            }
        }

        // if not fount, then it picks up the first material in list
        if (material == null) {
            material = materialList.get(0);
        }

        // calculates quantity
        int materialWidth = material.getWidth();
        int overlap = 25;
        int shedCircuit = (shedLength + shedWidth) * 2;

        int quantityOfCladding = (int) ceil((double) shedCircuit / (double) (materialWidth - overlap));

        bom.add(newItem(quantityOfCladding, material.getId(), description, type, material));
    }

    @Override
    protected void bolt() throws UserException {
        {
            // Get materials from database
            Material material = materialFacade.getMaterial("bræddebolt 10 x 120 mm.");
            String type = "bolt";
            String description = "Til montering af rem på stolper";

            //calculates the amount of posts ... instead of subtracting the shared posts then it will keep them, so there's 4 bolt on a spilt
            int postCarportWidth = amountOfPosts(carportWidth, MAX_WIDTH, OFFSET_W1, OFFSET_W2);
            int postShedLength = amountOfPosts(shedLength, MAX_LENGTH, 0, OFFSET_L2);
            int postCarportLength = amountOfPosts(carportLength - shedLength, MAX_LENGTH, OFFSET_L1, 0);
            int amountOfBoltPrPost = 2;

            // calculates quantity
            int quantity = ((postCarportLength + postShedLength) * postCarportWidth) * amountOfBoltPrPost;

            bom.add(newItem(quantity, material.getId(), description, type, material));

            //firkantskiver
            // adds same amount of ...
            material = materialFacade.getMaterial("firkantskiver 40x40x11mm");
            type = "firkantskriver";

            bom.add(newItem(quantity, material.getId(), description, type, material));
        }
    }

    private void claddingScrews() throws UserException {
        // Get materials from database
        Material material = materialFacade.getMaterial("4,5 x 70 mm. skruer 200 stk.");
        String type = "skrue";
        String description = "til montering af yderste beklædning";

        //finds the quantity of cladding
        int quantity = 0;
        for (Material m : bom) {
            if (m.getType().equals("beklædningsbrædder")) {
                // halv quantity er inder beklædning anden halvdel er ydre beklædning
                quantity += m.getQuantity()/2;
            }
        }

        // antal løsholtere
        int numbersOfWood = 3;
        int amountOfScrewPrWood = 2;

        int screwPrPack = 200;

        quantity = (int) ceil((double) (quantity * numbersOfWood * amountOfScrewPrWood) / (double) screwPrPack);

        bom.add(newItem(quantity, material.getId(), description, type, material));

        // inderste skruer
        material = materialFacade.getMaterial("4,5 x 50 mm. skruer 200 stk.");
        description = "til montering af inderste beklædning";

        bom.add(newItem(quantity, material.getId(), description, type, material));
    }

    private void angleBracket() throws UserException {
        // Get materials from database
        Material material = materialFacade.getMaterial("vinkelbeslag 35");
        String type = "vinkelbeslag";
        String description = "Til montering af løsholter i skur";

        // finds quantity of Wood 'løsholter'
        int quantity = 0;
        for (Material m : bom) {
            if (m.getType().equals("løsholter")) {
                quantity += m.getQuantity();
            }
        }

        int amountOfAngleBracketPrWood = 2;
        quantity *= amountOfAngleBracketPrWood;

        bom.add(newItem(quantity, material.getId(), description, type, material));
    }

    private void addDoorMaterials() throws UserException {
        Material material;

        // batten for the backside of the door;
        material = materialFacade.getMaterial("38x73 mm. Lægte ubh.");
        bom.add(newItem(1, material.getId(), "til z på bagside af dør", "dør", material));

        // door handle
        material = materialFacade.getMaterial("stalddørsgreb 50x75");
        bom.add(newItem(1, material.getId(), "Til lås på dør i skur", "dør", material));

        // hinges
        material = materialFacade.getMaterial("t hængsel 390 mm");
        bom.add(newItem(2, material.getId(), "Til skurdør", "dør", material));
    }

    /** helper functions **/

    public int calcPostsCarPort(){
        // quantity for base carport
        int quantityByWidth = amountOfPosts(carportWidth, MAX_WIDTH, OFFSET_W1, OFFSET_W2);
        int quantityByLength = amountOfPosts(baseCarport, MAX_LENGTH, OFFSET_L1, 0);

        // amount of Posts Width multiplied by amount of Posts Length
        return quantityByWidth * quantityByLength;
    }

    public int calcPostsShed(){
        // quantity for shed
        int quantityByWidthShed = amountOfPosts(shedWidth, MAX_WIDTH_SHED, 0, 0);
        int quantityByLengthShed = amountOfPosts(shedLength, MAX_LENGTH, 0, OFFSET_L2);

        // amount of Posts Width multiplied by amount of Posts Length
        return quantityByWidthShed * quantityByLengthShed;
    }
}
