package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import business.User;
import dao.DAOContext;
import dao.UserDAO;
import forms.InscriptionForm;

/**
 * Servlet implementation class Register
 */
@WebServlet(urlPatterns = "/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	/**
	 * @see HttpServlet#doGet(HthtpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void init() throws ServletException {
		DAOContext.init(this.getServletContext());
		System.out.println("init");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * request.setAttribute( "user", "" ); request.setAttribute( "password", "" );
		 * request.setAttribute( "errorMessage", "" );
		 */
		request.getRequestDispatcher("/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		InscriptionForm inscription = new InscriptionForm();
		User user = inscription.inscrire(request);
		request.setAttribute("user", user);
		request.setAttribute("inscription", inscription);
		//
		if (inscription.getTerms() == null) {
			request.setAttribute("terms", "*you must be agree");
			this.getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
		}

		else if (inscription.getTerms().equals("on")) {
			request.setAttribute("terms", "");
			if (inscription.getErreurs().isEmpty()) {
				/* Si aucune erreur, alors affichage de la fiche récapitulative */
				try {
					if (UserDAO.isExistLogin(user.getLogin())) {
						inscription.setResultat("username already exist");
						this.getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
					} else if (UserDAO.isExistEmail(user.getEmail())) {
						inscription.setResultat("email already exist");
						this.getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
					} else {
						try {
							UserDAO.registerUser(user.getLogin(), user.getPassword(), user.getEmail(), user.getPhone(),
									user.getCompany(), user.getAdress());
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				// this.getServletContext().getRequestDispatcher("/Home").forward(request,
				// response);
				response.sendRedirect("Home");
			} else {
				/* Sinon, ré-affichage du formulaire de création avec les erreurs */
				inscription.setResultat("Échec de l'inscription.");
				this.getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
			}
		}
	}

}
