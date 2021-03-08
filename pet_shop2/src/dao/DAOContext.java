package dao;

import javax.servlet.ServletContext;

public class DAOContext {

	public static String URL;
	public static String LOGIN;
	public static String PASSWORD;

	public static void init(ServletContext context) {
		try {
			System.out.println(context.getInitParameter("JDBC_URL"));
			Class.forName(context.getInitParameter("JDBC_DRIVER"));
			URL = context.getInitParameter("JDBC_URL");
			LOGIN = context.getInitParameter("JDBC_LOGIN");
			PASSWORD = context.getInitParameter("JDBC_PASSWORD");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
