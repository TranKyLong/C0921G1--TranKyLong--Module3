package model;

public class House  extends FuramaServices{
    private String standardRoom;
    private String descriptionOtherConvenience;
    private Integer numberOfFloors;

    public House() {
    }

    public House(String serviceName, double serviceArea, double serviceCost, Integer serviceMaxPeople, Integer rentTypeId, String standardRoom, String descriptionOtherConvenience, Integer numberOfFloors) {
        super(serviceName, serviceArea, serviceCost, serviceMaxPeople, rentTypeId);
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
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

    public Integer getNumberOfFloors() {
        return numberOfFloors;
    }

    public void setNumberOfFloors(Integer numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }
}
