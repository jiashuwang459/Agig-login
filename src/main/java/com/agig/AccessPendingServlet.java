package com.agig;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/access-pending")
public class AccessPendingServlet extends HttpServlet {

	private static final long serialVersionUID = 6089559769125381003L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("user") == null || session.getAttribute("pendingAccessGrant") == null) {
			response.sendRedirect("login");
			return;
		}

		request.getRequestDispatcher("/access-pending.jsp").forward(request, response);
	}
}
