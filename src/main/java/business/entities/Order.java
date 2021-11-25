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
    float carportLength;
    float carportWidth;
    String roofType;
    int roofAngle;
    boolean hasShed;
    float shedLength;
    float shedWidth;

    ArrayList<Material> BOM = new ArrayList<>();

    public Order(int id, int userId, int adminId, float totalCost, float totalPrice, boolean isPaid, Timestamp orderDate, String status, float carportLength, float carportWidth, String roofType, int roofAngle, boolean hasShed, float shedLength, float shedWidth, ArrayList<Material> BOM) {
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
        this.hasShed = hasShed;
        this.shedLength = shedLength;
        this.shedWidth = shedWidth;
        this.BOM = BOM;
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

    public float getCarportLength() {
        return carportLength;
    }

    public void setCarportLength(float carportLength) {
        this.carportLength = carportLength;
    }

    public float getCarportWidth() {
        return carportWidth;
    }

    public void setCarportWidth(float carportWidth) {
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

    public boolean isHasShed() {
        return hasShed;
    }

    public void setHasShed(boolean hasShed) {
        this.hasShed = hasShed;
    }

    public float getShedLength() {
        return shedLength;
    }

    public void setShedLength(float shedLength) {
        this.shedLength = shedLength;
    }

    public float getShedWidth() {
        return shedWidth;
    }

    public void setShedWidth(float shedWidth) {
        this.shedWidth = shedWidth;
    }

    public ArrayList<Material> getBOM() {
        return BOM;
    }

    public void setBOM(ArrayList<Material> BOM) {
        this.BOM = BOM;
    }
}
