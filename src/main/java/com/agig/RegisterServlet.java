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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = -9162607866330931638L;

	private final UserDao userDao = new UserDao();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("user") != null) {
			response.sendRedirect("home");
			return;
		}

		request.getRequestDispatcher("/register.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("user") != null) {
			response.sendRedirect("home");
			return;
		}

		Map<String, List<String>> validationErrors = new HashMap<>();
		String username = null;
		String firstName = null;
		String lastName = null;
		String email = null;
		String password = null;

		// Validate each field and collect all errors
		try {
			username = InputValidator.validateUsername(request.getParameter("username"));
		} catch (ValidationException e) {
			validationErrors.computeIfAbsent(e.getField(), k -> new ArrayList<>()).add(e.getMessage());
		}

		try {
			firstName = InputValidator.validateFirstName(request.getParameter("firstName"));
		} catch (ValidationException e) {
			validationErrors.computeIfAbsent(e.getField(), k -> new ArrayList<>()).add(e.getMessage());
		}

		try {
			lastName = InputValidator.validateLastName(request.getParameter("lastName"));
		} catch (ValidationException e) {
			validationErrors.computeIfAbsent(e.getField(), k -> new ArrayList<>()).add(e.getMessage());
		}

		try {
			email = InputValidator.validateEmail(request.getParameter("email"));
		} catch (ValidationException e) {
			validationErrors.computeIfAbsent(e.getField(), k -> new ArrayList<>()).add(e.getMessage());
		}

		try {
			password = InputValidator.validatePassword(request.getParameter("password"));
		} catch (ValidationException e) {
			validationErrors.computeIfAbsent(e.getField(), k -> new ArrayList<>()).add(e.getMessage());
		}

		// If there are validation errors, display them all
		if (!validationErrors.isEmpty()) {
			request.setAttribute("validationErrors", validationErrors);
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}

		// All validations passed, try to create user
		try {
			userDao.createUser(username, firstName, lastName, email, password);

			HttpSession newSession = request.getSession(true);
			newSession.setAttribute("user", new User(username, firstName, lastName, email));
			newSession.setAttribute("pendingAccessGrant", true);

			response.sendRedirect("access-pending");
		} catch (DuplicateUserException e) {
			request.setAttribute("error", "Username or email is already tied to an existing access profile.");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
		}
	}

}
