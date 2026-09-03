package com.agig;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/seed-users")
public class SeedUsersServlet extends HttpServlet {

	private static final long serialVersionUID = 428474792826162038L;

	private final UserDao userDao = new UserDao();

	// Predefined test users
	private static final Map<String, UserData> PREDEFINED_USERS = new HashMap<>();

	static {
		PREDEFINED_USERS.put("hostedftp", new UserData("hostedftp", "Hosted", "FTP", "hostedftp@example.com", "money"));
		PREDEFINED_USERS.put("jiashuwang459", new UserData("jiashuwang459", "Jiashu", "Wang", "jiashuwang459@gmail.com", "Password123!"));
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("users", PREDEFINED_USERS);
		request.getRequestDispatcher("/seed-users.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		String username = request.getParameter("username");

		if ("add".equals(action) && PREDEFINED_USERS.containsKey(username)) {
			UserData userData = PREDEFINED_USERS.get(username);
			try {
				userDao.createUser(userData.username, userData.firstName, userData.lastName, userData.email,
						userData.password);
				request.setAttribute("success", username + " has been added to the database.");
			} catch (DuplicateUserException e) {
				request.setAttribute("error", username + " already exists in the database.");
			} catch (Exception e) {
				request.setAttribute("error", "Error creating user: " + e.getMessage());
			}
		} else if ("addAll".equals(action)) {
			int added = 0;
			StringBuilder results = new StringBuilder();
			for (UserData userData : PREDEFINED_USERS.values()) {
				try {
					userDao.createUser(userData.username, userData.firstName, userData.lastName, userData.email,
							userData.password);
					added++;
					results.append(userData.username).append(" ✓ ");
				} catch (DuplicateUserException e) {
					results.append(userData.username).append(" (already exists) ");
				} catch (Exception e) {
					results.append(userData.username).append(" (error) ");
				}
			}
			request.setAttribute("success", "Added " + added + " user(s). Details: " + results.toString());
		}

		request.setAttribute("users", PREDEFINED_USERS);
		request.getRequestDispatcher("/seed-users.jsp").forward(request, response);
	}

	// Inner class to hold user data
	private static class UserData {
		String username;
		String firstName;
		String lastName;
		String email;
		String password;

		UserData(String username, String firstName, String lastName, String email, String password) {
			this.username = username;
			this.firstName = firstName;
			this.lastName = lastName;
			this.email = email;
			this.password = password;
		}
	}
}
