<%-- 
    Document   : GameDetails
    Created on : May 16, 2024, 11:05:35 AM
    Author     : Mr.Khanh
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cyberpunk 2077 - Epic Games</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/GameDetailCSS.css">
    </head>

    <body>
        <ul>
            <li><a href="GetListOfGamesServlet" class="avatar">
                    <img src="img/Fauget.png" alt="alt" />
                </a></li>
            <li><a href="#" class="active">News</a></li>
            <li><a href="#" class="active">Contact</a></li>
            <li><a href="#" class="active">About</a></li>

            <li><a href="ViewCartServlet" class="active">Cart</a></li>

            <c:choose>
                <c:when test="${not empty sessionScope.loggedInUsername}">
                    <li class="avatar">
                        <div class="dropdown">
                            <div  class="dropbtn">
                                <%-- Display logged-in user's name next to the avatar --%>
                                <%= session.getAttribute("loggedInUsername") %>
                                <img src="img/avatar.png" alt="Avatar">
                            </div>
                            <div class="dropdown-content">
                                <a href="UserViewProfileServlet">Profile</a>
                                <a href="UserLibraryServlet">View Library</a>

                                <a href="LogoutServlet">Logout</a>
                            </div>
                        </div>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="avatar">
                        <a href="Login.jsp">Login</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>

        <div class="container mt-5">
            <div class="row">
                <c:forEach var="game" items="${games}">
                    <div class="col-12 mb-5">
                        <img id="gameImage" src="${pageContext.request.contextPath}/games_Img/${game.imageLink}.png" alt="${game.imageLink}">
                        <div class="game-info">
                            <h3>${game.title}</h3>
                            <p>${game.description}</p>
                            <p id="priceTag">${game.price}$</p>
                            <form action="BuyNowServlet" method="post">
                                <input type="hidden" name="gameId" value="${game.gameID}">
                                <button type="submit" class="btn btn-danger btn-custom">BUY NOW</button>
                            </form>
                            <form action="AddToCartServlet" method="post" style="display:inline;">
                                <input type="hidden" name="gameId" value="${game.gameID}">
                                <button type="submit" class="btn btn-outline-light btn-custom">ADD TO CART</button>
                            </form>

                            <br>
                            <br>
                            <h5>Created by @${game.developer}</h5>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Optionally, you can include Bootstrap JavaScript components -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
