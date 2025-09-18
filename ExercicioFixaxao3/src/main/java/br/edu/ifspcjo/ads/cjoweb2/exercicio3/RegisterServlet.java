package br.edu.ifspcjo.ads.cjoweb2.exercicio3;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");

		String name = req.getParameter("name");

		String[] emails = req.getParameterValues("email");

		String[] courses = req.getParameterValues("options");

		PrintWriter out = resp.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html><head><meta charset='UTF-8'><title>Resultado</title></head><body>");
		out.println("<h2>Enviado!</h2>");

		out.println("<p><b>Nome:</b> " + name + "</p>");

		if (emails != null) {
			out.println("<p><b>E-mails:</b></p>");
			for (String email : emails) {
					out.println("<p>" + email + "</p>");
			}
		}

		if (courses != null) {
			out.println("<p><b>Cursos escolhidos:</b></p>");
			for (String course : courses) {
				out.println("<p>" + course + "</p>");
			}
		}

		out.println("</body></html>");
	}
}
