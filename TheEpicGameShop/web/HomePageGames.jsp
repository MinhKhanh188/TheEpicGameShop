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

        <link rel="stylesheet" href="css/MainPageCSS.css">
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
