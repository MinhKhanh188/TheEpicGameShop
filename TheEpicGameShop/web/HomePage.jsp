<%-- 
    Document   : HomePage
    Created on : May 11, 2024, 4:22:22 PM
    Author     : Mr.Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Link to Bootstrap CSS from node_modules -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #171a21; /* Dark background color */
            color: #ffffff; /* Light text color */
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .container-fluid {
            padding: 10%; /* Add padding for spacing */
        }

        .top-games {
            margin-bottom: 20px;
            
        }
   
        
        .home-page-games{
            text-align: center;
        }
        
        footer {
            background-color: #171a21; /* Dark background color */
            color: #ffffff; /* Light text color */
            padding: 0.1%; /* Add padding for spacing */
            text-align: center; /* Center align text */
            position: fixed; /* Stick footer to the bottom of the page */
            width: 100%; /* Full width */
            bottom: 0; /* Stick to the bottom */
        }

    </style>
</head>

<body>
    <div class="container-fluid">
        <div class="navbar">
            <jsp:include page="Navbar.jsp"></jsp:include>
        </div>

        <div class="top-games">
            <jsp:include page="Topgame.jsp"></jsp:include>
        </div>

        <div class="home-page-games">
            <jsp:include page="HomePageGames.jsp"></jsp:include>
        </div>
    </div>

        
    <footer class="footer">
        <div class="container">
            <span>&copy; 2024 Pham Minh Khanh</span>
        </div>
    </footer>

    <!-- Optionally, you can include Bootstrap JavaScript components -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
