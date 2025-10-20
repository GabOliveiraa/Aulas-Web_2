package br.edu.ifspcjo.ads.web2.tkd.model;

public enum CompetitionType {
	
	 	LOCAL("Local"),
	    REGIONAL("Regional"),
	    ESTADUAL("Estadual");

	    private String type;

	    CompetitionType(String type) {
	        this.type = type;
	    }

	    public String getType() {
	        return type;
	    }
}
