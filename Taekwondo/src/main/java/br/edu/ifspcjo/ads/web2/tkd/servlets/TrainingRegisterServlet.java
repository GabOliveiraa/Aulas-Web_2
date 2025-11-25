package br.edu.ifspcjo.ads.web2.tkd.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Optional;

import com.google.gson.Gson;

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
import jakarta.servlet.http.HttpSession;

@WebServlet("/training")
public class TrainingRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        Long trainingId = null;

        try {
            trainingId = Long.parseLong(req.getParameter("id"));
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/myTraining");
            return;
        }

        TrainingDao trainingDao =
                new TrainingDao(DataSourceSearcher.getInstance().getDataSource());

        HttpSession session = req.getSession(false);
        Student student = (session != null)
                ? (Student) session.getAttribute("student")
                : null;

        if (student == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        if ("edit".equals(action)) {
            Optional<Training> opt = trainingDao.findById(trainingId);
            if (opt.isPresent()) {
                req.setAttribute("training", opt.get());
                req.getRequestDispatcher("/training-register.jsp")
                        .forward(req, resp);
                return;
            }

            resp.sendRedirect(req.getContextPath() + "/myTraining");
            return;
        }

        if ("delete".equals(action)) {
            boolean result = trainingDao.delete(trainingId, student.getId());

            Gson gson = new Gson();
            String json = gson.toJson(result);

            resp.setContentType("application/json;charset=UTF-8");
            resp.getWriter().write(json);
            return;
        }


        resp.sendRedirect(req.getContextPath() + "/myTraining");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        Student student = (session != null)
                ? (Student) session.getAttribute("student")
                : null;

        if (student == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        Long id = null;
        try {
            id = Long.parseLong(req.getParameter("id"));
        } catch (Exception ignore) {
        }

        Training t = new Training();
        t.setType(TrainingType.valueOf(req.getParameter("type")));
        t.setDate(LocalDate.parse(req.getParameter("date")));
        t.setStudent(student);

        TrainingDao dao =
                new TrainingDao(DataSourceSearcher.getInstance().getDataSource());

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
            req.getRequestDispatcher("/training-register.jsp")
                    .forward(req, resp);
        }
    }
}
