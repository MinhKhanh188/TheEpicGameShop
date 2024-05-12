<%-- 
    Document   : HomePageGames
    Created on : May 12, 2024, 12:43:47 PM
    Author     : Mr.Khanh
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Link to Bootstrap CSS from node_modules -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">


    <style>
        /* Existing CSS styles for .card */
        body {
            font-family: Arial, sans-serif;
            background-color: #222;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #fff;
        }
    
        .card {
            width: 200px; /* Set a fixed width for each card */
            max-width: 100%; /* Ensure the cards don't exceed the container's width */
            background-color: #333;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease; /* Added transition for hover effect */
            display: inline-block; /* Display cards horizontally */
            margin-right: 10px; /* Add spacing between cards */
            margin-bottom: 10px; /* Add spacing between rows */
        }
    
        .card:hover {
            transform: translateY(-5px); /* Added hover effect */
        }
    
        .card img {
            width: 100%;
            height: auto;
            border-bottom: 1px solid #444;
        }
    
        .card-content {
            padding: 20px;
        }
    
        .card-content h2 {
            font-size: 1.5rem;
            margin-bottom: 10px;
            color: #fff;
        }
    
        .card-content p {
            color: #ccc;
            margin-bottom: 15px;
        }
    
        .price {
            font-size: 1.2rem;
            font-weight: bold;
            color: #007bff;
        }
    
        .btn {
            display: inline-block;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
            margin-top: 10px;
        }
    
        .btn:hover {
            background-color: #0056b3;
        }
    
        /* Anchor styles */
        .card-link {
            text-decoration: none;
            color: inherit; /* Inherit text color */
        }
    
        /* Media query for smaller screens */
        @media (max-width: 768px) {
            .card {
                width: 100%; /* Set width to 100% for smaller screens */
                margin-right: 0; /* Remove right margin */
                margin-bottom: 20px; /* Add more spacing between rows for smaller screens */
            }
        }
    </style>
    
</head>

<body>

    <!-- Your content here -->
    <!-- Wrap each card content with an anchor tag for navigation -->
    <a href="https://store.epicgames.com/en-US/p/cyberpunk-2077" class="card-link">
        <div class="card">
            <img src="https://cdna.artstation.com/p/assets/images/images/033/037/886/large/artur-tarnowski-malemain.jpg?1608208334"
                alt="Game Image">
            <div class="card-content">
                <h2>Cyberpunk2077</h2>
                <div class="price">$19.99</div>
                <br />
                <p>@CD PROJEKT RED</p>
            </div>
        </div>
    </a>
    <a href="https://store.epicgames.com/en-US/p/cyberpunk-2077" class="card-link">
        <div class="card">
            <img src="https://cdna.artstation.com/p/assets/images/images/033/037/886/large/artur-tarnowski-malemain.jpg?1608208334"
                alt="Game Image">
            <div class="card-content">
                <h2>Cyberpunk2077</h2>
                <div class="price">$19.99</div>
                <br />
                <p>@CD PROJEKT RED</p>
            </div>
        </div>
    </a>
    <a href="https://store.epicgames.com/en-US/p/cyberpunk-2077" class="card-link">
        <div class="card">
            <img src="https://cdna.artstation.com/p/assets/images/images/033/037/886/large/artur-tarnowski-malemain.jpg?1608208334"
                alt="Game Image">
            <div class="card-content">
                <h2>Cyberpunk2077</h2>
                <div class="price">$19.99</div>
                <br />
                <p>@CD PROJEKT RED</p>
            </div>
        </div>
    </a>
    <a href="https://store.epicgames.com/en-US/p/cyberpunk-2077" class="card-link">
        <div class="card">
            <img src="https://cdna.artstation.com/p/assets/images/images/033/037/886/large/artur-tarnowski-malemain.jpg?1608208334"
                alt="Game Image">
            <div class="card-content">
                <h2>Cyberpunk2077</h2>
                <div class="price">$19.99</div>
                <br />
                <p>@CD PROJEKT RED</p>
            </div>
        </div>
    </a>

    <!-- Add more cards here -->

    <!-- Optionally, you can include Bootstrap JavaScript components -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>