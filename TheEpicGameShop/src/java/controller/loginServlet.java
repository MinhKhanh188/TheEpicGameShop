package controller;

import dal.UserDBConnect;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;

/**
 * Handles user login functionality
 */
public class loginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * 
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate user input
        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            response.sendRedirect("Login.jsp"); // Redirect to login page on invalid input
            return;
        }

        // Log the received login request
        System.out.println("Received login request for username: " + username);

        UserDBConnect userDB = new UserDBConnect();
        Users user = userDB.login(username, password);

        if (user != null) {
            // Store the logged-in user object and username in the session
            HttpSession session = request.getSession();
            session.setAttribute("loggedUser", user);
            session.setAttribute("loggedInUsername", username);
            session.setAttribute("userID", user.getUserID());

            // Determine the appropriate redirection based on user role
            String redirectPath;
            switch (user.getRole()) {
                case 1:
                    redirectPath = "ProductManagerSiteServlet";
                    break;
                case 2:
                    redirectPath = "GetListOfGamesServlet";
                    break;
                default:
                    redirectPath = "Help.jsp";
                    break;
            }

            // Redirect with an absolute path
            response.sendRedirect(request.getContextPath() + "/" + redirectPath);
        } else {
            // Authentication failed, log the failure and redirect to an error page
            System.out.println("Login failed for username: " + username);
            response.sendRedirect("LoginFailed.html");
        }
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
        return "Handles user login";
    }
}
