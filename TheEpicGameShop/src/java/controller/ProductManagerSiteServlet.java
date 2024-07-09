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
import java.util.ArrayList;
import java.util.List;
import model.Games;

/**
 *
 * @author Mr.Khanh
 */
public class ProductManagerSiteServlet extends HttpServlet {

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
      GamesDBConnect dBConnect = new GamesDBConnect();
        List<Games> games = dBConnect.getAll();

        request.setAttribute("games", games);

        // Set the game list as an attribute in the request
        request.setAttribute("games", games);
        request.getRequestDispatcher("ProductManager.jsp").forward(request, response);
    }

}
