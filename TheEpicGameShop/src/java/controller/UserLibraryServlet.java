package controller;

import dal.UserGamesLibraryDBConnect;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Games;

/**
 * Servlet to handle displaying the user's game library
 */
public class UserLibraryServlet extends HttpServlet {

    /**
     * Handles the HTTP GET request
     *
     * @param request the HTTP request
     * @param response the HTTP response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userID = (int) session.getAttribute("userID");

        if (userID == 0) { // Assuming userID of 0 indicates no user is logged in
            response.sendRedirect("Login.jsp");
            return;
        }

        UserGamesLibraryDBConnect userGamesLibraryDB = new UserGamesLibraryDBConnect(userID);
        List<Games> userLibrary = userGamesLibraryDB.getUserLibrary();

        request.setAttribute("userLibrary", userLibrary);
        request.getRequestDispatcher("User_library.jsp").forward(request, response);
    }
}
