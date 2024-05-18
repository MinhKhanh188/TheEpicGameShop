package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dal.UserDBConnect;
import model.Users;

public class UserViewProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users currentUser = (Users) session.getAttribute("loggedUser");

        if (currentUser == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        UserDBConnect userDB = new UserDBConnect();
        Users user = userDB.getUserByID(currentUser.getUserID());

        if (user == null) {
            response.sendRedirect("error.jsp");
            return;
        }

        request.setAttribute("userProfile", user);
        request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles user profile viewing";
    }
}
