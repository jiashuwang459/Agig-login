package com.agig;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.agig.validation.InputValidator;
import com.agig.validation.ValidationException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/change-password")
public class ChangePasswordServlet extends HttpServlet {

	private static final long serialVersionUID = 2403304025246333830L;

	private final UserDao userDao = new UserDao();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect("login");
			return;
		}

		request.getRequestDispatcher("/change-password.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect("login");
			return;
		}

		User user = (User) session.getAttribute("user");

		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");

		Map<String, List<String>> changePasswordErrors = new HashMap<>();

		if (currentPassword == null || currentPassword.isBlank()) {
			changePasswordErrors.computeIfAbsent("currentPassword", k -> new ArrayList<>()).add("Current password is required");
		}

		try {
			newPassword = InputValidator.validatePassword(newPassword);
		} catch (ValidationException e) {
			changePasswordErrors.computeIfAbsent("newPassword", k -> new ArrayList<>()).add(e.getMessage());
		}

		if (currentPassword != null && !currentPassword.isBlank() && newPassword != null && currentPassword.equals(newPassword)) {
			changePasswordErrors.computeIfAbsent("newPassword", k -> new ArrayList<>())
					.add("New password must be different from current password");
		}

		if (confirmPassword == null || confirmPassword.isBlank()) {
			changePasswordErrors.computeIfAbsent("confirmPassword", k -> new ArrayList<>()).add("Please confirm your new password");
		} else if (newPassword != null && !confirmPassword.equals(newPassword)) {
			changePasswordErrors.computeIfAbsent("confirmPassword", k -> new ArrayList<>()).add("Passwords do not match");
		}

		if (!changePasswordErrors.isEmpty()) {
			request.setAttribute("changePasswordErrors", changePasswordErrors);
			request.getRequestDispatcher("/change-password.jsp").forward(request, response);
			return;
		}

		boolean changed = userDao.changePassword(user.getUsername(), currentPassword, newPassword);
		if (!changed) {
			changePasswordErrors.computeIfAbsent("currentPassword", k -> new ArrayList<>()).add("Current password is incorrect");
			request.setAttribute("changePasswordErrors", changePasswordErrors);
			request.getRequestDispatcher("/change-password.jsp").forward(request, response);
			return;
		}

		session.setAttribute("passwordNeedsUpdate", false);
		response.sendRedirect("change-password?updated=true");
	}
}