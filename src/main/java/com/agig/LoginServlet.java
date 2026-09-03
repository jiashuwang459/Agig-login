package com.agig;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
    private static final long serialVersionUID = -6122061203972006717L;

	@Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/login.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDao userDao = new UserDao();
        User user = userDao.authenticate(username, password);

        if (user != null) {
            request.setAttribute("user", user);

            request.getRequestDispatcher("/welcome.jsp")
                   .forward(request, response);
        } else {
            response.sendError(
                    HttpServletResponse.SC_UNAUTHORIZED,
                    "Invalid username or password"
            );
        }
    }

}
