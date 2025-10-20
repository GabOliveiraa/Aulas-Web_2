package br.edu.ifspcjo.ads.web2.tkd.model;

public enum CompetitionResult {
    
    VITORIA("Vitória"),
    DERROTA("Derrota"),
    EMPATE("Empate");

    private String result;

    CompetitionResult(String result) {
        this.result = result;
    }

    public String getResult() {
        return result;
    }
}