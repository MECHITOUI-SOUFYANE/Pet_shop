package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import business.AllShopping;
import business.User;
import dao.HistoryDAO;
import dao.UserDAO;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * request.setAttribute( "user", "" ); request.setAttribute( "password", "" );
		 * request.setAttribute( "errorMessage", "" );
		 */
		request.getRequestDispatcher("/Home?page=myaccount").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		try {

			User user = UserDAO.isValidLogin(username, password);
			if (user == null) {

				request.setAttribute("errorMessage", "\r\n" + "Incorrect email address or password.");
				request.getRequestDispatcher("myaccount.jsp").forward(request, response);
			} else {
				if (remember != null && remember.equals("on")) {
					Cookie cookie1 = new Cookie("username", username);
					cookie1.setMaxAge(60 * 60);
					response.addCookie(cookie1);
					Cookie cookie2 = new Cookie("password", password);
					cookie2.setMaxAge(60 * 60 * 24 * 365);
					response.addCookie(cookie2);
				}
				if (user.getIsAdmin() == 0) {
					if (session.getAttribute("checkout") != null) {
						session.setAttribute("User", user);
						UserDAO.setOnline(user.getIdUser());
						response.sendRedirect("checkout.jsp");

					} else {
						session.setAttribute("User", user);
						UserDAO.setOnline(user.getIdUser());
						response.sendRedirect("index.jsp");

					}
				} else {
					List<User> users = UserDAO.connectedUsers();
					List<User> Allusers = UserDAO.AllUsers();
					List<AllShopping> allShoppping = HistoryDAO.getProductBuy();
					UserDAO.setOnline(user.getIdUser());
					session.setAttribute("User", user);
					session.setAttribute("connectedUsers", users);
					session.setAttribute("AllUsers", Allusers);
					session.setAttribute("allShoppping", allShoppping);
					request.getRequestDispatcher("admin").forward(request, response);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
