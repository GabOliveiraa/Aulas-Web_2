package br.edu.ifspcjo.ads.web2.servlets;

import java.io.IOException;
import java.time.LocalDate;

import br.edu.ifspcjo.ads.web2.dao.ActivityDao;
import br.edu.ifspcjo.ads.web2.model.Activity;
import br.edu.ifspcjo.ads.web2.model.ActivityType;
import br.edu.ifspcjo.ads.web2.model.User;
import br.edu.ifspcjo.ads.web2.utils.DataSourceSearcher;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/activityRegister")
public class ActivityRegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public ActivityRegisterServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long id = Long.parseLong(req.getParameter("id"));
		ActivityType type = ActivityType.valueOf(req.getParameter("type"));
		LocalDate date = LocalDate.parse(req.getParameter("date"));
		Double distance = Double.parseDouble(req.getParameter("distance"));
		Integer duration = Integer.parseInt(req.getParameter("duration"));

		HttpSession session = req.getSession(false);
		User user = (User)session.getAttribute("user");
		ActivityDao activityDao = new ActivityDao(DataSourceSearcher.getInstance().getDataSource());
		Activity activity = new Activity();
		activity.setType(type);
		activity.setDate(date);
		activity.setDistance(distance);
		activity.setDuration(duration);
		activity.setUser(user);
		if(id == 0) {
			if(activityDao.save(activity)) {
				req.setAttribute("result", "registered");
			}
		}else {
			activity.setId(id);
			if(activityDao.update(activity)) {
				req.setAttribute("result", "registered");
			}
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher("/activity-register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		Long activityId = Long.parseLong(req.getParameter("activity-id"));
		
		String url = null;
		ActivityDao activityDao = new ActivityDao(DataSourceSearcher.getInstance().getDataSource());
		Activity activity = activityDao.getActivitiesById(activityId); 
		if(activity != null) {
			if(action.equals("update")) {
				req.setAttribute("activity", activity);
				url = "/activity-register.jsp";
			}
			if(action.equals("delete")) {
				activityDao.delete(activity);
				url = "/homeServlet";
			}
		}else {
			url = "/homeServlet";
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(url);
		dispatcher.forward(req, resp);
	}

}