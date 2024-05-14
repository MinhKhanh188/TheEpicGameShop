/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;

/**
 *
 * @author Mr.Khanh
 */
public class loginServlet extends HttpServlet {

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

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate user input
        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            // Handle invalid input
            response.sendRedirect("Login.jsp"); // Redirect to an error page
            return;
        }

        // Log the received login request
        System.out.println("Received login request for username: " + username);

        UserDBConnect userDB = new UserDBConnect();
        Users user = userDB.login(username, password);

        if (user != null) {

            // Determine the appropriate redirection based on user type
            String redirectPath;
            switch (user.getRole()) {
                case 1:
                    redirectPath = "HomePage.jsp";
                    break;
                case 2:
                    redirectPath = "HomePage.jsp";
                    break;
                default:
                    redirectPath = "HomePage.jsp";
                    break;
            }

            // Redirect with an absolute path
            response.sendRedirect(request.getContextPath() + "/" + redirectPath);

        } else {
            // Authentication failed, log the failure and redirect to an error page
            System.out.println("Login failed for username: " + username);
// Redirect to the login page with an error message as a query parameter
            response.sendRedirect("LoginFailed.html");

        }

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Shot description";
    }// </editor-fold>

}
