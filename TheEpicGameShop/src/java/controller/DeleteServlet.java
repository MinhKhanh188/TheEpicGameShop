package controller;

import dal.GamesDBConnect;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteServlet
 */
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Get the gameID from the request
        String gameID = request.getParameter("gameId");

        // Check if the gameID is not null and is a valid integer
        if (gameID != null && !gameID.isEmpty()) {
            int id = Integer.parseInt(gameID);

            // Create an instance of GamesDBConnect and delete the game
            GamesDBConnect gamesDBConnect = new GamesDBConnect();
            gamesDBConnect.deleteGame(id);

            // Redirect back to the product manager page or appropriate page
            response.sendRedirect("ProductManagerSiteServlet");
        } else {
            // Handle the case where the gameID is invalid
            response.getWriter().println("Invalid game ID.");
        }
    }

    // Handles the HTTP GET method.
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    // Handles the HTTP POST method.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    // Returns a short description of the servlet.
    @Override
    public String getServletInfo() {
        return "Servlet that handles deletion of games";
    }
}
