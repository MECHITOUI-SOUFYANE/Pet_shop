package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import business.Product;

public class ProductDAO extends DAOContext {

	public static int getProductCount() {
		try (Connection connection = DriverManager.getConnection(URL, LOGIN, PASSWORD)) {
			String sql = "SELECT count(idProduct) FROM products";
			try (Statement statement = connection.createStatement()) {
				try (ResultSet resultSet = statement.executeQuery(sql)) {
					resultSet.next();
					return resultSet.getInt(1);
				}
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}

	public static Product getProductById(int idProduct) {
		try (Connection connection = DriverManager.getConnection(URL, LOGIN, PASSWORD)) {
			String sql = "SELECT * FROM products WHERE idProduct=?";
			try (PreparedStatement statement = connection.prepareStatement(sql)) {
				statement.setInt(1, idProduct);
				try (ResultSet resultSet = statement.executeQuery()) {
					resultSet.next();
					return new Product(resultSet.getInt("idProduct"), resultSet.getString("Name"),
							resultSet.getString("Type"), resultSet.getString("Picture"),
							resultSet.getString("Description"), resultSet.getString("Details"),
							resultSet.getString("Advices"), resultSet.getInt("Price"),
							resultSet.getString("Categories"));
				}
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}

	public static List<Product> getProducts() {
		List<Product> products = new ArrayList<Product>();
		try (Connection connection = DriverManager.getConnection(URL, LOGIN, PASSWORD)) {
			String sql = "SELECT * FROM products";
			try (Statement statement = connection.createStatement()) {
				try (ResultSet resultSet = statement.executeQuery(sql)) {
					while (resultSet.next()) {
						products.add(new Product(resultSet.getInt("idProduct"), resultSet.getString("Name"),
								resultSet.getString("Type"), resultSet.getString("Picture"),
								resultSet.getString("Description"), resultSet.getString("Details"),
								resultSet.getString("Advices"), resultSet.getInt("Price"),
								resultSet.getString("Categories")));
					}
					return products;
				}
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}

	public static List<Product> RelatedBooks(String type, String name) {
		List<Product> products = new ArrayList<Product>();
		try (Connection connection = DriverManager.getConnection(URL, LOGIN, PASSWORD)) {
			String sql = "SELECT * FROM products WHERE Type=? AND Name!=?";
			try (PreparedStatement statement = connection.prepareStatement(sql)) {
				statement.setString(1, type);
				statement.setString(2, name);
				try (ResultSet resultSet = statement.executeQuery()) {
					while (resultSet.next()) {
						products.add(new Product(resultSet.getInt("idProduct"), resultSet.getString("Name"),
								resultSet.getString("Type"), resultSet.getString("Picture"),
								resultSet.getString("Description"), resultSet.getString("Details"),
								resultSet.getString("Advices"), resultSet.getInt("Price"),
								resultSet.getString("Categories")));

					}
					return products;
				}
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
