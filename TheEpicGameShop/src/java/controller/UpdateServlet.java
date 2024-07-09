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
 * Servlet implementation class UpdateServlet
 */
@WebServlet(name = "UpdateServlet", urlPatterns = {"/UpdateServlet"})
public class UpdateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get parameters from the request
        String gameID = request.getParameter("gameId");

        if (gameID != null) {
            int id = Integer.parseInt(gameID);

            // Fetch game details from database
            GamesDBConnect gamesDBConnect = new GamesDBConnect();
            Games game = gamesDBConnect.getGameInformationByGameID(id);

            if (game != null) {
                request.setAttribute("game", game);
                request.getRequestDispatcher("Update.jsp").forward(request, response);
            } else {
                response.getWriter().println("Game not found.");
            }
        } else {
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
        return "Servlet that handles get games information";
    }
}
