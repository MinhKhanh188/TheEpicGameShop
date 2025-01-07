package controller;

import java.io.IOException;
import java.math.BigDecimal;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dal.UserDBConnect;
import model.Users;

public class ProcessPaymentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("loggedUser");
        int userID = (int) session.getAttribute("userID");

        if (user == null || userID <= 0) {
            // Redirect to login page if user or userID is not valid
            response.sendRedirect("Login.jsp");
            return;
        }

        String amountStr = request.getParameter("amount");
        if (amountStr == null || amountStr.isEmpty()) {
            // Handle missing amount parameter
            response.sendRedirect("ChoosePaymentMethod.jsp");
            return;
        }

        double amount;
        try {
            amount = Double.parseDouble(amountStr);
        } catch (NumberFormatException e) {
            // Handle invalid amount format
            response.sendRedirect("ChoosePaymentMethod.jsp");
            return;
        }

        // Process payment logic (assumed successful for this example)
        double newPurseBalance = 0 + amount;

        // Update the purse balance in the database
        UserDBConnect userDB = new UserDBConnect();
        userDB.updateUserPurse(userID, newPurseBalance);

        // Update the user object and session
        user.setUserPurse(newPurseBalance);
        session.setAttribute("loggedUser", user);

        // Redirect back to the user profile page
        response.sendRedirect("UserProfile.jsp");
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
        return "Servlet to process payment and update user purse";
    }
}
