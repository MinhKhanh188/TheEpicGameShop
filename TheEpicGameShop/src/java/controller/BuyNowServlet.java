/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.GamesDBConnect;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import model.Games;

/**
 *
 * @author Mr.Khanh
 */
public class BuyNowServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int gameId = Integer.parseInt(request.getParameter("gameId"));

        HttpSession session = request.getSession();
        Map<Integer, Map<String, Object>> cart = (Map<Integer, Map<String, Object>>) session.getAttribute("cart");

        GamesDBConnect gamesDBConnect = new GamesDBConnect();

        // Retrieve game information from the database based on the game ID
        Games game = gamesDBConnect.getGameInformationByGameID(gameId);

        if (game != null) {
            // Create a map to hold game details
            Map<String, Object> gameDetails = new HashMap<>();
            gameDetails.put("title", game.getTitle());
            gameDetails.put("price", game.getPrice());
            gameDetails.put("imageLink", game.getImageLink());

            // Add game details to the cart
            if (cart == null) {
                cart = new HashMap<>();
            }
            cart.put(gameId, gameDetails);

            session.setAttribute("cart", cart);
        }

        // Redirect back to the game details page
        response.sendRedirect("ViewCartServlet");
    }
}
