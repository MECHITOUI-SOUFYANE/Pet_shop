package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import business.CatalogBrowser;
import business.Product;
import dao.DAOContext;

@WebServlet(urlPatterns = "/Home", loadOnStartup = 1)
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String VUE_FORM = ".jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init() throws ServletException {
		DAOContext.init(this.getServletContext());
	
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("username"))
					session.setAttribute("usernamec", cookie.getValue());
				if (cookie.getName().equals("password"))
					session.setAttribute("passwordc", cookie.getValue());
			}
		}

		session.setAttribute("index_home", "non_vide");
		session.setAttribute("specials_home", "non_vide");
		session.setAttribute("categories_home", "non_vide");
		session.setAttribute("about_home", "non_vide");
		session.setAttribute("account_home", "non_vide");
		session.setAttribute("register_home", "non_vide");
		session.setAttribute("contact_home", "non_vide");
		session.setAttribute("cart_home", "non_vide");
		session.setAttribute("User", null);
		session.setAttribute("catalogBrowser", new CatalogBrowser());
		session.setAttribute("total", 0);
		session.setAttribute("items", 0);
		session.setAttribute("cart", new ArrayList<Product>());
		session.setAttribute("shopping", null);
		session.setAttribute("shoppingTotal", null);
		String page = (String) request.getParameter("page");
		if (page != null)
			response.sendRedirect(page + VUE_FORM);
		else
			response.sendRedirect("index.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
