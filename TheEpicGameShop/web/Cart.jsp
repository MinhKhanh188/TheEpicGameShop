<%-- 
    Document   : Cart
    Created on : May 19, 2024, 3:42:09 PM
    Author     : Mr.Khanh
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Your Cart</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            /* Reset CSS */
            body,
            ul,
            li {
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

            /* Content styles */
            .container {
                margin-top: 70px; /* Adjusted for navbar height */
                padding-top: 80px;
            }

            .card {
                background-color: #23272e;
                color: #fff;
                border: none;
                border-radius: 10px;
                margin-bottom: 20px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            }

            .card-img-top {
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
            }

            .card-body {
                padding: 20px;
            }

            .card-title {
                font-size: 20px;
                font-weight: bold;
                margin-bottom: 10px;
            }

            .card-text {
                color: #8a8d91;
            }

            .price-tag {
                color: #3c94aa;
                font-weight: bold;
                font-size: x-large;
            }

            .btn-custom {
                margin-right: 10px;
                margin-bottom: 10px;
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
            <h2>Your Cart</h2>
            <c:choose>
                <c:when test="${not empty sessionScope.cart}">
                    <div class="row">
                        <c:forEach var="entry" items="${sessionScope.cart}">
                            <c:set var="gameId" value="${entry.key}" />
                            <c:set var="gameDetails" value="${entry.value}" />
                            <div class="col-md-4">
                                <div class="card">
                                    <img src="${pageContext.request.contextPath}/games_Img/${gameDetails.imageLink}.png"
                                         class="card-img-top" alt="${gameDetails.imageLink}">
                                    <div class="card-body">
                                        <h5 class="card-title">${gameDetails.title}</h5>
                                        <p class="card-text">${gameDetails.description}</p>
                                        <p class="price-tag">${gameDetails.price}$</p>

                                    </div>
                                </div>
                                <form action="RemoveFromCartServlet" method="post">
                                    <input type="hidden" name="gameIdToRemove" value="${gameId}" />
                                    <button type="submit">Remove from Cart</button>
                                </form>
                            </div>
                            <c:set var="totalPrice" value="${totalPrice + gameDetails.price}" />
                        </c:forEach>    


                        <h4>Total Price: ${totalPrice}$</h4>
                    </div><a href="PurchaseServlet?gameIds=<c:forEach var='entry' items='${sessionScope.cart}' varStatus='status'><c:if test='${not status.first}'>,</c:if><c:out value='${entry.key}'/></c:forEach>" class="btn btn-primary mt-3">Proceed to Checkout</a>

                </c:when>
                <c:otherwise>
                    <p>Your cart is empty.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </body>

</html>
