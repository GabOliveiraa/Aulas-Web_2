package br.edu.ifspcjo.ads.web2.tkd.model;

public enum TrainingType {
    POOMSE("Poomse"),
    LUTA("Treino de luta"),
    TECNICA("Técnica"),
    CONDICIONAMENTO("Condicionamento"),
    FLEXIBILIDADE("Flexibilidade");

    private final String label;
    TrainingType(String label){ this.label = label; }
    public String getLabel(){ return label; }
}
