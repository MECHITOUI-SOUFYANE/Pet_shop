package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import business.CatalogBrowser;
import business.User;
import dao.UserDAO;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String logout = request.getParameter("logout");
		System.out.println("logout1");
		if(logout!=null) {
			System.out.println("logout");
			
				User user = (User)session.getAttribute("User");
				try {
					UserDAO.setOffline(user.getIdUser());
				}catch(NullPointerException e) {
					request.getRequestDispatcher("Exceptions.jsp");
				}
				
				
				session.setAttribute("User", null);
				session.setAttribute("catalogBrowser", new CatalogBrowser());
				session.setAttribute("total", 0);  
				session.setAttribute("items", 0);
				session.setAttribute("cart", null);
				session.setAttribute("shopping", 0);
				session.setAttribute("shoppingTotal", 0);
			    request.getRequestDispatcher("Home").forward(request, response);
		}
	}

}
