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

        <style>
            /* Reset CSS */
            body, ul, li {
                margin: 0;
                padding: 0;
            }

            /* Body styles */
            body {
                font-family: Arial, sans-serif;
                background-color: #0f1114;
                color: #fff;
                min-height: 100vh;
            }

            /* Navbar styles */
            ul {
                list-style-type: none;
                background-color: #1c1f25;
                position: fixed;
                top: 0;
                width: 100%;
                z-index: 1000;
            }

            li {
                float: left;
            }

            li a {
                display: block;
                color: #fff;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-weight: bold;
                font-size: 20px;
            }

            li:hover a {
                background-color: #23272e;
            }

            .avatar {
                float: right;
                margin-top: 8px;
                margin-right: 16px;
                border-radius: 50%;
                transition: background-color 0.3s ease;
            }

            .avatar:hover {
                background-color: #fff;
            }

            .avatar img {
                width: 40px;
                height: 40px;
            }

            /* Content styles */
            .container {
                margin-top: 70px; /* Adjusted for navbar height */
            }

            #gameImage {
                width: 100%;
                height: auto;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            }

            .game-info {
                padding: 20px;
                border-radius: 10px;
                background-color: #23272e;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
                margin-top: 20px;
                color: #fff;
            }

            .game-info h3, .game-info p {
                margin-bottom: 10px;
            }

            .game-info h3 {
                color: #fff;
            }

            .game-info p {
                color: #8a8d91;
                font-size: 16px;
            }

            /* Additional styles */
            .featured-games {
                margin-bottom: 50px;
            }

            .featured-games h2 {
                color: #fff;
                font-size: 30px;
                margin-bottom: 30px;
            }

            #priceTag {
                color: #3c94aa;
                font-weight: bold;
                font-size: x-large;
            }

            .btn-custom {
                margin-right: 10px;
                margin-bottom: 10px;
            }

            .container{
                padding-top: 30px;
            }
            
            .avatar {
                float: right;
                margin-top: 8px;
                margin-right: 50px;
                border-radius: 50%; /* Make the box circular */
                transition: background-color 0.3s ease, transform 0.3s ease; /* Add transition for smooth effect */
            }

            .avatar:hover {
                background-color: #e8e8e8; /* Change background color on hover */
                transform: scale(1.05); /* Slightly enlarge the avatar on hover */
            }

            .avatar img {
                width: 40px;
                height: 40px;
                border-radius: 50%; /* Ensure the image is rounded */
            }

     

            /* Dropdown button */
            .dropbtn {
                color: rgb(34, 122, 217);
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-weight: bold;
                font-size: 25px;
            }

            /* Dropdown content (hidden by default) */
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            /* Links inside the dropdown */
            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                text-align: left;
            }

            /* Change color of dropdown links on hover */
            .dropdown-content a:hover {
                background-color: #f1f1f1;
            }

            /* Show the dropdown menu on hover */
            .avatar:hover .dropdown-content {
                display: block;
            }            
        </style>
    </head>

    <body>
                <ul>
            <li><a href="GetListOfGamesServlet" class="avatar">
                    <img src="img/Fauget.png" alt="alt" />
                </a></li>
            <li><a href="#" class="active">News</a></li>
            <li><a href="#" class="active">Contact</a></li>
            <li><a href="#" class="active">About</a></li>
                <c:choose>
                    <c:when test="${not empty sessionScope.loggedInUsername}">
                    <li class="avatar">
                        <div class="dropdown">
                            <a href="#" class="dropbtn">
                                <%-- Display logged-in user's name next to the avatar --%>
                                <%= session.getAttribute("loggedInUsername") %>
                                <img src="img/avatar.png" alt="Avatar">
                            </a>
                            <div class="dropdown-content">
                                <a href="Profile.jsp">Profile</a>
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
                            <p id="priceTag">${game.price}$</p> <form action="PurchaseServlet" method="post">
                                <input type="hidden" name="gameId" value="${game.gameID}">
                                <button type="submit" class="btn btn-danger btn-custom">BUY NOW</button>
                            </form>

                            <a href="#" class="btn btn-outline-light btn-custom">ADD TO CART</a>
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
