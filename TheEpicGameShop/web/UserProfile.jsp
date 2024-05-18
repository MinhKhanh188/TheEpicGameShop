<%-- 
    Document   : UserProfile
    Created on : May 18, 2024, 8:07:45 PM
    Author     : Mr.Khanh
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .profile-container {
            background-color: #333;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 80%;
            max-width: 600px;
        }
        .profile-container h1 {
            font-size: 2.5rem;
            margin-bottom: 30px;
            text-align: center;
        }
        .profile-item {
            margin-bottom: 20px;
            font-size: 1.2rem;
        }
        .profile-item strong {
            display: inline-block;
            width: 200px;
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <h1>User Profile</h1>
        <c:if test="${not empty userProfile}">
            <div class="profile-item">
                <strong>UserID:</strong> <span>${userProfile.userID}</span>
            </div>
            <div class="profile-item">
                <strong>Username:</strong> <span>${userProfile.username}</span>
            </div>
            <div class="profile-item">
                <strong>Role:</strong> <span>${userProfile.role == 1 ? "Product Manager" : "User"}</span>
            </div>
            <div class="profile-item">
                <strong>Date Created:</strong> <span>${userProfile.dateCreated}</span>
            </div>
            <div class="profile-item">
                <strong>User Purse:</strong> <span>${userProfile.userPurse}$</span>
            </div>
        </c:if>
    </div>

    <!-- Link to Bootstrap JS from CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
