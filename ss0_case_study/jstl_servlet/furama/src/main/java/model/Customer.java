package model;

public class Customer {
    private Integer customerId;
    private String customerName;

    private String customerBirthday;
    private Integer customerGender;
    /**
     * 0 female, 1 male
     */
    private String customerIdCard;
    private String customerPhone;
    private String customerEmail;
    private CustomerType customerType;
    /**
     * 1 Diamond, 2 Platinium, 3 Gold, 4 Silver, 5 Member.
     */
    private String customerAddress;

    public Customer() {
    }

    public Customer(String customerName, String customerBirthday, Integer customerGender,
                    String customerIdCard, String customerPhone, String customerEmail, CustomerType customerType, String customerAddress) {

        this.customerName = customerName;
        this.customerBirthday = customerBirthday;
        this.customerGender = customerGender;
        this.customerIdCard = customerIdCard;
        this.customerPhone = customerPhone;
        this.customerEmail = customerEmail;
        this.customerType = customerType;
        this.customerAddress = customerAddress;
    }

    public Customer(Integer customerId, String customerName, String customerBirthday, Integer customerGender, String customerIdCard, String customerPhone, String customerEmail, CustomerType customerType, String customerAddress) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.customerBirthday = customerBirthday;
        this.customerGender = customerGender;
        this.customerIdCard = customerIdCard;
        this.customerPhone = customerPhone;
        this.customerEmail = customerEmail;
        this.customerType = customerType;
        this.customerAddress = customerAddress;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
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

    public CustomerType getCustomerType() {
        return customerType;
    }

    public void setCustomerType(CustomerType customerType) {
        this.customerType = customerType;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "customerId=" + customerId +
                ", customerName='" + customerName + '\'' +
                ", customerBirthday='" + customerBirthday + '\'' +
                ", customerGender=" + customerGender +
                ", customerIdCard='" + customerIdCard + '\'' +
                ", customerPhone='" + customerPhone + '\'' +
                ", customerEmail='" + customerEmail + '\'' +
                ", customerType=" + customerType +
                ", customerAddress='" + customerAddress + '\'' +
                '}';
    }
}
