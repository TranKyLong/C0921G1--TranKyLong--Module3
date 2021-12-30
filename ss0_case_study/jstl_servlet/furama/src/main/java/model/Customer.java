package model;

public class Customer {
    private String customerName;
    private String customerBirthday;
    private Integer customerGender;
    /**
     * 0 female, 1 male
     */
    private String customerIdCard;
    private String customerPhone;
    private String customerEmail;
    private Integer customerType_id;
    /**
     * 1 Diamond, 2 Platinium, 3 Gold, 4 Silver, 5 Member.
     */
    private String customerAddress;

    public Customer() {
    }

    public Customer(String customerName, String customerBirthday, Integer customerGender, String customerIdCard, String customerPhone, String customerEmail, Integer customerType_id, String customerAddress) {
        this.customerName = customerName;
        this.customerBirthday = customerBirthday;
        this.customerGender = customerGender;
        this.customerIdCard = customerIdCard;
        this.customerPhone = customerPhone;
        this.customerEmail = customerEmail;
        this.customerType_id = customerType_id;
        this.customerAddress = customerAddress;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerBirthday() {
        return customerBirthday;
    }

    public void setCustomerBirthday(String customerBirthday) {
        this.customerBirthday = customerBirthday;
    }

    public Integer getCustomerGender() {
        return customerGender;
    }

    public void setCustomerGender(Integer customerGender) {
        this.customerGender = customerGender;
    }

    public String getCustomerIdCard() {
        return customerIdCard;
    }

    public void setCustomerIdCard(String customerIdCard) {
        this.customerIdCard = customerIdCard;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public Integer getCustomerType_id() {
        return customerType_id;
    }

    public void setCustomerType_id(Integer customerType_id) {
        this.customerType_id = customerType_id;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }
}
