package business.calculators;

import business.entities.Material;
import business.exceptions.UserException;
import business.persistence.Database;
import business.persistence.MaterialMapper;
import business.persistence.UserMapper;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

class FlatRoofWithShedCalcTest {

    private final static String DATABASE = "fog";  // Change this to your own database
    private final static String TESTDATABASE = DATABASE;
    private final static String USER = "root";
    private final static String PASSWORD = "tna37vbf";
    private final static String URL = "jdbc:mysql://localhost:3306/" + TESTDATABASE + "?serverTimezone=CET&useSSL=false";

    private static Database database;
    private static MaterialCalculator mc;

    @BeforeAll
    public static void setUpClass() {
//         try {
//             database = new Database(USER, PASSWORD, URL);
//             mc = new FlatRoofWithShedCalc(database, 600, 780, 570, 210);
//         } catch (ClassNotFoundException e) {   // kan ikke finde driveren i database klassen
//             fail("Database connection failed. Missing jdbc driver");
//         }
    }

//     @Test
//     void calcRafter() throws UserException {
//         mc.calcRafter();
//         assertEquals(15, mc.bom.get(0).getQuantity());
//     }

//     @Test
//     void calcPost() throws UserException {
//         mc.calcPost();
//         assertEquals(11, mc.bom.get(0).getQuantity());
//     }

//     @Test
//     void calcbeam() throws UserException {
//         mc.calcBeam(780);
//         assertEquals(2, mc.bom.get(0).getQuantity());
//     }

//     @Test
//     void calcBolt() throws UserException {
//         mc.bolt();
//         assertEquals(20, mc.bom.get(0).getQuantity());
//     }

//     @Test
//     void calcWood() throws UserException {
//         mc.woodCalculator();
//         // stolper
//         assertEquals(11, mc.bom.get(0).getQuantity());
//         // remme
//         assertEquals(2, mc.bom.get(1).getQuantity());
//         assertEquals(2, mc.bom.get(2).getQuantity());
//         //  tag
//         assertEquals(6, mc.bom.get(3).getQuantity());
//         assertEquals(6, mc.bom.get(4).getQuantity());
//         //spær
//         assertEquals(15, mc.bom.get(5).getQuantity());
//         //stern brædder
//         assertEquals(2, mc.bom.get(6).getQuantity());
//         assertEquals(4, mc.bom.get(7).getQuantity());
//         assertEquals(1, mc.bom.get(8).getQuantity());
//         assertEquals(4, mc.bom.get(9).getQuantity());
//         assertEquals(2, mc.bom.get(10).getQuantity());
//         assertEquals(4, mc.bom.get(11).getQuantity());
//         //løsholter
//         assertEquals(12, mc.bom.get(12).getQuantity());
//         assertEquals(6, mc.bom.get(13).getQuantity());
//         // beklædning
//         assertEquals(208, mc.bom.get(14).getQuantity());
//     }

//     @Test
//     void calcMount() throws UserException {
//         mc.BOMCalculator();
// // stolper
//         assertEquals(11, mc.bom.get(0).getQuantity());
//         // remme
//         assertEquals(2, mc.bom.get(1).getQuantity());
//         assertEquals(2, mc.bom.get(2).getQuantity());
//         //  tag
//         assertEquals(6, mc.bom.get(3).getQuantity());
//         assertEquals(6, mc.bom.get(4).getQuantity());
//         //spær
//         assertEquals(15, mc.bom.get(5).getQuantity());
//         //stern brædder
//         assertEquals(2, mc.bom.get(6).getQuantity());
//         assertEquals(4, mc.bom.get(7).getQuantity());
//         assertEquals(1, mc.bom.get(8).getQuantity());
//         assertEquals(4, mc.bom.get(9).getQuantity());
//         assertEquals(2, mc.bom.get(10).getQuantity());
//         assertEquals(4, mc.bom.get(11).getQuantity());
//         //løsholter
//         assertEquals(12, mc.bom.get(12).getQuantity());
//         assertEquals(6, mc.bom.get(13).getQuantity());
//         // beklædning
//         assertEquals(208, mc.bom.get(14).getQuantity());


//         // bundskruer
//         assertEquals(3, mc.bom.get(15).getQuantity());
//         // hulbånd
//         assertEquals(2, mc.bom.get(16).getQuantity());
//         // universal beslag
//         assertEquals(15, mc.bom.get(17).getQuantity());
//         assertEquals(15, mc.bom.get(18).getQuantity());
//         // skruer
//         assertEquals(1, mc.bom.get(19).getQuantity());
//         assertEquals(3, mc.bom.get(20).getQuantity());
//         //stern bolte/firkantskiver
//         assertEquals(20, mc.bom.get(21).getQuantity());
//         assertEquals(20, mc.bom.get(22).getQuantity());
//         // beklædningsskruer
//         assertEquals(4, mc.bom.get(23).getQuantity());
//         assertEquals(4, mc.bom.get(24).getQuantity());
//         // dør
//         assertEquals(1, mc.bom.get(25).getQuantity());
//         assertEquals(1, mc.bom.get(26).getQuantity());
//         assertEquals(2, mc.bom.get(27).getQuantity());
//         //vinkelbeslag til løsholtere
//         assertEquals(36, mc.bom.get(28).getQuantity());
//     }


}
