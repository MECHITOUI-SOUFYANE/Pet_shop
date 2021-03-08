package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import business.AllShopping;

public class HistoryDAO extends DAOContext {
	
	
	public static void updatePaymentData( int idUser , int idProduct , int quantity ) {
			
			try(Connection connection = DriverManager.getConnection(URL, LOGIN, PASSWORD)){
				String sql = "SELECT quantity FROM history WHERE idUser =? AND idProduct =?";
				try(PreparedStatement statement = connection.prepareStatement(sql)){
					statement.setInt(1, idUser);
					statement.setInt(2, idProduct);
					try(ResultSet resultSet = statement.executeQuery()){
						if(resultSet.next()) {
							int oldQuantity = resultSet.getInt("quantity");
							String sql2 = "UPDATE history SET quantity =? WHERE idUser =? AND idProduct =?";
							try(PreparedStatement statement2 = connection.prepareStatement(sql2)){
								statement2.setInt(1, oldQuantity+quantity);
								statement2.setInt(2, idUser);
								statement2.setInt(3, idProduct);
								statement2.executeUpdate();
							}
							return;
						}else {
							String sql3 = "INSERT INTO history (idUser,idProduct,quantity) VALUES (?,?,?)";
							try(PreparedStatement statement3 = connection.prepareStatement(sql3)){
								statement3.setInt(1, idUser);
								statement3.setInt(2, idProduct);
								statement3.setInt(3, quantity);
								statement3.executeUpdate();
							}
						}
						
					}
				}
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
			
			
	}
	
	public static List<AllShopping> getProductBuy(  ) {
			List<AllShopping> list = new ArrayList<AllShopping>();
			try(Connection connection = DriverManager.getConnection(URL, LOGIN, PASSWORD)){
				String sql = "SELECT users.idUser,users.Login,users.Email,products.Name,products.Price,history.quantity FROM users,products,history WHERE users.idUser=history.idUser AND products.idProduct=history.idProduct ";
				try(Statement statement = connection.createStatement()){
					try(ResultSet resultSet = statement.executeQuery(sql)){
						
						while (resultSet.next()) {
							
							list.add(new AllShopping(resultSet.getInt("idUser"),
													resultSet.getString("Login"),
													resultSet.getString("Email"), 
													resultSet.getString("Name"), 
													resultSet.getString("Price"),
													resultSet.getInt("quantity")));
						}
						return list;
					}
					
				}
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
			
			
	}
	
	
	

}
