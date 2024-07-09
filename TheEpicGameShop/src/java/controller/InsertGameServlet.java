package controller;

import dal.GamesDBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import model.Games;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

/**
 * Servlet implementation class InsertGameServlet
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class InsertGameServlet extends HttpServlet {

 
    private static final String UPLOAD_DIRECTORY = "/web/img";


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        int genreId = Integer.parseInt(request.getParameter("genreId"));
        String imageLink = request.getParameter("imageLink");
        String developer = request.getParameter("developer");
        String releaseDate = request.getParameter("releaseDate");
        double price = Double.parseDouble(request.getParameter("price"));

// Construct the directory path to save the uploaded file
    String appPath = request.getServletContext().getRealPath("");
String uploadFilePath = appPath + File.separator + UPLOAD_DIRECTORY;


        // Create the directory if it doesn't exist
        Files.createDirectories(Paths.get(uploadFilePath));

        // Handle file upload
        Part filePart = request.getPart("file");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String filePath = uploadFilePath + File.separator + fileName;
        if (!fileName.isEmpty()) {
            try {
                // Log the file path for verification
                System.out.println("File saved to: " + filePath);
                // Save the file to the specified directory
                Files.copy(filePart.getInputStream(), Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException e) {
                // Log any exceptions
                System.err.println("Error saving file: " + e.getMessage());
                e.printStackTrace();
            }
        }

        // Create a new game object
        Games newGame = new Games();
        newGame.setTitle(title);
        newGame.setDescription(description);
        newGame.setGenreID(genreId);
        newGame.setImageLink(imageLink);
        newGame.setDeveloper(developer);
        newGame.setReleaseDate(releaseDate);
        newGame.setPrice(price);

        // Insert the game into the database
        GamesDBConnect gamesDBConnect = new GamesDBConnect();
        gamesDBConnect.insertGame(newGame);

        // Redirect to a success page or display a success message
        response.sendRedirect("ProductManagerSiteServlet");
    }
}
