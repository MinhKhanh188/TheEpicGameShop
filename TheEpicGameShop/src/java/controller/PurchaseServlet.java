package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.GamesDBConnect;
import dal.UserDBConnect;
import jakarta.servlet.http.HttpSession;
import model.Games;
import model.Users;

public class PurchaseServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve game IDs from the request
        String gameIdsStr = request.getParameter("gameIds");

        if (gameIdsStr == null || gameIdsStr.isEmpty()) {
            response.sendRedirect("Cart.jsp");
            return;
        }

        // Split the string into individual IDs
        String[] gameIdTokens = gameIdsStr.split(",");

        // Convert the game IDs from String to Integer
        List<Integer> gameIds = new ArrayList<>();
        for (String token : gameIdTokens) {
            try {
                gameIds.add(Integer.parseInt(token.trim()));
            } catch (NumberFormatException e) {
                // Handle invalid input if needed
                e.printStackTrace();
            }
        }

        // Use the GamesDBConnect to retrieve game details
        GamesDBConnect gamesDBConnect = new GamesDBConnect();
        List<Games> gamesList = gamesDBConnect.getGamesByIds(gameIds);

        // Set the retrieved games list as a request attribute to be accessed by the payment page
        request.setAttribute("gamesList", gamesList);
        request.setAttribute("gameIds", gameIdsStr);

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

        double userPurse = user.getUserPurse();
        // Set the userPurse as a request attribute to be accessed by the payment page
        request.setAttribute("userPurse", userPurse);

        request.getRequestDispatcher("Payment.jsp").forward(request, response);
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
        return "PurchaseServlet handles game purchases";
    }
}
