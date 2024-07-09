<%-- 
    Document   : AddProductForm
    Created on : May 30, 2024, 11:36:20 AM
    Author     : Mr.Khanh
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert New Game</title>
    </head>
    <body>
        <h1>Insert New Game</h1>
        
        <!-- Combined form for inserting game details and uploading a file -->
        <form action="InsertGameServlet" method="post" enctype="multipart/form-data">
            <label for="title">Title:</label><br>
            <input type="text" id="title" name="title" required><br><br>

            <label for="description">Description:</label><br>
            <textarea id="description" name="description" required></textarea><br><br>

            <label for="genreId">Genre:</label><br>
            <select id="genreId" name="genreId" required>
                <option value="">Select a Genre</option>
                <c:forEach var="genre" items="${genreses}">
                    <option value="${genre.genreID}">${genre.genreName}</option>
                </c:forEach>
            </select><br><br>

            <label for="imageLink">Image Link:</label><br>
            <input type="text" id="imageLink" name="imageLink"><br><br>

            <label for="developer">Developer:</label><br>
            <input type="text" id="developer" name="developer" required><br><br>

            <label for="releaseDate">Release Date (YYYY-MM-DD):</label><br>
            <input type="date" id="releaseDate" name="releaseDate" required><br><br>

            <label for="price">Price:</label><br>
            <input type="number" step="0.01" id="price" name="price" required><br><br>

            <!-- File upload field -->
            <label for="file">Select file to upload:</label><br>
            <input type="file" id="file" name="file" size="60" required /><br><br>
            
            <input type="submit" value="Insert Game">
        </form>
    </body>
</html>
