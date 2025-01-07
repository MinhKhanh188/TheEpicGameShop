/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.GamesDBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Games;

/**
 *
 * @author Mr.Khanh
 */
public class SearchGamesServlet extends HttpServlet {

    private GamesDBConnect gamesDBConnect = new GamesDBConnect();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the search query from the request parameters
        String searchQuery = request.getParameter("searchQuery");

        // Get the search results
        List<Games> searchResults = gamesDBConnect.searchGamesByTitle(searchQuery);
        
        // Store the search results in request attribute to pass them to JSP
        request.setAttribute("searchResults", searchResults);
        
        // Forward to JSP for rendering
        request.getRequestDispatcher("/SearchResults.jsp").forward(request, response);
    }
}
