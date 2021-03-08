package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import business.Product;
import dao.ProductDAO;

/**
 * Servlet implementation class Detail
 */
@WebServlet("/Detail")
public class Detail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Product product;
		if (request.getParameter("id") != null) {
			int idProduct = Integer.valueOf(request.getParameter("id")).intValue();
			product = ProductDAO.getProductById(idProduct);
		} else {
			product = ProductDAO.getProductById(1);
		}

		HttpSession session = request.getSession(true);
		session.setAttribute("details_home", "non_vide");
		session.setAttribute("currentProduct", product);
		List<Product> relatedbooks = ProductDAO.RelatedBooks(product.getType(), product.getName());
		session.setAttribute("relatedbooks", relatedbooks);
		response.sendRedirect("details.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
