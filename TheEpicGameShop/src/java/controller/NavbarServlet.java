package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class NavbarServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set any attributes needed for the navbar here
        // For example, user information for a login/logout link

        RequestDispatcher dispatcher = request.getRequestDispatcher("Navbar.jsp");
        dispatcher.forward(request, response);
    }
}
