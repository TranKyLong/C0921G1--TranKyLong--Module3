package model;

public class AttachService {
    private String attachServiceName ;
    private String attachServiceUnit ;
    private double attachServiceCost ;

    public AttachService() {
    }

    public AttachService(String attachServiceName, String attachServiceUnit, double attachServiceCost) {
        this.attachServiceName = attachServiceName;
        this.attachServiceUnit = attachServiceUnit;
        this.attachServiceCost = attachServiceCost;
    }

    public String getAttachServiceName() {
        return attachServiceName;
    }

    public void setAttachServiceName(String attachServiceName) {
        this.attachServiceName = attachServiceName;
    }

    public String getAttachServiceUnit() {
        return attachServiceUnit;
    }

    public void setAttachServiceUnit(String attachServiceUnit) {
        this.attachServiceUnit = attachServiceUnit;
    }

    public double getAttachServiceCost() {
        return attachServiceCost;
    }

    public void setAttachServiceCost(double attachServiceCost) {
        this.attachServiceCost = attachServiceCost;
    }
}
