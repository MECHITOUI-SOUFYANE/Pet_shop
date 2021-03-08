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

import business.Product;
import business.ShoppinCart;
import dao.ProductDAO;

/**
 * Servlet implementation class Order
 */
@WebServlet("/order")
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<ShoppinCart> cart = new ArrayList<ShoppinCart>();
	private int shopping = 0;
	
	private  void addProduct(Product p) {
		for (ShoppinCart shoppinCart2 : cart) {
			if(shoppinCart2.getProduct().getIdProduct()==p.getIdProduct()) {
				shoppinCart2.incrementQuantity();
				shoppinCart2.incrementPrice();
				shopping+=20;
				return;
			}
		}
		
		cart.add(new ShoppinCart(p, 1,100));
		shopping+=20;
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		int idProduct = Integer.valueOf(request.getParameter("product")).intValue();
		Product product = ProductDAO.getProductById(idProduct);
		int prix = product.getPrice();
		if(session.getAttribute("setEmpty")!=null) {
			if((boolean)session.getAttribute("setEmpty")) {
				cart.clear();
				shopping=0;
				session.setAttribute("setEmpty", false);
			}			
		}
		addProduct(product);
		
		session.setAttribute("total", (Double.valueOf((Integer)session.getAttribute("total")).intValue()+prix));
		session.setAttribute("items", (Double.valueOf((Integer)session.getAttribute("items")).intValue()+1));
		session.setAttribute("cart", cart);
		session.setAttribute("shopping", shopping);
		session.setAttribute("shoppingTotal",(shopping+Double.valueOf((Integer)session.getAttribute("total")).intValue()));
		response.sendRedirect("details.jsp");
	}

}
