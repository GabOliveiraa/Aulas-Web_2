package br.edu.ifspcjo.ads.web2.tkd.servlets;

import java.io.IOException;
import java.time.LocalDate;

import br.edu.ifspcjo.ads.web2.tkd.dao.CompetitionDao;
import br.edu.ifspcjo.ads.web2.tkd.model.Competition;
import br.edu.ifspcjo.ads.web2.tkd.model.CompetitionResult;
import br.edu.ifspcjo.ads.web2.tkd.model.CompetitionType;
import br.edu.ifspcjo.ads.web2.tkd.model.Student;
import br.edu.ifspcjo.ads.web2.tkd.utils.DataSourceSearcher;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/competitionRegister")
public class CompetitionRegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public CompetitionRegisterServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Student logged = (Student) req.getSession().getAttribute("student");
        if (logged == null) {
            req.setAttribute("result", "notRegistered");
            req.getRequestDispatcher("/competition-register.jsp").forward(req, resp);
            return;
        }

        CompetitionType type = CompetitionType.valueOf(req.getParameter("competitionType"));
        String category = req.getParameter("category");
        CompetitionResult result = CompetitionResult.valueOf(req.getParameter("result"));
        LocalDate eventDate = LocalDate.parse(req.getParameter("eventDate"));

        Competition c = new Competition();
        c.setCompetitionType(type);
        c.setCategory(category);
        c.setResult(result);
        c.setEventDate(eventDate);
        c.setStudent(logged);

        CompetitionDao dao = new CompetitionDao(DataSourceSearcher.getInstance().getDataSource());
        RequestDispatcher dispatcher;
        if (dao.save(c)) {
            req.setAttribute("result", "registered");
            dispatcher = req.getRequestDispatcher("/competition-register.jsp");
        } else {
            req.setAttribute("result", "notRegistered");
            dispatcher = req.getRequestDispatcher("/competition-register.jsp");
        }

        dispatcher.forward(req, resp);
    }
}
