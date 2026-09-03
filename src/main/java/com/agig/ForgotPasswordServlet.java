package com.agig;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {

	private static final long serialVersionUID = 2556561022218465824L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("user") != null) {
			response.sendRedirect("home");
			return;
		}

		request.getRequestDispatcher("/forgot-password.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");

		// Validate that username is provided and not empty
		if (username != null && !username.trim().isEmpty()) {
			// Validation passed, set lockout notice
			request.setAttribute("lockoutNotice", true);
		}

		request.getRequestDispatcher("/forgot-password.jsp").forward(request, response);
	}
}
