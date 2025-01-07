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
public class SortedGamesByPriceRangeServlet extends HttpServlet {

    private GamesDBConnect gamesDBConnect = new GamesDBConnect();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the min and max price from the request parameters
        double minPrice = Double.parseDouble(request.getParameter("minPrice"));
        double maxPrice = Double.parseDouble(request.getParameter("maxPrice"));
        
        
       
        
        // Get the sorted games within the specified price range
        List<Games> sortedGames = gamesDBConnect.getGamesSortedByPriceRange(minPrice, maxPrice);
        
        // Store the sorted games in request attribute to pass them to JSP
        request.setAttribute("sortedGames", sortedGames);
        
        // Forward to JSP for rendering
        request.getRequestDispatcher("/SortedGames.jsp").forward(request, response);
    }
}