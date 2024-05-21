<%-- 
    Document   : Success
    Created on : May 19, 2024, 9:28:17 PM
    Author     : Mr.Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loading...</title>
        <style>
            body {
                font-family: 'Comic Sans MS', cursive, sans-serif;
                background-color: #0f1114;
                color: #fff;
                margin: 0;
                overflow: hidden;
            }

            /* Style for the loading screen */
            .loading {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(15, 17, 20, 0.9); /* Semi-transparent background */
                display: flex;
                justify-content: center;
                align-items: center;
                z-index: 9999; /* Ensure the loading screen appears above other elements */
                flex-direction: column;
            }

            .loading-content {
                text-align: center;
                animation: fadeIn 1s ease-in-out;
            }

            .loading-text {
                font-size: 24px;
                margin-top: 10px;
                animation: fadeIn 2s ease-in-out;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }

           
            .loader16 {
                width: 50px;
                height: 50px;
                position: relative;
                margin: 20px auto;
            }

            .loader16:before, .loader16:after {
                content: "";
                width: 50px;
                position: absolute;
                left: 0;
            }

            .loader16:before {
                height: 5px;
                border-radius: 50%;
                background: #000;
                opacity: 0.1;
                top: 59px;
                animation: shadow 0.5s linear infinite;
            }

            .loader16:after {
                height: 50px;
                border-radius: 3px;
                background: #008bba;
                top: 0;
                animation: loading 0.5s linear infinite;
            }

            @keyframes loading {
                17% {
                    border-bottom-right-radius: 3px;
                }
                25% {
                    transform: translateY(9px) rotate(22.5deg);
                }
                50% {
                    transform: translateY(18px) scale(1, 0.9) rotate(45deg);
                    border-bottom-right-radius: 40px;
                }
                75% {
                    transform: translateY(9px) rotate(67.5deg);
                }
                100% {
                    transform: translateY(0) rotate(90deg);
                }
            }

            @keyframes shadow {
                0%, 100% {
                    transform: scale(1, 1);
                }
                50% {
                    transform: scale(1.2, 1);
                }
            }

            .message {
                text-align: center;
                font-size: 20px;
                margin-bottom: 20px;
                animation: fadeIn 2s ease-in-out;
            }
        </style>
        <script type="text/javascript">
            // Function to redirect after a specified time
            function redirect() {
                // Change the URL to the desired destination
                var destination = "GetListOfGamesServlet"; // Change this to your desired page
                // Set the timeout (in milliseconds) before redirecting
                var timeout = 11500; // Change this to the desired time in milliseconds (e.g., 3000 for 3 seconds)

                // Display the loading screen
                var loadingScreen = document.getElementById("loading-screen");
                loadingScreen.style.display = "flex";

                // Redirect after the specified time
                setTimeout(function () {
                    window.location.href = destination;
                }, timeout);
            }

            // Call the redirect function when the page loads
            window.onload = function () {
                redirect();
            };
        </script>
    </head>
    <body>

        <!-- Audio element for background music -->
        <audio id="background-music" autoplay loop>
            <source src="audio/Usagi_Flap.mp3" type="audio/mpeg">
            
        </audio>

        <!-- Loading screen -->
        <div id="loading-screen" class="loading">
            <div class="loading-content">
                <div class="message">
                    <h2>Hold tight! Arisu is doing some magic with your payment...</h2>
                </div>
                <img src="img/arisuGift.gif" alt="Loading..." /> <!-- Replace with the path to your funny loading GIF -->
                <div class="loader16"></div>
                <div class="loading-text">Magic in progress...</div>
            </div>
        </div>
    </body>
</html>
