package br.edu.ifspcjo.ads.web2.tkd.servlets;

import java.io.IOException;
import java.time.LocalDate;

import br.edu.ifspcjo.ads.web2.tkd.dao.TrainingDao;
import br.edu.ifspcjo.ads.web2.tkd.model.Student;
import br.edu.ifspcjo.ads.web2.tkd.model.Training;
import br.edu.ifspcjo.ads.web2.tkd.model.TrainingType;
import br.edu.ifspcjo.ads.web2.tkd.utils.DataSourceSearcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/training")
public class TrainingRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Student student = (Student) req.getSession().getAttribute("student");
        if (student == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        String action = req.getParameter("action");
        Long id = null;
        try { id = Long.parseLong(req.getParameter("id")); } catch (Exception ignore){}

        TrainingDao dao = new TrainingDao(DataSourceSearcher.getInstance().getDataSource());

        if ("edit".equalsIgnoreCase(action) && id != null) {
            dao.findById(id).ifPresent(t -> req.setAttribute("training", t));
            req.getRequestDispatcher("/training-register.jsp").forward(req, resp);
            return;
        }

        if ("delete".equalsIgnoreCase(action) && id != null) {
            dao.delete(id, student.getId());
            resp.sendRedirect(req.getContextPath() + "/myTraining");
            return;
        }

        req.getRequestDispatcher("/training-register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Student student = (Student) req.getSession().getAttribute("student");
        if (student == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        Long id = null;
        try { id = Long.parseLong(req.getParameter("id")); } catch (Exception ignore){}

        Training t = new Training();
        t.setType(TrainingType.valueOf(req.getParameter("type")));
        t.setDate(LocalDate.parse(req.getParameter("date")));
        t.setStudent(student);

        TrainingDao dao = new TrainingDao(DataSourceSearcher.getInstance().getDataSource());

        boolean ok;
        if (id == null || id == 0) {
            ok = dao.save(t);
        } else {
            t.setId(id);
            ok = dao.update(t);
        }

        if (ok) {
            resp.sendRedirect(req.getContextPath() + "/myTraining");
        } else {
            req.setAttribute("result", "notRegistered");
            req.getRequestDispatcher("/training-register.jsp").forward(req, resp);
        }
    }
}
