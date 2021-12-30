package model;

public class Room  extends FuramaServices{
    private  String freeService;

    public Room() {
    }

    public Room(String serviceName, double serviceArea, double serviceCost, Integer serviceMaxPeople, Integer rentTypeId, String freeService) {
        super(serviceName, serviceArea, serviceCost, serviceMaxPeople, rentTypeId);
        this.freeService = freeService;
    }

    public String getFreeService() {
        return freeService;
    }

    public void setFreeService(String freeService) {
        this.freeService = freeService;
    }
}
