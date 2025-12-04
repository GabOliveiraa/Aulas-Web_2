package br.edu.ifspcjo.ads.web2.tkd.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import br.edu.ifspcjo.ads.web2.tkd.model.Event;
import br.edu.ifspcjo.ads.web2.tkd.model.EventType;

public class EventDao {

	private final DataSource dataSource;

	public EventDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public List<Event> listAllOrderByDate() {
		List<Event> events = new ArrayList<>();

		String sql = """
				    SELECT id, title, description, event_date, type
				    FROM events
				    ORDER BY event_date
				""";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Event e = new Event();
				e.setId(rs.getLong("id"));
				e.setTitle(rs.getString("title"));
				e.setDescription(rs.getString("description"));
				Date date = rs.getDate("event_date");
				if (date != null) {
					e.setDate(date.toLocalDate());
				}
				String type = rs.getString("type");
				e.setType(EventType.valueOf(type));

				events.add(e);
			}

		} catch (SQLException ex) {
			throw new RuntimeException("Erro ao listar eventos", ex);
		}

		return events;
	}
}
