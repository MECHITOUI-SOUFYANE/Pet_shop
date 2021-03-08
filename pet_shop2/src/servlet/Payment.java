package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import business.ShoppinCart;
import business.User;
import dao.HistoryDAO;

@WebServlet("/payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<ShoppinCart> cart = new ArrayList<ShoppinCart>();
	
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		cart = ( ArrayList<ShoppinCart>)session.getAttribute("cart");
		
		int idUser =( (User)session.getAttribute("User")).getIdUser();
		for (ShoppinCart shoppinCart : cart) {
			
			HistoryDAO.updatePaymentData(idUser, shoppinCart.getProduct().getIdProduct(), shoppinCart.getQuantity());
		}
		session.setAttribute("checkout", null);
		session.setAttribute("continue", null);
		session.setAttribute("total", 0);  
		session.setAttribute("items", 0);
		session.setAttribute("cart", new ArrayList<ShoppinCart>());
		session.setAttribute("setEmpty", true);
		response.sendRedirect("index.jsp");
		
	}

}
