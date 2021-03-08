package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import business.User;

@WebServlet("/verify")
public class Verify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String continu = (String) request.getParameter("continue");
		String checkout = (String) request.getParameter("checkout");
		if (continu != null) {
			response.sendRedirect("index.jsp");
		} else if (checkout.equals("checkout")) {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("User");
			if (user == null) {
				session.setAttribute("checkout", checkout);
				request.getRequestDispatcher("myaccount.jsp").forward(request, response);
			} else {
				session.setAttribute("User", user);
				response.sendRedirect("checkout.jsp");
			}

		}
	}

}
