package business.calculators;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class MaterialCalculatorTest {
    MaterialCalculator mc = new MaterialCalculator();

    @Test
    void post() {
        System.out.println(mc.numbersOfPosts(10.2f, 12));

    }
}