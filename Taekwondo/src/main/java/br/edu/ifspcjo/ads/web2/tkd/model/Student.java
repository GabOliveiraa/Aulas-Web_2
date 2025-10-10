package br.edu.ifspcjo.ads.web2.tkd.model;

import java.time.LocalDate;
import java.util.Objects;

public class Student {
	private Long id;
	private String name;
	private String email;
	private String password;
	private Gender gender;
	private LocalDate birthDate;
	private Belt belt;
	private Boolean active;
	
	public Student() {}
	
	

	public Student(Long id, String name, String email, String password, Gender gender, LocalDate birthDate, Belt belt,
			Boolean active) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.birthDate = birthDate;
		this.belt = belt;
		this.active = active;
	}



	// Getter e Setters

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public Gender getGender() {
		return gender;
	}



	public void setGender(Gender gender) {
		this.gender = gender;
	}



	public LocalDate getBirthDate() {
		return birthDate;
	}



	public void setBirthDate(LocalDate birthDate) {
		this.birthDate = birthDate;
	}



	public Belt getBelt() {
		return belt;
	}



	public void setBelt(Belt belt) {
		this.belt = belt;
	}



	public Boolean getActive() {
		return active;
	}



	public void setActive(Boolean active) {
		this.active = active;
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Student other = (Student) obj;
		return Objects.equals(id, other.id);
	}
	
	
	
}