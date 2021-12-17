package business.entities;

public class Material {

    int id = -1;
    String name;
    String type;
    String description;
    float cost;
    float price;
    int length;
    int height;
    int width;
    String unit;
    int quantity;

    public Material(String name, float cost, float price, int length, int height, int width, String unit) {
        this.name = name;
        this.cost = cost;
        this.price = price;
        this.length = length;
        this.height = height;
        this.width = width;
        this.unit = unit;
    }

    public Material(int id, String name, float cost, float price, int length, int height, int width, String unit) {
        this.id = id;
        this.name = name;
        this.cost = cost;
        this.price = price;
        this.length = length;
        this.height = height;
        this.width = width;
        this.unit = unit;
    }

    public Material(int id, String name, String type, String description, float cost, float price, int length, int height, int width, String unit, int quantity) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.description = description;
        this.cost = cost;
        this.price = price;
        this.length = length;
        this.height = height;
        this.width = width;
        this.unit = unit;
        this.quantity = quantity;
    }

    public int getQuantity()
    {
        return quantity;
    }

    public void setQuantity(int quantity)
    {
        this.quantity = quantity;
    }

    public int getHeight()
    {
        return height;
    }

    public void setHeight(int height)
    {
        this.height = height;
    }

    public int getWidth()
    {
        return width;
    }

    public void setWidth(int width)
    {
        this.width = width;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }
}
