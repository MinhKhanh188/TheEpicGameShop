<%-- 
    Document   : News
    Created on : Jul 18, 2024, 11:16:21 AM
    Author     : Mr.Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Latest Gaming News</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="css/MainPageCSS.css">
    
           <style>
            body {
                padding-top: 70px !important; /* Adjust based on your navbar height */
            }
            .container {
                padding: 20px  !important;
                margin-top: 50px !important; /* Ensure there is enough space below the navbar */
            }
        </style>
</head>
<body>
    <ul>
           <li><a href="GetListOfGamesServlet" class="avatar">
                    <img src="img/Fauget.png" alt="alt" />
                </a></li>
            <li><a href="News.jsp" class="active">News</a></li>
            <li><a href="Contact.jsp" class="active">Contact</a></li>
            <li><a href="AboutOurCompany.jsp" class="active">About</a></li>

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
    <div class="container">
        <h1>Latest Gaming News</h1>
        
        <div class="news-item">
            <h2 class="news-title">Exciting New Game Announcement</h2>
            <p class="news-content">Discover the latest blockbuster game announced by [Game Studio]. Immerse yourself in a thrilling adventure set in [game world].</p>
        </div>
        
        <div class="news-item">
            <h2 class="news-title">Upcoming Game Release Date Revealed</h2>
            <p class="news-content">Mark your calendars! The highly anticipated game [Game Title] is set to release on [Release Date]. Pre-order now to secure exclusive bonuses!</p>
        </div>
        
        <div class="news-item">
            <h2 class="news-title">Gaming Event Highlights</h2>
            <p class="news-content">Recap the excitement of the recent gaming event where developers showcased innovative gameplay and cutting-edge technology.</p>
        </div>
        
        <div class="news-item">
            <h2 class="news-title">Industry Insights and Trends</h2>
            <p class="news-content">Stay informed with expert analysis on the latest gaming industry trends, from virtual reality to cloud gaming.</p>
        </div>
        
          <div class="news-item">
            <h2 class="news-title">Gameplay Trailer Breakdown</h2>
            <p class="news-content">Explore the gameplay trailer breakdown of [Game Title], showcasing new mechanics and breathtaking visuals.</p>
        </div>
        
        <div class="news-item">
            <h2 class="news-title">Community Spotlight: Fan Creations</h2>
            <p class="news-content">Celebrate the talented community with highlights of fan art, mods, and fan-made content inspired by popular games.</p>
        </div>
        
    
        
    </div>
</body>
</html>
