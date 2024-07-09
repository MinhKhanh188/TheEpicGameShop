/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Map;

/**
 *
 * @author Mr.Khanh
 */
public class RemoveFromCartServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int gameIdToRemove = Integer.parseInt(request.getParameter("gameIdToRemove"));

        HttpSession session = request.getSession();
        Map<Integer, Map<String, Object>> cart = (Map<Integer, Map<String, Object>>) session.getAttribute("cart");

        // Remove the item from the cart
        if (cart != null) {
            cart.remove(gameIdToRemove);
            session.setAttribute("cart", cart);
        }

        // Redirect back to the cart page
        response.sendRedirect("Cart.jsp");
    }

}
