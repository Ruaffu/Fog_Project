package business.calculators;

import business.entities.Material;

import java.util.ArrayList;

public class MaterialCalculator {

    private final float MAX_POST_DISTANCE = 3.1f;
    private final float fratrækning = 1.0f;



    ArrayList<Material> BOM = new ArrayList<>();



    public int numbersOfPosts(float length, float width){

        length -= (fratrækning*2);
        int postQuantity;


        postQuantity = (int) ((Math.ceil(length/MAX_POST_DISTANCE)+ 1) * 2);

//        BOM.add(material);
        return postQuantity;
    }

    public void numbersOfPosts(float length, float width, float shedWidth, float shedLength, Material material){
        float postQuantity;




        postQuantity = (length/MAX_POST_DISTANCE) + 1;


    }



}
