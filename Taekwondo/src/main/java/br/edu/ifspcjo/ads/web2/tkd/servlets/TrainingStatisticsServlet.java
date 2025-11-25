package br.edu.ifspcjo.ads.web2.tkd.servlets;

import java.io.IOException;
import java.time.LocalDate;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import br.edu.ifspcjo.ads.web2.tkd.dao.TrainingDao;
import br.edu.ifspcjo.ads.web2.tkd.model.Student;
import br.edu.ifspcjo.ads.web2.tkd.utils.DataSourceSearcher;
import br.edu.ifspcjo.ads.web2.tkd.utils.LocalDateTypeAdapter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/trainingStatistics")
public class TrainingStatisticsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String category = req.getParameter("category");

        HttpSession session = req.getSession(false);
        Student student = (session != null) ? (Student) session.getAttribute("student") : null;

        if (student == null) {
            resp.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        TrainingDao trainingDao =
                new TrainingDao(DataSourceSearcher.getInstance().getDataSource());

        resp.setContentType("application/json;charset=UTF-8");

        switch (category) {
            case "byType" -> {
                Gson gson = new Gson();
                resp.getWriter().write(gson.toJson(trainingDao.getTrainingsStatisticsByType(student)));
            }
            case "byDay" -> {
                Gson gson = new GsonBuilder()
                        .registerTypeAdapter(LocalDate.class, new LocalDateTypeAdapter())
                        .create();
                resp.getWriter().write(gson.toJson(trainingDao.getTrainingsStatisticsByDay(student)));
            }
            default -> resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Categoria inválida");
        }
    }
}
