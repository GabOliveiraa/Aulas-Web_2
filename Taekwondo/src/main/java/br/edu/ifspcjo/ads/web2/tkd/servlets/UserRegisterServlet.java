package br.edu.ifspcjo.ads.web2.tkd.servlets;

import java.io.IOException;
import java.time.LocalDate;

import br.edu.ifspcjo.ads.web2.tkd.dao.StudentDao;
import br.edu.ifspcjo.ads.web2.tkd.model.Belt;
import br.edu.ifspcjo.ads.web2.tkd.model.Gender;
import br.edu.ifspcjo.ads.web2.tkd.model.Student;
import br.edu.ifspcjo.ads.web2.tkd.utils.DataSourceSearcher;
import br.edu.ifspcjo.ads.web2.tkd.utils.PasswordEncoder;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/userRegisterServlet")
public class UserRegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public UserRegisterServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String birthDate = req.getParameter("birthDate");
        String gender = req.getParameter("gender");
        String belt = req.getParameter("belt");

        Student student = new Student();
        student.setName(name);
        student.setEmail(email);
        student.setPassword(PasswordEncoder.encode(password));
        student.setBirthDate(LocalDate.parse(birthDate));
        student.setGender(Gender.valueOf(gender));
        student.setBelt(Belt.valueOf(belt));
        student.setActive(true);

        StudentDao studentDao = new StudentDao(DataSourceSearcher.getInstance().getDataSource());

        RequestDispatcher dispatcher = null;

        if (studentDao.save(student)) {
            req.setAttribute("result", "registered");
            dispatcher = req.getRequestDispatcher("/login.jsp");
        } else {
            req.setAttribute("result", "notRegistered");
            dispatcher = req.getRequestDispatcher("/user-register.jsp");
        }

        dispatcher.forward(req, resp);
    }
}