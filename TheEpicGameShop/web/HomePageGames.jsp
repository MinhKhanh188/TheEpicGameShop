<%-- 
    Document   : HomePageGames
    Created on : May 12, 2024, 12:43:47 PM
    Author     : Mr.Khanh
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Page Games</title>
        <!-- Link to Bootstrap CSS from CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #222;
                color: #fff;
                margin: 0;
                padding: 0;
                min-height: 100vh;
            }
            /* games card css */
            .card {
                background-color: #333;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                transition: transform 0.3s ease;
                margin-bottom: 20px;
            }

            .card:hover {
                transform: translateY(-5px);
            }

            .card img {
                width: 100%;
                height: auto;
                border-bottom: 1px solid #444;
            }

            .card-content {
                padding: 20px;
            }

            .card-content h2 {
                font-size: 1.5rem;
                margin-bottom: 10px;
                color: #fff;
            }

            .card-content p {
                color: #ccc;
                margin-bottom: 15px;
            }

            .price {
                font-size: 1.2rem;
                font-weight: bold;
                color: #007bff;
            }

            .btn {
                background-color: #007bff;
                color: #fff;
                text-decoration: none;
                padding: 8px 16px;
                border-radius: 4px;
                transition: background-color 0.3s ease;
                margin-top: 10px;
            }

            .btn:hover {
                background-color: #0056b3;
            }

            .card-link {
                text-decoration: none;
                color: inherit;
            }

            /* navbar css */
            ul {
                width: 100%;
                list-style-type: none;
                margin: 0;
                padding: 0;
                background-color: #333;
                position: fixed;
                top: 0;
                z-index: 1000;
            }

            li {
                float: left;
            }

            li a {
                display: block;
                color: rgb(34, 122, 217);
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-weight: bold;
                font-size: 25px;
            }

            /* Change the link color to #111 (black) on hover */
            li:hover a {
                background-color: #23272e;
            }

            /* Ensure the avatar is always rounded */
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

            /* footer css */
            footer {
                background-color: #171a21; /* Dark background color */
                color: #ffffff; /* Light text color */
                padding: 0.1%; /* Add padding for spacing */
                text-align: center; /* Center align text */
                position: fixed; /* Stick footer to the bottom of the page */
                width: 100%; /* Full width */
                bottom: 0; /* Stick to the bottom */
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

        <div id="carouselExampleCaptions" class="carousel slide">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/Cyberpunk2077.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/marvelspiderman2.jpeg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/godofwarvalhalla.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <div class="container mt-5">
            <div class="row">
                <c:forEach var="game" items="${games}">
                    <div class="col-md-4 col-sm-6 mb-4">
                        <a href="GameDetailsServlet?id=${game.gameID}" class="card-link">
                            <div class="card">
                                <img src="${pageContext.request.contextPath}/games_Img/${game.imageLink}.png" alt="${game.imageLink}">
                                <div class="card-content">
                                    <h2>${game.title}</h2>
                                    <div class="price">${game.price}</div>
                                    <p>@${game.developer}</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>

        <footer class="footer">
            <div class="container">
                <span>&copy; 2024 Pham Minh Khanh</span>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
