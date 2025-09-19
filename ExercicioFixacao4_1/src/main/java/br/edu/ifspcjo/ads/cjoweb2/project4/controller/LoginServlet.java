package br.edu.ifspcjo.ads.cjoweb2.project4.controller;

import java.io.IOException;

import br.edu.ifspcjo.ads.cjoweb2.project4.model.LoginService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		LoginService service = new LoginService();
		boolean ok = service.authenticate(email, password);
		
		
		if(ok) {
			req.setAttribute("userEmail", email);
			RequestDispatcher rd = req.getRequestDispatcher("/welcome.jsp");
			rd.forward(req, resp);
		}else {
			req.setAttribute("error", "E-mail ou senha inválidos.");
			RequestDispatcher rd = req.getRequestDispatcher("/error.jsp");
			rd.forward(req, resp);
		}
	}
}
