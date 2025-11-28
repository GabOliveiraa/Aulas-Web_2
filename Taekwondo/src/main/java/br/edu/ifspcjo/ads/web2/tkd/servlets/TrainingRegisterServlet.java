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

        // Aluno logado
        Student student = (Student) req.getSession().getAttribute("student");
        if (student == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        // Lê campos do form
        String idParam   = req.getParameter("id");
        String typeParam = req.getParameter("type");
        String dateParam = req.getParameter("date");

        Long id = null;
        try {
            id = Long.parseLong(idParam);
        } catch (Exception ignore) {
            // se não vier id, deixa null --> cadastro novo
        }

        // -------- VALIDAÇÃO SIMPLES --------
        boolean hasError = false;

        // Validar tipo de treino
        if (typeParam == null || typeParam.isBlank()) {
            // atributo para o JSP saber que deu erro no select
            req.setAttribute("typeError", "Selecione um tipo de treino.");
            hasError = true;
        }

        // Validar data
        if (dateParam == null || dateParam.isBlank()) {
            req.setAttribute("dateError", "Informe a data do treino.");
            hasError = true;
        }

        // Se tiver erro, volta pra tela de cadastro com os dados preenchidos
        if (hasError) {
            Training t = new Training();
            t.setId(id);
            t.setStudent(student);

            if (typeParam != null && !typeParam.isBlank()) {
                try {
                    t.setType(TrainingType.valueOf(typeParam));
                } catch (IllegalArgumentException e) {
                    // se vier valor inválido, ignora
                }
            }
            if (dateParam != null && !dateParam.isBlank()) {
                try {
                    t.setDate(LocalDate.parse(dateParam));
                } catch (Exception e) {
                    // data inválida, ignora
                }
            }

            // manda o objeto para o JSP reaproveitar os campos
            req.setAttribute("training", t);

            // encaminha de volta pro form
            req.getRequestDispatcher("/training-register.jsp")
               .forward(req, resp);
            return;
        }

        Training t = new Training();
        t.setStudent(student);
        t.setType(TrainingType.valueOf(typeParam));
        t.setDate(LocalDate.parse(dateParam));

        TrainingDao dao =
                new TrainingDao(DataSourceSearcher.getInstance().getDataSource());

        boolean ok;
        if (id == null || id == 0) {
            // novo treino
            ok = dao.save(t);
        } else {
            // atualização
            t.setId(id);
            ok = dao.update(t);
        }

        if (ok) {
            // funcionou volta pra listagem
            resp.sendRedirect(req.getContextPath() + "/myTraining");
        } else {
            // deu ruim no DAO
            req.setAttribute("result", "notRegistered");
            req.getRequestDispatcher("/training-register.jsp")
               .forward(req, resp);
        }
    }
}
