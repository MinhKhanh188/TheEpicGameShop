package controller;

import dal.GamesDBConnect;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Games;

/**
 * Servlet implementation class ExecuteUpdateServlet
 */
@WebServlet(name = "ExecuteUpdateServlet", urlPatterns = {"/ExecuteUpdateServlet"})
public class ExecuteUpdateServlet extends HttpServlet {
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
        // Get parameters from the request
        String gameID = request.getParameter("gameId");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String genreID = request.getParameter("genreId");
        String imageLink = request.getParameter("imageLink");
        String developer = request.getParameter("developer");
        String releaseDate = request.getParameter("releaseDate");
        String price = request.getParameter("price");

        // Validate and convert parameters
        if (gameID != null && !gameID.isEmpty() &&
            genreID != null && !genreID.isEmpty() &&
            price != null && !price.isEmpty()) {

            int id = Integer.parseInt(gameID);
            int genre = Integer.parseInt(genreID);
            double gamePrice = Double.parseDouble(price);

            // Create game object
            Games game = new Games();
            game.setGameID(id);
            game.setTitle(title);
            game.setDescription(description);
            game.setGenreID(genre);
            game.setImageLink(imageLink);
            game.setDeveloper(developer);
            game.setReleaseDate(releaseDate);
            game.setPrice(gamePrice);

            // Update the game in the database
            GamesDBConnect gamesDBConnect = new GamesDBConnect();
            boolean updateSuccess = gamesDBConnect.updateGame(game);

            if (updateSuccess) {
                // Redirect to the product manager page or appropriate page
                response.sendRedirect("ProductManagerSiteServlet");
            } else {
                // Handle update failure
                response.getWriter().println("Failed to update the game.");
            }
        } else {
            // Handle invalid input
            response.getWriter().println("Invalid input data.");
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
        return "Servlet that executes the update of games";
    }
}
