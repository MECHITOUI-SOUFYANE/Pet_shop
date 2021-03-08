package business;

import java.io.Serializable;

public class User implements Serializable{
	private static final long serialVersionUID = 303669202084881958L;
	private int idUser;
	private String login;
	private String password;
	private String email;
	private String phone;
	private String company;
	private String adress;
	private int isAdmin;
	private int connected;
	private int blocked ;
	public User() {

	}

	public User(int idUser, String login, String password, String email, String phone, String company, String adress) {
		this.idUser = idUser;
		this.login = login;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.company = company;
		this.adress = adress;
	}

	public User(int idUser ,String login, String password, String email, String phone, String company, String adress,int isAdmin,int connected,int blocked) {
		this.idUser = idUser;
		this.login = login;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.company = company;
		this.adress = adress;
		this.isAdmin = isAdmin;
		this.connected=connected;
		this.blocked=blocked;
	}

	public int getIdUser() {
		return idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public int getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}
	public int getConnected() {
		return connected;
	}
	public void setConnected(int connected) {
		this.connected = connected;
	}
	public int getBlocked() {
		return blocked;
	}
	public void setBlocked(int blocked) {
		this.blocked = blocked;
	}

}
