package model;

public class Villa extends FuramaServices {
    private String standardRoom;
    private String descriptionOtherConvenience;
    private double poolArea;
    private Integer numberOfFloors;

    public Villa() {
    }

    public Villa(String serviceName, double serviceArea, double serviceCost, Integer serviceMaxPeople, Integer rentTypeId, String standardRoom, String descriptionOtherConvenience, double poolArea, Integer numberOfFloors) {
        super(serviceName, serviceArea, serviceCost, serviceMaxPeople, rentTypeId);
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.poolArea = poolArea;
        this.numberOfFloors = numberOfFloors;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getDescriptionOtherConvenience() {
        return descriptionOtherConvenience;
    }

    public void setDescriptionOtherConvenience(String descriptionOtherConvenience) {
        this.descriptionOtherConvenience = descriptionOtherConvenience;
    }

    public double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    public Integer getNumberOfFloors() {
        return numberOfFloors;
    }

    public void setNumberOfFloors(Integer numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }
}
