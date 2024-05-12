<%-- 
    Document   : Topgame
    Created on : May 12, 2024, 10:01:28 AM
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
            font-family: 'Open Sans', sans-serif;
            font-size: 16px;
            font-weight: normal;
            overflow-x: hidden;
            background: #000;
            color: white; 
        } 
       
        .carousel{
            width: 45%;
            height: auto;
            margin: auto;
        }
        .carousel-item {
            height: 100%;
            width: 90%;
            transition: transform 0.6s ease;
        }

        .carousel-inner {
            overflow: hidden; /* Hide the overflowing content */
        }

        /* Custom positioning for caption */
        .carousel-caption {
            top: 0%;
            transform: translateY(90%);
        }

    </style>
</head>

<body>

    <!-- Your content here -->

    <div id="carouselExampleCaptions" class="carousel slide">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="https://www.hooniganracing.com/cdn/shop/files/KB_Garage_Can-Am_X3_2020_900x.jpg?v=1613726468" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
              <h5>First slide label</h5>
              <p>Some representative placeholder content for the first slide.</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="https://www.hooniganracing.com/cdn/shop/files/KB_Garage_RX43_900x.jpg?v=1613722501" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
              <h5>Second slide label</h5>
              <p>Some representative placeholder content for the second slide.</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="https://www.hooniganracing.com/cdn/shop/files/KB_Garage_Raptor_Daily_900x.jpg?v=1613722501" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
              <h5>Third slide label</h5>
              <p>Some representative placeholder content for the third slide.</p>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>

    <!-- Optionally, you can include Bootstrap JavaScript components -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var myCarousel = document.getElementById('carouselExampleCaptions');
            var carousel = new bootstrap.Carousel(myCarousel, {
                interval: 4000, // Change slides every 4 seconds
                wrap: true
            });
        });
    </script>
</body>

</html>

