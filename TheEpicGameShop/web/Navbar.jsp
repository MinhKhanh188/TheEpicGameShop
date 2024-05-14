<%-- 
    Document   : Navbar
    Created on : May 11, 2024, 4:34:34 PM
    Author     : Mr.Khanh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        ul {
            width: 100%;
            list-style-type: none;
            margin: 0;
            padding: 0;
            background-color: #333;
            
             position: fixed; /* Set navbar position to fixed */
            top: 0; /* Stick the navbar to the top of the page */
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
            background-color: #e8e8e8;
        }

        .avatar {
            float: right;
            margin-top: 8px;
            margin-right: 16px;
            border-radius: 50%; /* Make the box circular */
            overflow: hidden; /* Hide overflow content */
            transition: background-color 0.3s ease; /* Add transition for smooth effect */
        }

        .avatar:hover {
            background-color: white; /* Change background color to white on hover */
        }

        .avatar img {
            width: 40px;
            height: 40px;
        }
    </style>
</head>

<body>
    <ul>
        <li><a href="HomePage.jsp" class="active">Home</a></li>
        <li><a href="#"class="active">News</a></li>
        <li><a href="#"class="active">Contact</a></li>
        <li><a href="#"class="active">About</a></li>
        <li class="avatar">
            <a href="Login.jsp">
                <img src="img/avatar.png" alt="Avatar">
            </a>
        </li>
    </ul>
</body>

</html>
