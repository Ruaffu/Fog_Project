package business.entities;

public class User {

    public User(int id, String email, String password, String role, String firstname, String lastname, String streetname, String houseNr, String city, String zipcode, String regionName, String phoneNr) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.role = role;
        this.firstname = firstname;
        this.lastname = lastname;
        this.streetname = streetname;
        this.houseNr = houseNr;
        this.city = city;
        this.zipcode = zipcode;
        this.regionName = regionName;
        this.phoneNr = phoneNr;
    }

    public User(String email, String password, String role, String firstname, String lastname, String streetname, String houseNr, String zipcode, String phoneNr) {
        this.email = email;
        this.password = password;
        this.role = role;
        this.firstname = firstname;
        this.lastname = lastname;
        this.streetname = streetname;
        this.houseNr = houseNr;
        this.zipcode = zipcode;
        this.phoneNr = phoneNr;
    }

    private int id; // just used to demo retrieval of autogen keys in UserMapper
    private String email;
    private String password; // Should be hashed and secured
    private String role;
    private String firstname;
    private String lastname;
    private String streetname;
    private String houseNr;
    private String city;
    private String zipcode;
    private String regionName;
    private String phoneNr;

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getStreetname() {
        return streetname;
    }

    public void setStreetname(String streetname) {
        this.streetname = streetname;
    }

    public String getHouseNr() {
        return houseNr;
    }

    public void setHouseNr(String houseNr) {
        this.houseNr = houseNr;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getRegionName() {
        return regionName;
    }

    public void setRegionName(String regionName) {
        this.regionName = regionName;
    }

    public String getPhoneNr() {
        return phoneNr;
    }

    public void setPhoneNr(String phoneNr) {
        this.phoneNr = phoneNr;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
