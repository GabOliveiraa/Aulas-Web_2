package br.edu.ifspcjo.ads.web2.tkd.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import br.edu.ifspcjo.ads.web2.tkd.model.Competition;
import br.edu.ifspcjo.ads.web2.tkd.model.CompetitionType;
import br.edu.ifspcjo.ads.web2.tkd.model.CompetitionResult;
import br.edu.ifspcjo.ads.web2.tkd.model.Student;

public class CompetitionDao {

    private DataSource dataSource;

    public CompetitionDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    // 🔸 Salvar uma competição
    public Boolean save(Competition competition) {
        String sql = "INSERT INTO competition (competition_type, category, result, event_date, student_id) VALUES (?,?,?,?,?)";
        try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, competition.getCompetitionType().toString());
            ps.setString(2, competition.getCategory());
            ps.setString(3, competition.getResult().toString());
            ps.setDate(4, Date.valueOf(competition.getEventDate()));
            ps.setLong(5, competition.getStudent().getId());
            ps.executeUpdate();
            return true;
        } catch (SQLException sqlException) {
            throw new RuntimeException("Erro ao inserir dados na tabela competition", sqlException);
        }
    }

    // 🔸 Buscar todas as competições de um aluno
    public List<Competition> getCompetitionsByStudent(Student student) {
        String sql = "SELECT * FROM competition WHERE student_id = ?";
        List<Competition> competitions = new ArrayList<>();

        try (Connection con = dataSource.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setLong(1, student.getId());

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Competition competition = new Competition();
                    competition.setId(rs.getLong("id"));
                    competition.setCompetitionType(CompetitionType.valueOf(rs.getString("competition_type")));
                    competition.setCategory(rs.getString("category"));
                    competition.setResult(CompetitionResult.valueOf(rs.getString("result")));
                    competition.setEventDate(LocalDate.parse(rs.getDate("event_date").toString()));
                    competition.setStudent(student);
                    competitions.add(competition);
                }
            }

            return competitions;

        } catch (SQLException sqlException) {
            throw new RuntimeException("Erro ao buscar competições do aluno", sqlException);
        }
    }
}
