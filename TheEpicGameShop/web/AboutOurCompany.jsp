<%-- 
    Document   : AboutOurCompany
    Created on : Jul 18, 2024, 11:09:44 AM
    Author     : Mr.Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Our Company</title>
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
            <li><a href="#" class="active">Contact</a></li>
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
            <h1>About Our Company</h1>
            <p>Welcome to The Epic Games Shop, where we strive to deliver excellence in every aspect of our business.</p>
            <p>Founded in 2024, OurCompany has been dedicated to [mission statement or core values]. We specialize in [brief description of services or products].</p>
            <p>At OurCompany, we believe in [core belief or principle]. Our team is committed to [customer satisfaction, quality, innovation, etc.].</p>
            <p>Explore our website to learn more about our offerings and how we can serve you better.</p>
        </div>
    </body>
</html>
