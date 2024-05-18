package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.GamesDBConnect;
import java.util.ArrayList;
import java.util.List;
import model.Games;

/**
 *
 * @author Mr.Khanh
 */
public class GameDetailsServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the game ID from the request parameter
        String gameIdString = request.getParameter("id");

        // Convert the game ID to an integer
        int gameId = Integer.parseInt(gameIdString);

        // Initialize a GamesDBConnect object to interact with the database
        GamesDBConnect gamesDBConnect = new GamesDBConnect();

        // Retrieve game information from the database based on the game ID
        Games game = gamesDBConnect.getGameInformationByGameID(gameId);

        // Create a list to hold the single game
        List<Games> gameList = new ArrayList<>();
        if (game != null) {
            gameList.add(game);
        }

        // Set the game list as an attribute in the request
        request.setAttribute("games", gameList);
        request.getRequestDispatcher("GameDetails.jsp").forward(request, response);
    }

}
