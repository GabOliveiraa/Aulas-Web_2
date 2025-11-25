package br.edu.ifspcjo.ads.web2.tkd.dto;

import java.time.LocalDate;

public class TrainingByDay {

    private LocalDate date;
    private Long totalTrainings;

    public TrainingByDay() {
    }

    public TrainingByDay(LocalDate date, Long totalTrainings) {
        this.date = date;
        this.totalTrainings = totalTrainings;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public Long getTotalTrainings() {
        return totalTrainings;
    }

    public void setTotalTrainings(Long totalTrainings) {
        this.totalTrainings = totalTrainings;
    }
}
