package com.agig;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

//	private String URL = "jdbc:mysql://agig-login-db.ccl0aw0e8x8s.us-east-1.rds.amazonaws.com:3306/mysql"
//			+ "?sslMode=VERIFY_CA" + "&trustCertificateKeyStoreUrl=classpath:global-bundle.pem"
//			+ "&trustCertificateKeyStoreType=PEM";

    private String URL = "jdbc:mysql://agig-login-db.ccl0aw0e8x8s.us-east-1.rds.amazonaws.com:3306/mysql?useSSL=true&requireSSL=true&verifyServerCertificate=true&trustCertificateKeyStoreUrl=classpath:us-east-1-bundle.pem";
    
	private String USER = "admin";
	private static final String PASSWORD = System.getenv("DB_PASSWORD");

	public User authenticate(String username, String password) {

		String query = """
				SELECT username, first_name, last_name, email
				FROM users
				WHERE username = ? AND password = ?
				""";
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
					PreparedStatement statement = connection.prepareStatement(query)) {

				statement.setString(1, username);
				statement.setString(2, password);

				try (ResultSet resultSet = statement.executeQuery()) {

					if (resultSet.next()) {
						return new User(resultSet.getString("username"), resultSet.getString("first_name"),
								resultSet.getString("last_name"), resultSet.getString("email"));
					}

					return null;
				}
			} catch (SQLException e) {
				System.err.println("Database error: " + e.getMessage());
				throw new RuntimeException(e);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new RuntimeException("MySQL Driver not found on classpath!", e);
		}
	}

}
