package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import business.AllShopping;
import business.User;
import dao.HistoryDAO;
import dao.UserDAO;

@WebServlet("/adminSetting")
public class AdminSetting extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String show = request.getParameter("show");
		String block = request.getParameter("block");
		String restart = request.getParameter("restart");
		String r = request.getParameter("return");
		HttpSession session = request.getSession(true);
		int idUser = 0;
		if(request.getParameter("input")!=null) {
			idUser = Integer.valueOf(request.getParameter("input")).intValue();
		}
		if(show!=null) {
			User user = UserDAO.getUserById(idUser);
			request.setAttribute("userSelected", user);
			request.setAttribute("show", true);
			request.getRequestDispatcher("admin").forward(request, response);
		}else if(block!=null){
			UserDAO.blockUser(idUser);
			UserDAO.setOffline(idUser);			
			List<User> users = UserDAO.connectedUsers();
			List<User> Allusers = UserDAO.AllUsers();
			List<AllShopping> allShoppping = HistoryDAO.getProductBuy();
			session.setAttribute("connectedUsers", users);
			session.setAttribute("AllUsers", Allusers);
			session.setAttribute("allShoppping", allShoppping);
			request.setAttribute("show", false);
			request.getRequestDispatcher("admin").forward(request, response);
		}else if(restart!=null) {
			UserDAO.restartUser(idUser);
			List<User> users = UserDAO.connectedUsers();
			List<User> Allusers = UserDAO.AllUsers();
			List<AllShopping> allShoppping = HistoryDAO.getProductBuy();
			session.setAttribute("connectedUsers", users);
			session.setAttribute("AllUsers", Allusers);
			session.setAttribute("allShoppping", allShoppping);
			request.setAttribute("show", false);
			request.getRequestDispatcher("admin").forward(request, response);
		}else if(r!=null) {
			request.setAttribute("show", false);
			List<User> users = UserDAO.connectedUsers();
			List<User> Allusers = UserDAO.AllUsers();
			List<AllShopping> allShoppping = HistoryDAO.getProductBuy();
			session.setAttribute("connectedUsers", users);
			session.setAttribute("AllUsers", Allusers);
			session.setAttribute("allShoppping", allShoppping);
			request.getRequestDispatcher("admin").forward(request, response);
		}
	}

}
