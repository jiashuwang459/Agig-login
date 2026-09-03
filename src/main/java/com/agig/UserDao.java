package com.agig;

import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

public class UserDao {

	private static final String PASSWORD = System.getenv("DB_PASSWORD");
	private static final String DB_HOST = System.getenv("DB_HOST");
	private static final String TS_PASSWORD = System.getenv("TS_PASSWORD");

	private static final String URL = "jdbc:mysql://" + DB_HOST + ":3306/mysql"
			+ "?sslMode=VERIFY_IDENTITY"
			+ "&trustCertificateKeyStoreUrl=classpath:rds-truststore.jks"
			+ "&trustCertificateKeyStoreType=PKCS12"
			+ "&trustCertificateKeyStorePassword=" + TS_PASSWORD;

	private static final String USER = "admin";

	private final PasswordHasher passwordHasher = new PasswordHasher();

	public User authenticate(String username, String password) {
		String query = """
				SELECT username, password_hash, first_name, last_name, email
				FROM agig.users
				WHERE username = ?
				""";
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
					PreparedStatement statement = connection.prepareStatement(query)) {

				statement.setString(1, username);

				try (ResultSet resultSet = statement.executeQuery()) {

					if (resultSet.next()) {
						String storedHash = resultSet.getString("password_hash");

						if (!passwordHasher.verify(password, storedHash)) {
							return null;
						} else {
							return new User(resultSet.getString("username"), resultSet.getString("first_name"),
									resultSet.getString("last_name"), resultSet.getString("email"));
						}
					}

					return null;
				}
			} catch (SQLException e) {
				// System.err.println("Database error: " + e.getMessage());
				throw new RuntimeException(e);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new RuntimeException("MySQL Driver not found on classpath!", e);
		}
	}

	public void createUser(String username, String firstName, String lastName, String email, String password)
			throws DuplicateUserException {

		String sql = """
				INSERT INTO agig.users
				    (username, password_hash, first_name, last_name, email)
				VALUES (?, ?, ?, ?, ?)
				""";

		String passwordHash = passwordHasher.hash(password);

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
					PreparedStatement statement = connection.prepareStatement(sql)) {

				statement.setString(1, username);
				statement.setString(2, passwordHash);
				statement.setString(3, firstName);
				statement.setString(4, lastName);
				statement.setString(5, email);

				statement.executeUpdate();

			} catch (SQLIntegrityConstraintViolationException e) {
				throw new DuplicateUserException();
			} catch (SQLException e) {
				throw new RuntimeException("Database error", e);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean changePassword(String username, String currentPassword, String newPassword) {
		String selectQuery = "SELECT password_hash FROM agig.users WHERE username = ?";
		String updateQuery = "UPDATE agig.users SET password_hash = ? WHERE username = ?";

		try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
				PreparedStatement selectStatement = connection.prepareStatement(selectQuery)) {

			selectStatement.setString(1, username);

			try (ResultSet resultSet = selectStatement.executeQuery()) {
				if (!resultSet.next()) {
					return false;
				}

				String storedHash = resultSet.getString("password_hash");
				if (!passwordHasher.verify(currentPassword, storedHash)) {
					return false;
				}
			}

			String newPasswordHash = passwordHasher.hash(newPassword);

			try (PreparedStatement updateStatement = connection.prepareStatement(updateQuery)) {
				updateStatement.setString(1, newPasswordHash);
				updateStatement.setString(2, username);
				return updateStatement.executeUpdate() == 1;
			}
		} catch (SQLException e) {
			throw new RuntimeException("Database error", e);
		}
	}

}
