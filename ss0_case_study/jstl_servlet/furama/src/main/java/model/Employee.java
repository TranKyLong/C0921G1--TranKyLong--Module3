package model;

public class Employee {
    private String employeeName;
    private String employeeBirthday;
    private String employeeIdCard;
    private String employeePhone;
    private String employeeEmail;
    private Integer educationDegreeId;
    /**
     * 1 Trung cấp,2 Cao đẳng,3 Đại học,4 sau đại học
     */

    private Integer positionId;
    /**
     * 1 Lễ tân, 2 phục vụ, 3 chuyên viên, 4 giám sát, 5 quản lý, 6 giám đốc.
     */

    private double employeeSalary;

    private Integer divisionId;

    /**
     * 1 Sale – Marketing, 2 Hành Chính, 3 Phục vụ,4 Quản lý
     */

    public Employee() {
    }

    public Employee(String employeeName, String employeeBirthday, String employeeIdCard, String employeePhone, String employeeEmail, Integer educationDegreeId, Integer positionId, double employeeSalary, Integer divisionId) {
        this.employeeName = employeeName;
        this.employeeBirthday = employeeBirthday;
        this.employeeIdCard = employeeIdCard;
        this.employeePhone = employeePhone;
        this.employeeEmail = employeeEmail;
        this.educationDegreeId = educationDegreeId;
        this.positionId = positionId;
        this.employeeSalary = employeeSalary;
        this.divisionId = divisionId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getEmployeeBirthday() {
        return employeeBirthday;
    }

    public void setEmployeeBirthday(String employeeBirthday) {
        this.employeeBirthday = employeeBirthday;
    }

    public String getEmployeeIdCard() {
        return employeeIdCard;
    }

    public void setEmployeeIdCard(String employeeIdCard) {
        this.employeeIdCard = employeeIdCard;
    }

    public String getEmployeePhone() {
        return employeePhone;
    }

    public void setEmployeePhone(String employeePhone) {
        this.employeePhone = employeePhone;
    }

    public String getEmployeeEmail() {
        return employeeEmail;
    }

    public void setEmployeeEmail(String employeeEmail) {
        this.employeeEmail = employeeEmail;
    }

    public Integer getEducationDegreeId() {
        return educationDegreeId;
    }

    public void setEducationDegreeId(Integer educationDegreeId) {
        this.educationDegreeId = educationDegreeId;
    }

    public Integer getPositionId() {
        return positionId;
    }

    public void setPositionId(Integer positionId) {
        this.positionId = positionId;
    }

    public double getEmployeeSalary() {
        return employeeSalary;
    }

    public void setEmployeeSalary(double employeeSalary) {
        this.employeeSalary = employeeSalary;
    }

    public Integer getDivisionId() {
        return divisionId;
    }

    public void setDivisionId(Integer divisionId) {
        this.divisionId = divisionId;
    }
}


