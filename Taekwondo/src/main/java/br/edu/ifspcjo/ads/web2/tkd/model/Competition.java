package br.edu.ifspcjo.ads.web2.tkd.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

public class Competition implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;
    private CompetitionType competitionType;
    private String category;
    private CompetitionResult result;
    private LocalDate eventDate;
    private Student student;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public CompetitionType getCompetitionType() {
        return competitionType;
    }

    public void setCompetitionType(CompetitionType competitionType) {
        this.competitionType = competitionType;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public CompetitionResult getResult() {
        return result;
    }

    public void setResult(CompetitionResult result) {
        this.result = result;
    }

    public LocalDate getEventDate() {
        return eventDate;
    }

    public void setEventDate(LocalDate eventDate) {
        this.eventDate = eventDate;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Competition other = (Competition) obj;
        return Objects.equals(id, other.id);
    }
}