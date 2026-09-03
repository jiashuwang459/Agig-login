package com.agig;

import java.io.IOException;

import com.agig.validation.InputValidator;
import com.agig.validation.ValidationException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = -6122061203972006717L;

	private final UserDao userDao = new UserDao();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("user") != null) {
			response.sendRedirect("home");
			return;
		}

		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String username = InputValidator.validateUsername(request.getParameter("username"));

			String password = request.getParameter("password");

			if (password == null || password.isEmpty()) {
				// invalid login
				throw new ValidationException("Password cannot be empty", "password");
			}

			User user = userDao.authenticate(username, password);

			if (user == null) {
				response.sendRedirect("login?error=invalid");
				return;
			}

			HttpSession session = request.getSession();
			session.setAttribute("user", user);

			// Check if password meets current security requirements
			try {
				InputValidator.validatePassword(password);
			} catch (ValidationException e) {
				// Password doesn't meet current requirements, flag for update
				session.setAttribute("passwordNeedsUpdate", true);
			}

			response.sendRedirect("home");

		} catch (ValidationException e) {
			response.sendRedirect("login?error=invalid");
		}
	}

}
