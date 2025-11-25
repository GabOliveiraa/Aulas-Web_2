package br.edu.ifspcjo.ads.web2.tkd.dto;

public class TrainingByType {

    private String type;
    private Integer count;

    public TrainingByType() {
    }

    public TrainingByType(String type, Integer count) {
        this.type = type;
        this.count = count;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
