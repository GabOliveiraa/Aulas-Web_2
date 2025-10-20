package br.edu.ifspcjo.ads.web2.tkd.servlets;

import java.io.IOException;
import java.util.Optional;

import br.edu.ifspcjo.ads.web2.tkd.dao.StudentDao;
import br.edu.ifspcjo.ads.web2.tkd.model.Student;
import br.edu.ifspcjo.ads.web2.tkd.utils.DataSourceSearcher;
import br.edu.ifspcjo.ads.web2.tkd.utils.PasswordEncoder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        StudentDao studentDao =
            new StudentDao(DataSourceSearcher.getInstance().getDataSource());

        Optional<Student> optional =
            studentDao.getByEmailAndPassword(email, PasswordEncoder.encode(password));

        String ctx = req.getContextPath().isEmpty() ? "/" : req.getContextPath();

        if (optional.isPresent()) {
            // cookie do usuário logado
            Cookie cookie = new Cookie("loggedUser", email);
            cookie.setMaxAge(60 * 60 * 24);
            cookie.setPath(ctx);
            resp.addCookie(cookie);

            // guarda o aluno na sessão
            req.getSession().setAttribute("student", optional.get());

            // REDIRECT para a área do aluno (muda a URL no navegador)
            resp.sendRedirect(ctx + "/home.jsp");
        } else {
            // limpa cookie, se existir
            Cookie clear = new Cookie("loggedUser", "");
            clear.setMaxAge(0);
            clear.setPath(ctx);
            resp.addCookie(clear);

            // REDIRECT de volta ao login com flag de erro (query string)
            resp.sendRedirect(ctx + "/login.jsp?result=loginError");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        resp.sendRedirect(req.getContextPath() + "/login.jsp");
    }
}
