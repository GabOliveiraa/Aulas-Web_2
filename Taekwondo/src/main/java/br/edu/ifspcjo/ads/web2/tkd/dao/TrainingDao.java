package br.edu.ifspcjo.ads.web2.tkd.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.sql.DataSource;

import br.edu.ifspcjo.ads.web2.tkd.model.Student;
import br.edu.ifspcjo.ads.web2.tkd.model.Training;
import br.edu.ifspcjo.ads.web2.tkd.model.TrainingType;

public class TrainingDao {
    private final DataSource dataSource;
    public TrainingDao(DataSource ds){ this.dataSource = ds; }

    public boolean save(Training t){
        String sql = "INSERT INTO training (training_type, training_date, student_id) VALUES (?,?,?)";
        try (Connection con = dataSource.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, t.getType().toString());
            ps.setDate(2, Date.valueOf(t.getDate()));
            ps.setLong(3, t.getStudent().getId());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao inserir treino", e);
        }
    }

    public List<Training> listByStudent(Student s){
        String sql = "SELECT id, training_type, training_date FROM training WHERE student_id=? ORDER BY training_date DESC";
        List<Training> list = new ArrayList<>();
        try (Connection con = dataSource.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setLong(1, s.getId());
            try (ResultSet rs = ps.executeQuery()){
                while(rs.next()){
                    Training t = new Training();
                    t.setId(rs.getLong("id"));
                    t.setType(TrainingType.valueOf(rs.getString("training_type")));
                    t.setDate(rs.getDate("training_date").toLocalDate());
                    t.setStudent(s);
                    list.add(t);
                }
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao consultar treinos", e);
        }
    }
    
    public Optional<Training> findById(Long id){
        String sql = "SELECT id, training_type, training_date, student_id FROM training WHERE id=?";
        try (Connection con = dataSource.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setLong(1, id);
            try (ResultSet rs = ps.executeQuery()){
                if(rs.next()){
                    Training t = new Training();
                    t.setId(rs.getLong("id"));
                    t.setType(TrainingType.valueOf(rs.getString("training_type")));
                    t.setDate(rs.getDate("training_date").toLocalDate());

                    Student s = new Student();
                    s.setId(rs.getLong("student_id"));
                    t.setStudent(s);

                    return Optional.of(t);
                }
            }
            return Optional.empty();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao buscar treino por id", e);
        }
    }

    public boolean update(Training t){
        String sql = "UPDATE training SET training_type=?, training_date=? WHERE id=? AND student_id=?";
        try (Connection con = dataSource.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, t.getType().toString());
            ps.setDate(2, Date.valueOf(t.getDate()));
            ps.setLong(3, t.getId());
            ps.setLong(4, t.getStudent().getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao atualizar treino", e);
        }
    }

    public boolean delete(Long id, Long studentId){
        String sql = "DELETE FROM training WHERE id=? AND student_id=?";
        try (Connection con = dataSource.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setLong(1, id);
            ps.setLong(2, studentId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao excluir treino", e);
        }
    }
}