package br.edu.ifspcjo.ads.web2.tkd.servlets;

import java.io.IOException;

import br.edu.ifspcjo.ads.web2.tkd.dao.StudentDao;
import br.edu.ifspcjo.ads.web2.tkd.model.Belt;
import br.edu.ifspcjo.ads.web2.tkd.model.Student;
import br.edu.ifspcjo.ads.web2.tkd.utils.DataSourceSearcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/profile")
public class StudentProfileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	void prepareProfilePage(HttpServletRequest req, HttpSession session) {
		Student student = (Student) session.getAttribute("student");
		req.setAttribute("student", student);

		Belt[] belts = Belt.values();
		req.setAttribute("belts", belts);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("student") == null) {
			resp.sendRedirect(req.getContextPath() + "/login.jsp");
			return;
		}

		prepareProfilePage(req, session);
		req.getRequestDispatcher("/profile.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("student") == null) {
			resp.sendRedirect(req.getContextPath() + "/login.jsp");
			return;
		}

		Student student = (Student) session.getAttribute("student");

		String beltParam = req.getParameter("belt");
		if (beltParam == null || beltParam.isBlank()) {
			req.setAttribute("error", "Selecione uma faixa.");
			prepareProfilePage(req, session);
			req.getRequestDispatcher("/profile.jsp").forward(req, resp);
			return;
		}

		Belt newBelt;
		try {
			newBelt = Belt.valueOf(beltParam);
		} catch (IllegalArgumentException e) {
			req.setAttribute("error", "Faixa inválida.");
			prepareProfilePage(req, session);
			req.getRequestDispatcher("/profile.jsp").forward(req, resp);
			return;
		}

		StudentDao dao = new StudentDao(DataSourceSearcher.getInstance().getDataSource());
		boolean ok = dao.updateBelt(student.getId(), newBelt);

		if (ok) {
			student.setBelt(newBelt);
			session.setAttribute("student", student);
			resp.sendRedirect(req.getContextPath() + "/profile");
		} else {
			req.setAttribute("error", "Não foi possível atualizar a faixa.");
			prepareProfilePage(req, session);
			req.getRequestDispatcher("/profile.jsp").forward(req, resp);
		}
	}
}
