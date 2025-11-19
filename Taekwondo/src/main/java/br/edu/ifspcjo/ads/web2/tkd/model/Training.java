package br.edu.ifspcjo.ads.web2.tkd.model;
import java.io.Serializable;
import java.time.LocalDate;

public class Training implements Serializable {
	private static final long serialVersionUID = 1L;
    private Long id;
    private TrainingType type;
    private LocalDate date;
    private Student student;

    public Long getId(){ return id; }
    public void setId(Long id){ this.id = id; }

    public TrainingType getType(){ return type; }
    public void setType(TrainingType type){ this.type = type; }

    public LocalDate getDate(){ return date; }
    public void setDate(LocalDate date){ this.date = date; }

    public Student getStudent(){ return student; }
    public void setStudent(Student student){ this.student = student; }
}