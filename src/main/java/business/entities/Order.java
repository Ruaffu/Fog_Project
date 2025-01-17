package business.entities;

import java.sql.Timestamp;
import java.util.ArrayList;

public class Order {

    int id;
    User user;
    float totalCost;
    float totalPrice;
    float coverageRatio;
    Timestamp orderDate;
    String status;
    int carportLength;
    int carportWidth;
    String roofType;
    int roofAngle;
    int shedLength;
    int shedWidth;
    String remarks;

    ArrayList<Material> BOM;

    public Order(int id, User user, float totalCost, float totalPrice, Timestamp orderDate, String status, int carportLength, int carportWidth, String roofType, int roofAngle, int shedLength, int shedWidth, String remarks, ArrayList<Material> BOM) {
        this.id = id;
        this.user = user;
        this.totalCost = totalCost;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
        this.status = status;
        this.carportLength = carportLength;
        this.carportWidth = carportWidth;
        this.roofType = roofType;
        this.roofAngle = roofAngle;
        this.shedLength = shedLength;
        this.shedWidth = shedWidth;
        this.BOM = BOM;
        this.coverageRatio = coverageRatio();
        this.remarks = remarks;
    }

    public Order(User user, String status, int carportLength, int carportWidth, String roofType, int roofAngle, int shedLength, int shedWidth, String remarks, ArrayList<Material> BOM) {
        this.user = user;
        this.orderDate = new Timestamp(System.currentTimeMillis());
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
        this.coverageRatio = coverageRatio();
        this.remarks = remarks;
    }

    public float coverageRatio()
    {
        float margin = totalPrice - totalCost;

        return (margin / totalPrice) * 100;
    }

    public float costCalc(){
        float cost = 0;
        for (Material m: BOM) {
            cost += (m.getCost() * m.getQuantity());
        }
        return cost;
    }

    public float priceCalc(){
        float price;

        if (user.getRegionName().equals("Region Hovedstaden") || user.getRegionName().equals("Region Sjælland")){
            price = 0;
        } else {
            price = 2500;
        }

        for (Material m: BOM) {
            price += (m.getPrice() * m.getQuantity());
        }
        return price;
    }

    public float getCoverageRatio()
    {
        return coverageRatio;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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

    public void setCoverageRatio(float coverageRatio) {
        this.coverageRatio = coverageRatio;
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

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public ArrayList<Material> getBOM() {
        return BOM;
    }

    public void setBOM(ArrayList<Material> BOM) {
        this.BOM = BOM;
    }
}
