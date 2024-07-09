<%-- 
    Document   : Update
    Created on : Jun 6, 2024, 10:31:52 AM
    Author     : Mr.Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Game</title>
        <!-- Link to Bootstrap CSS from CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <form action="ExecuteUpdateServlet" method="post">
            <input type="hidden" name="gameId" value="${game.gameID}">
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" class="form-control" id="title" name="title" value="${game.title}">
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea class="form-control" id="description" name="description">${game.description}</textarea>
            </div>
            <div class="form-group">
                <label for="genreId">Genre ID:</label>
                <input type="text" class="form-control" id="genreId" name="genreId" value="${game.genreID}">
            </div>
            <div class="form-group">
                <label for="imageLink">Image Link:</label>
                <input type="text" class="form-control" id="imageLink" name="imageLink" value="${game.imageLink}">
            </div>
            <div class="form-group">
                <label for="developer">Developer:</label>
                <input type="text" class="form-control" id="developer" name="developer" value="${game.developer}">
            </div>
            <div class="form-group">
                <label for="releaseDate">Release Date:</label>
                <input type="text" class="form-control" id="releaseDate" name="releaseDate" value="${game.releaseDate}">
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="text" class="form-control" id="price" name="price" value="${game.price}">
            </div>
            <button type="submit" class="btn btn-primary mt-3">Update Game</button>
        </form>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
