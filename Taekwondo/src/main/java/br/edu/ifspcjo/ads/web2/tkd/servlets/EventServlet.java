package br.edu.ifspcjo.ads.web2.tkd.servlets;

import java.io.IOException;
import java.time.YearMonth;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import br.edu.ifspcjo.ads.web2.tkd.dao.EventDao;
import br.edu.ifspcjo.ads.web2.tkd.model.Event;
import br.edu.ifspcjo.ads.web2.tkd.model.MonthEvents;
import br.edu.ifspcjo.ads.web2.tkd.utils.DataSourceSearcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/events")
public class EventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		EventDao dao = new EventDao(DataSourceSearcher.getInstance().getDataSource());
		List<Event> all = dao.listAllOrderByDate();

		Map<Integer, List<Event>> eventsByMonth = new HashMap<>();
		for (Event e : all) {
			int m = e.getDate().getMonthValue();
			eventsByMonth.computeIfAbsent(m, x -> new ArrayList<>()).add(e);
		}

		List<MonthEvents> grouped = new ArrayList<>();
		Locale ptBR = new Locale("pt", "BR");

		for (int month = 1; month <= 12; month++) {

			YearMonth ym = YearMonth.of(2025, month);

			String monthName = ym.getMonth().getDisplayName(TextStyle.FULL, ptBR).toUpperCase();

			String label = monthName + " 2025";

			List<Event> list = eventsByMonth.getOrDefault(month, new ArrayList<>());

			Map<Integer, List<Event>> eventsByDay = new HashMap<>();
			for (Event e : list) {
				int day = e.getDate().getDayOfMonth();
				eventsByDay.computeIfAbsent(day, d -> new ArrayList<>()).add(e);
			}

			grouped.add(new MonthEvents(label, list, eventsByDay));
		}

		req.setAttribute("months", grouped);
		req.getRequestDispatcher("/event.jsp").forward(req, resp);
	}
}
