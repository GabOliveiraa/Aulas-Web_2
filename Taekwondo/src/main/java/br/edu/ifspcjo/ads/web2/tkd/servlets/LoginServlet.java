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
            throws IOException, ServletException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        StudentDao studentDao = new StudentDao(DataSourceSearcher.getInstance().getDataSource());
        Optional<Student> opt = studentDao.getByEmailAndPassword(email, PasswordEncoder.encode(password));

        String ctx = req.getContextPath().isEmpty() ? "/" : req.getContextPath();

        if (opt.isPresent()) {
            req.getSession().setAttribute("student", opt.get());
            req.getSession().setMaxInactiveInterval(30 * 60);

            resp.sendRedirect(ctx + "/home.jsp");
        } else {
            resp.sendRedirect(ctx + "/login.jsp?result=loginError");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect(req.getContextPath() + "/login.jsp");
    }
}
