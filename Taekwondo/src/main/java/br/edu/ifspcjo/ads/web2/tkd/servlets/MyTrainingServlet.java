package br.edu.ifspcjo.ads.web2.tkd.servlets;

import java.io.IOException;

import br.edu.ifspcjo.ads.web2.tkd.dao.TrainingDao;
import br.edu.ifspcjo.ads.web2.tkd.model.Student;
import br.edu.ifspcjo.ads.web2.tkd.utils.DataSourceSearcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/myTraining")
public class MyTrainingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        Student student = (session == null) ? null : (Student) session.getAttribute("student");
        if (student == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        resp.setHeader("Pragma", "no-cache");
        resp.setDateHeader("Expires", 0);

        TrainingDao dao = new TrainingDao(DataSourceSearcher.getInstance().getDataSource());
        req.setAttribute("trainings", dao.listByStudent(student));
        req.getRequestDispatcher("/my-training.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }
}
