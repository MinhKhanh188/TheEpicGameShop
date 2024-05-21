<%-- 
    Document   : Payment
    Created on : May 19, 2024, 8:21:25 PM
    Author     : Mr.Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="css/GameDetailCSS.css">
<style>
    #gameImage {
        height: 20%;
        width: 20%;
    }
</style>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <c:set var="totalPrice" value="0" />
                <c:forEach var="game" items="${gamesList}">
                    <div class="col-12 mb-5">
                        <img id="gameImage" src="${pageContext.request.contextPath}/games_Img/${game.imageLink}.png" alt="${game.imageLink}">
                        <div class="game-info">
                            <h3>${game.title}</h3>
                            <p id="priceTag">${game.price}$</p>
                            <br>
                            <br>
                            <h5>Created by @${game.developer}</h5>
                        </div>
                        <c:set var="totalPrice" value="${totalPrice + game.price}" />
                    </div>
                </c:forEach>
            </div>
            <h4>Total Price: ${totalPrice}$</h4>
            <c:set var="remainingBalance" value="${userPurse - totalPrice}" />
            <h4>Remaining Balance: ${remainingBalance}$</h4>

            <form id="paymentForm">
                <input type="hidden" name="remainingBalance" value="${remainingBalance}" />
                <input type="hidden" name="gameIds" value="${gameIds}" />
                <c:choose>
                    <c:when test="${remainingBalance > 0}">
                        <button id="proceedBtn" type="button" class="btn btn-primary mt-3">Proceed to Checkout</button>
                    </c:when>
                    <c:otherwise>
                        <p>Insufficient balance. Please add funds to your account.</p>
                    </c:otherwise>
                </c:choose>
            </form>
        </div>

        <script>
        var remainingBalance = ${remainingBalance};
        var proceedBtn = document.getElementById('proceedBtn');

        if (remainingBalance <= 0) {
            proceedBtn.style.display = 'none';
        }

        proceedBtn.addEventListener('click', function () {
            var form = document.getElementById('paymentForm');
            var formData = new FormData(form);

            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'FinishPayment', true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        window.location.href = 'Success.jsp';
                    } else {
                        console.error('Error:', xhr.statusText);
                    }
                }
            };
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.send(new URLSearchParams(formData).toString());
        });
        </script>
    </body>
</html>
