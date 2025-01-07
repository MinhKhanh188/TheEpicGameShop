<%-- 
    Document   : SearchResults
    Created on : Jul 17, 2024, 11:03:55 PM
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
            
              <li> 
                <form method="get" action="SortedGamesByPriceRangeServlet">
                    <input type="number" name="minPrice" placeholder="Min Price" required>
                    <input type="number" name="maxPrice" placeholder="Max Price" required>
                    <button type="submit">Sort by Price</button>
                </form>

                   <form method="get" action="SearchGamesServlet">
                    <input type="text" name="searchQuery" placeholder="Search games..." required>
                    <button type="submit">Search</button>
                </form>
                  
            </li>
            
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
                <c:forEach var="game" items="${searchResults}">
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

