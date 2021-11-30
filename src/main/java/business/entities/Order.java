package business.entities;

import java.sql.Timestamp;
import java.util.ArrayList;

public class Order {

    int id;
    int userId;
    int adminId;
    float totalCost;
    float totalPrice;
    boolean isPaid;
    Timestamp orderDate;
    String status;
    int carportLength;
    int carportWidth;
    String roofType;
    int roofAngle;
    int shedLength;
    int shedWidth;

    ArrayList<Material> BOM;

    public Order(int id, int userId, int adminId, float totalCost, float totalPrice, boolean isPaid, Timestamp orderDate, String status, int carportLength, int carportWidth, String roofType, int roofAngle, int shedLength, int shedWidth, ArrayList<Material> BOM) {
        this.id = id;
        this.userId = userId;
        this.adminId = adminId;
        this.totalCost = totalCost;
        this.totalPrice = totalPrice;
        this.isPaid = isPaid;
        this.orderDate = orderDate;
        this.status = status;
        this.carportLength = carportLength;
        this.carportWidth = carportWidth;
        this.roofType = roofType;
        this.roofAngle = roofAngle;
        this.shedLength = shedLength;
        this.shedWidth = shedWidth;
        this.BOM = BOM;
    }

    public Order(int userId, int adminId, boolean isPaid,  String status, int carportLength, int carportWidth, String roofType, int roofAngle, int shedLength, int shedWidth, ArrayList<Material> BOM) {
        this.userId = userId;
        this.adminId = adminId;
        this.isPaid = isPaid;
        this.orderDate = null; // TODO: fix date
        this.status = status;
        this.carportLength = carportLength;
        this.carportWidth = carportWidth;
        this.roofType = roofType;
        this.roofAngle = roofAngle;
        this.shedLength = shedLength;
        this.shedWidth = shedWidth;
        this.BOM = BOM;
        this.totalCost = costCalc();
        this.totalPrice = priceCalc();
    }

    private float costCalc(){
        float cost = 0;
        for (Material m: BOM) {
            cost += m.getCost();
        }
        return cost;
    }

    private float priceCalc(){
        float cost = costCalc();
        return cost * 1.6f;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public float getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(float totalCost) {
        this.totalCost = totalCost;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public boolean isPaid() {
        return isPaid;
    }

    public void setPaid(boolean paid) {
        isPaid = paid;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCarportLength() {
        return carportLength;
    }

    public void setCarportLength(int carportLength) {
        this.carportLength = carportLength;
    }

    public int getCarportWidth() {
        return carportWidth;
    }

    public void setCarportWidth(int carportWidth) {
        this.carportWidth = carportWidth;
    }

    public String getRoofType() {
        return roofType;
    }

    public void setRoofType(String roofType) {
        this.roofType = roofType;
    }

    public int getRoofAngle() {
        return roofAngle;
    }

    public void setRoofAngle(int roofAngle) {
        this.roofAngle = roofAngle;
    }

    public int getShedLength() {
        return shedLength;
    }

    public void setShedLength(int shedLength) {
        this.shedLength = shedLength;
    }

    public int getShedWidth() {
        return shedWidth;
    }

    public void setShedWidth(int shedWidth) {
        this.shedWidth = shedWidth;
    }

    public ArrayList<Material> getBOM() {
        return BOM;
    }

    public void setBOM(ArrayList<Material> BOM) {
        this.BOM = BOM;
    }
}
