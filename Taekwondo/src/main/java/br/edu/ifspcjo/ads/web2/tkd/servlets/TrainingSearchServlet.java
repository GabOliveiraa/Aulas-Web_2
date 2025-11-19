package br.edu.ifspcjo.ads.web2.tkd.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import br.edu.ifspcjo.ads.web2.tkd.dao.TrainingDao;
import br.edu.ifspcjo.ads.web2.tkd.dao.filters.TrainingFilter;
import br.edu.ifspcjo.ads.web2.tkd.model.Student;
import br.edu.ifspcjo.ads.web2.tkd.model.Training;
import br.edu.ifspcjo.ads.web2.tkd.model.TrainingType;
import br.edu.ifspcjo.ads.web2.tkd.utils.DataSourceSearcher;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/trainingSearch")
public class TrainingSearchServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String typeParam = req.getParameter("type");
        TrainingType type = null;
        if (typeParam != null && !typeParam.isEmpty()) {
            type = TrainingType.valueOf(typeParam);
        }

        String initialDateParam = req.getParameter("initial-date");
        LocalDate initialDate = null;
        if (initialDateParam != null && !initialDateParam.isEmpty()) {
            initialDate = LocalDate.parse(initialDateParam);
        }

        String finalDateParam = req.getParameter("final-date");
        LocalDate finalDate = null;
        if (finalDateParam != null && !finalDateParam.isEmpty()) {
            finalDate = LocalDate.parse(finalDateParam);
        }

        HttpSession session = req.getSession(false);
        Student student = (Student) session.getAttribute("student");

        TrainingFilter filter = new TrainingFilter();
        filter.setStudent(student);
        filter.setType(type);
        filter.setInitialDate(initialDate);
        filter.setFinalDate(finalDate);

        TrainingDao dao = new TrainingDao(DataSourceSearcher.getInstance().getDataSource());
        List<Training> trainings = dao.listByFilter(filter);

        req.setAttribute("trainings", trainings);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/my-training.jsp");
        dispatcher.forward(req, resp);
    }
}

