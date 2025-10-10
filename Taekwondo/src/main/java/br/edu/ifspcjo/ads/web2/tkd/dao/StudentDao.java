package br.edu.ifspcjo.ads.web2.tkd.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

import javax.sql.DataSource;

import br.edu.ifspcjo.ads.web2.tkd.model.Belt;
import br.edu.ifspcjo.ads.web2.tkd.model.Gender;
import br.edu.ifspcjo.ads.web2.tkd.model.Student;
import br.edu.ifspcjo.ads.web2.tkd.utils.PasswordEncoder;

public class StudentDao {

	 private DataSource dataSource;

	    public StudentDao(DataSource dataSource) {
	        super();
	        this.dataSource = dataSource;
	    }

	    public Boolean save(Student student) {
	        Optional<Student> optional = getByEmail(student.getEmail());
	        if (optional.isPresent()) {
	            return false;
	        }

	        String sql = "INSERT INTO student (name, email, password, birth_date, gender, belt, active) "
	                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

	        try (Connection conn = dataSource.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql)) {

	            ps.setString(1, student.getName());
	            ps.setString(2, student.getEmail());
	            ps.setString(3, PasswordEncoder.encode(student.getPassword()));
	            ps.setDate(4, Date.valueOf(student.getBirthDate()));
	            ps.setString(5, student.getGender().toString());
	            ps.setString(6, student.getBelt().toString());
	            ps.setBoolean(7, true);

	            ps.executeUpdate();
	        } catch (SQLException e) {
	            throw new RuntimeException("Erro durante a escrita no BD", e);
	        }
	        return true;
	    }

	    public Optional<Student> getByEmail(String email) {
	        String sql = "SELECT * FROM student WHERE email = ?";

	        try (Connection conn = dataSource.getConnection();
	                PreparedStatement ps = conn.prepareStatement(sql)) {

	            ps.setString(1, email);

	            try (ResultSet rs = ps.executeQuery()) {
	                if (rs.next()) {
	                    Student student = new Student();
	                    student.setId(rs.getLong("id"));
	                    student.setName(rs.getString("name"));
	                    student.setEmail(rs.getString("email"));
	                    student.setPassword(rs.getString("password"));
	                    student.setBirthDate(rs.getDate("birth_date").toLocalDate());
	                    student.setGender(Gender.valueOf(rs.getString("gender")));
	                    student.setBelt(Belt.valueOf(rs.getString("belt")));
	                    student.setActive(rs.getBoolean("active"));
	                    return Optional.of(student);
	                }
	            }
	        } catch (SQLException e) {
	            throw new RuntimeException("Erro ao buscar aluno por e-mail", e);
	        }

	        return Optional.empty();
	    }
}