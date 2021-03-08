package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import business.User;
import crypto.TrippleDes;

public class UserDAO extends DAOContext {

	public static User isValidLogin(String login,String password)throws Exception {
		TrippleDes td= new TrippleDes();
		String target=password;				
		String encrypted=td.encrypt(target);
			try(Connection connection = DriverManager.getConnection(URL,LOGIN,PASSWORD)){
				String sql = "SELECT * FROM users WHERE login=? AND password=?";
				try(PreparedStatement statement = connection.prepareStatement(sql)){
					statement.setString(1, login);
					statement.setString(2,encrypted);
					try(ResultSet resultSet=statement.executeQuery()){
						if ( resultSet.next() ) {
							if(resultSet.getString("blocked").equals("0")) {
								return new User(
										resultSet.getInt( "idUser" ),
										resultSet.getString( "Login" ),
										resultSet.getString( "Password" ),
										resultSet.getString( "Email" ),
										resultSet.getString( "Phone" ),
										resultSet.getString( "Company" ),
										resultSet.getString( "Adress" ),
										resultSet.getInt("isAdmin"),
										Integer.valueOf(resultSet.getString("connected")),
										Integer.valueOf(resultSet.getString("blocked"))
										
								);
								
							}else {
								return null;
							}
							
							
						} else {
							return null;
						}
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				throw new RuntimeException(e);
			}
			
		}

	public static void registerUser(String login, String password, String email, String phone, String company,
			String adress) throws Exception {
		TrippleDes td = new TrippleDes();
		String target = password;
		String encrypted = td.encrypt(target);

		try (Connection connection = DriverManager.getConnection(URL, LOGIN, PASSWORD)) {
			String sql = "INSERT INTO users (Login,Password,Email,Phone,Company,Adress,connected) VALUES (?,?,?,?,?,?,?)";
			try (PreparedStatement statement = connection.prepareStatement(sql)) {
				statement.setString(1, login);
				statement.setString(2, encrypted);
				statement.setString(3, email);
				statement.setString(4, phone);
				statement.setString(5, company);
				statement.setString(6, adress);
				statement.setInt(7, 1);
				statement.executeUpdate();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}

	}

	public static void registerAdmin(String login, String password, String email, String phone, String company,
			String adress) throws Exception {
		TrippleDes td = new TrippleDes();
		String target = password;
		String encrypted = td.encrypt(target);

		try (Connection connection = DriverManager.getConnection(URL, LOGIN, PASSWORD)) {
			String sql = "INSERT INTO users (Login,Password,Email,Phone,Company,Adress,isAdmin) VALUES (?,?,?,?,?,?,?)";
			try (PreparedStatement statement = connection.prepareStatement(sql)) {
				statement.setString(1, login);
				statement.setString(2, encrypted);
				statement.setString(3, email);
				statement.setString(4, phone);
				statement.setString(5, company);
				statement.setString(6, adress);
				statement.setInt(7, 1);
				statement.executeUpdate();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}

	}

	public static List<User> connectedUsers() {
		List<User> connectedUsers = new ArrayList<User>();
		try (Connection connection = DriverManager.getConnection(URL, LOGIN, PASSWORD)) {
			String sql = "SELECT * FROM users WHERE connected = 1";
			try (Statement statement = connection.createStatement()) {
				try (ResultSet resultSet = statement.executeQuery(sql)) {
					while (resultSet.next()) {

						connectedUsers.add(new User(
								resultSet.getInt( "idUser" ),
								resultSet.getString( "Login" ),
								resultSet.getString( "Password" ),
								resultSet.getString( "Email" ),
								resultSet.getString( "Phone" ),
								resultSet.getString( "Company" ),
								resultSet.getString( "Adress" ),
								resultSet.getInt("isAdmin")	,
								Integer.valueOf(resultSet.getString("connected")),
								Integer.valueOf(resultSet.getString("blocked"))
						));
					}
					return connectedUsers;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}

	}

	public static void setOnline(int id){
		
		try(Connection connection = DriverManager.getConnection(URL,LOGIN,PASSWORD)){				
			String setConnected = "UPDATE users SET connected =? WHERE idUser=?";
			try(PreparedStatement pstatement = connection.prepareStatement(setConnected)){
				pstatement.setString(1, "1");
				pstatement.setInt(2, id);
				pstatement.executeUpdate();
				
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
}

public static void setOffline(int id) {
	

	try(Connection connection = DriverManager.getConnection(URL,LOGIN,PASSWORD)){			
		String setConnected = "UPDATE users SET connected =? WHERE idUser=?";
		try(PreparedStatement pstatement = connection.prepareStatement(setConnected)){
			pstatement.setString(1, "0");
			pstatement.setInt(2, id);
			pstatement.executeUpdate();
			 
		}
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
}

public static void blockUser(int id) {
	try(Connection connection = DriverManager.getConnection(URL,LOGIN,PASSWORD)){			
		String setConnected = "UPDATE users SET blocked =? WHERE idUser=?";
		try(PreparedStatement pstatement = connection.prepareStatement(setConnected)){
			pstatement.setString(1, "1");
			pstatement.setInt(2, id);
			pstatement.executeUpdate();
			 
		}
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
}
	public static boolean isExistLogin(String login) throws Exception {
		try (Connection connection = DriverManager.getConnection(URL, LOGIN, PASSWORD)) {
			String sql = "SELECT * FROM users WHERE login=?";
			try (PreparedStatement statement = connection.prepareStatement(sql)) {
				statement.setString(1, login);
				try (ResultSet resultSet = statement.executeQuery()) {
					if (resultSet.next()) {
						return true;

					} else {
						return false;
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}

	}

	public static boolean isExistEmail(String email) throws Exception {
		try (Connection connection = DriverManager.getConnection(URL, LOGIN, PASSWORD)) {
			String sql = "SELECT * FROM users WHERE email=?";
			try (PreparedStatement statement = connection.prepareStatement(sql)) {
				statement.setString(1, email);
				try (ResultSet resultSet = statement.executeQuery()) {
					if (resultSet.next()) {
						return true;
					} else {
						return false;
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}

	}
public static void restartUser(int id) {
	try(Connection connection = DriverManager.getConnection(URL,LOGIN,PASSWORD)){			
		String setConnected = "UPDATE users SET blocked =? WHERE idUser=?";
		try(PreparedStatement pstatement = connection.prepareStatement(setConnected)){
			pstatement.setString(1, "0");
			pstatement.setInt(2, id);
			pstatement.executeUpdate();
			
		}
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
}
public static User getUserById(int id) {
	try(Connection connection = DriverManager.getConnection(URL,LOGIN,PASSWORD)){			
		String setConnected = "SELECT * FROM users WHERE idUser=?";
		try(PreparedStatement pstatement = connection.prepareStatement(setConnected)){
			pstatement.setInt(1, id);
			try(ResultSet resultSet = pstatement.executeQuery()){
				if(resultSet.next()) {
					return new User(
							resultSet.getInt( "idUser" ),
							resultSet.getString( "Login" ),
							resultSet.getString( "Password" ),
							resultSet.getString( "Email" ),
							resultSet.getString( "Phone" ),
							resultSet.getString( "Company" ),
							resultSet.getString( "Adress" ),
							resultSet.getInt("isAdmin"),
							Integer.valueOf(resultSet.getString("connected")),
							Integer.valueOf(resultSet.getString("blocked"))
							
					);
				}else {
					return null;
				}
				
			}
			 
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		throw new RuntimeException(e);
	}
}

public static List<User> AllUsers(){
    List<User> AllUsers = new ArrayList<User>();
	try(Connection connection = DriverManager.getConnection(URL,LOGIN,PASSWORD)){
		String sql = "SELECT * FROM users ORDER BY idUser";
		try(Statement statement = connection.createStatement()){				
			try(ResultSet resultSet=statement.executeQuery(sql)){
				while ( resultSet.next() ) {
					
				AllUsers.add(new User(
							resultSet.getInt( "idUser" ),
							resultSet.getString( "Login" ),
							resultSet.getString( "Password" ),
							resultSet.getString( "Email" ),
							resultSet.getString( "Phone" ),
							resultSet.getString( "Company" ),
							resultSet.getString( "Adress" ),
							resultSet.getInt("isAdmin"),
							Integer.valueOf(resultSet.getString("connected")),
							Integer.valueOf(resultSet.getString("blocked"))
					));
				} 
					return AllUsers;						
			}
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		throw new RuntimeException(e);
	}
}
}