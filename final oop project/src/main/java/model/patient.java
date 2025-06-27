package model;

public class patient {

    private int id;
    private String fullname;
    private String address;
    private int age;
    private String gender;
    private String mobilenumber; // Changed from int to String to handle large phone numbers
    private String email;
    private String password;

    // Constructor with parameters
    public patient(int id, String fullname, String address, int age, String gender, String mobilenumber, String email, String password) {
        this.id = id;
        this.fullname = fullname;
        this.address = address;
        this.age = age;
        this.gender = gender;
        this.mobilenumber = mobilenumber;
        this.email = email;
        this.password = password;
    }

    // Default constructor
    public patient() {
        this.id = 0;
        this.fullname = "";
        this.address = "";
        this.age = 0;
        this.gender = "";
        this.mobilenumber = "";
        this.email = "";
        this.password = "";
    }

    // Getter and Setter methods
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getMobilenumber() {
        return mobilenumber;
    }

    public void setMobilenumber(String mobilenumber) {
        this.mobilenumber = mobilenumber;
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
}
