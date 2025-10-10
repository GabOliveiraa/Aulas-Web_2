package br.edu.ifspcjo.ads.web2.tkd.model;

public enum Belt {
	
	BRANCA("Branca"),
    AMARELA("Amarela"),
    AMARELA_PONTA_VERDE("Amarela ponta verde"),
    VERDE("Verde"),
    VERDE_PONTA_AZUL("Verde ponta azul"),
    AZUL("Azul"),
    AZUL_PONTA_VERMELHA("Azul ponta vermelha"),
    VERMELHA("Vermelha"),
    VERMELHA_PONTA_PRETA("Vermelha ponta preta"),
    PRETA("Preta");

    private final String description;

    Belt(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}