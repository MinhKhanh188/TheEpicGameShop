<%-- 
    Document   : Contact
    Created on : Jul 18, 2024, 11:26:44 AM
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
        <h1>Contact Us</h1>
        <p>If you have any questions or feedback, please feel free to contact us using the form below or reach out to us directly.</p>

        <form method="post" action="ProcessContactFormServlet">
            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="message" class="form-label">Message:</label>
                <textarea id="message" name="message" class="form-control" rows="5" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>

        <hr>

        <p>Or reach us at:</p>
        <p>Email: contact@epicgameshop.com</p>
        <p>Phone: +1 123-456-7890</p>
    </div>
</body>
</html>
