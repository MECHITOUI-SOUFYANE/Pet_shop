package forms;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import business.User;

public class InscriptionForm {
	String username, email, password, phone, company, adress;

	String terms;
	private String resultat;
	private Map<String, String> erreurs = new HashMap<String, String>();
	private Pattern[] patterns = { Pattern.compile("[a-zA-Z_]+\\d*"),
			Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*(_|[^\\w])).+$"),
			Pattern.compile("([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)"), Pattern.compile("^\\d+$") };

	public Map<String, String> getErreurs() {
		return erreurs;
	}

	public String getTerms() {
		return terms;
	}

	public String getResultat() {
		return resultat;
	}

	public void setResultat(String resultat) {
		this.resultat = resultat;
	}

	public User inscrire(HttpServletRequest request) {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String company = request.getParameter("company");
		String adress = request.getParameter("adress");
		terms = request.getParameter("terms");

		User user = new User();
		/* Validation du champ username. */
		try {
			validationName(username);
		} catch (Exception e) {
			erreurs.put("username", e.getMessage());
		}
		user.setLogin(username);
		/* Validation du champ password. */
		try {
			validationPassword(password);
		} catch (Exception e) {
			erreurs.put("password", e.getMessage());
		}
		user.setPassword(password);
		/* Validation du champ email. */
		try {
			validationEmail(email);
		} catch (Exception e) {
			erreurs.put("email", e.getMessage());
		}
		user.setEmail(email);
		/* Validation du champ phone. */
		try {
			validationPhone(phone);
		} catch (Exception e) {
			erreurs.put("phone", e.getMessage());
		}
		user.setPhone(phone);
		user.setCompany(company);
		/* Validation du champ adress. */
		try {
			validationAdress(adress);
		} catch (Exception e) {
			erreurs.put("adress", e.getMessage());
		}
		user.setAdress(adress);

		return user;
	}

	private void validationName(String name) throws Exception {
		if (name == null || name.trim().length() == 0)
			throw new Exception("*please enter a username.");
		// "concaténation d'une chaine de caractère et nombre(autoincrémente) et _(lieu
		// n'importe ou)"

		else {
			if (!patterns[0].matcher(name).matches())
				throw new Exception(
						"*please enter a username valide(a mix between letters and _ with a number at the end)");
		}

	}

	private void validationPassword(String password) throws Exception {
		if (password == null || password.length() == 0)
			throw new Exception("*Please enter your password.");

		else {
			if (password.length() < 8)
				throw new Exception("*Password must contain at least 8 characters.");
			else if (!patterns[1].matcher(password).matches())
				// "au moins un maj un min un nombre un chiffre spéciale
				// |\\d+|[.^\\s\\d[a-zA-Z]]+"
				throw new Exception(
						"*Please enter a password valid: password must contains at least one lower case char, upper case char, digit and symbol");

		}
	}

	private void validationEmail(String email) throws Exception {
		if (email != null && email.trim().length() != 0) {
			if (!patterns[2].matcher(email).matches()) {
				throw new Exception("*Please enter a valid email address.");
			}
		} else {
			throw new Exception("*Please enter an email address.");
		}
	}

	private void validationPhone(String phone) throws Exception {
		if (phone != null && phone.trim().length() != 0) {
			if (!patterns[3].matcher(phone).matches()) {
				throw new Exception("*Phone number must only contain digits.");
			} else if (phone.length() < 4) {
				throw new Exception("*The phone number must contain at least 4 digits.");
			}
		} else {
			throw new Exception("*Please enter a phone number.");
		}
	}

	private void validationAdress(String adresse) throws Exception {
		if (adresse != null && adresse.trim().length() != 0) {
			if (adresse.length() < 10) {
				throw new Exception("*Address must contain at least 10 characters.");
			}
		} else {
			throw new Exception("*Please enter an address.");
		}
	}

}