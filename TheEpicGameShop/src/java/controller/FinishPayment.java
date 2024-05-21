package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.UserDBConnect;
import dal.UserGamesLibraryDBConnect;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;

public class FinishPayment extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        // Retrieve remaining balance from request parameters
        double remainingBalance = Double.parseDouble(request.getParameter("remainingBalance"));
        String gameIdsStr = request.getParameter("gameIds");

        // Get the current user's ID from the session or request attributes
        // For demonstration purposes, let's assume it's stored in the session attribute "userID"
        int userID = (int) request.getSession().getAttribute("userID");

        // Update user's purse balance in the database
        UserDBConnect userDB = new UserDBConnect();
        userDB.updateUserPurse(userID, remainingBalance);

        // Add purchased games to the user's library
        UserGamesLibraryDBConnect userGamesLibraryDB = new UserGamesLibraryDBConnect(userID);
        // Parse game IDs string to a list of integers
        List<Integer> gameIdsList = Arrays.stream(gameIdsStr.split(","))
                .map(Integer::parseInt)
                .collect(Collectors.toList());
        userGamesLibraryDB.addGamesToUserLibrary(gameIdsList);

        request.getSession().removeAttribute("cart");
        request.getSession().removeAttribute("totalPrice");
        // Redirect to success page or display a message
        response.sendRedirect("Success.jsp"); // Change "success.jsp" to your success page
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(FinishPayment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(FinishPayment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "FinishPayment servlet updates user's purse balance";
    }
}
