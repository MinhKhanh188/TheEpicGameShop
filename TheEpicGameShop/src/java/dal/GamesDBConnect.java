/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Games;
import model.Genres;

/**
 *
 * @author Mr.Khanh
 */
public class GamesDBConnect extends DBConnect {

    public List<Games> getAll() {
        List<Games> list = new ArrayList<>();
        String sql = "SELECT G.*, Genres.GenreName\n"
                + "FROM Games AS G\n"
                + "INNER JOIN Genres ON G.GenreID = Genres.GenreID;";

        try ( PreparedStatement stmt = connection.prepareStatement(sql);  ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Games game = new Games();
                game.setGameID(rs.getInt("GameID"));
                game.setTitle(rs.getString("Title"));
                game.setDescription(rs.getString("Description"));
                game.setGenreID(rs.getInt("GenreID"));
                game.setImageLink(rs.getString("ImageLink"));
                game.setDeveloper(rs.getString("Developer"));
                game.setReleaseDate(rs.getString("ReleaseDate"));
                game.setPrice(rs.getDouble("Price"));
                // Set genre details
                Genres genre = new Genres();
                genre.setGenreName(rs.getString("GenreName"));
                game.setGenres(genre);
                // Add game to the list
                list.add(game);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }

    public Games getGameInformationByGameID(int gameID) {
        Games checkGameID = null;
        String sql = "SELECT G.*, Genres.GenreName\n"
                + "FROM Games AS G\n"
                + "INNER JOIN Genres ON G.GenreID = Genres.GenreID\n"
                + "WHERE G.GameID = ?";
        try ( PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, gameID);
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    checkGameID = new Games();
                    checkGameID.setGameID(rs.getInt("GameID"));
                    checkGameID.setTitle(rs.getString("Title"));
                    checkGameID.setDescription(rs.getString("Description"));
                    checkGameID.setGenreID(rs.getInt("GenreID"));
                    checkGameID.setImageLink(rs.getString("ImageLink"));
                    checkGameID.setDeveloper(rs.getString("Developer"));
                    checkGameID.setReleaseDate(rs.getString("ReleaseDate"));
                    checkGameID.setPrice(rs.getDouble("Price"));
                    // Set genre details
                    Genres genre = new Genres();
                    genre.setGenreName(rs.getString("GenreName"));
                    checkGameID.setGenres(genre);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return checkGameID;
    }

    public static void main(String[] args) {
        // Create an instance of GamesDBConnect
        GamesDBConnect gamesDBConnect = new GamesDBConnect();

        // Call the getAll method to retrieve all games
        List<Games> gamesList = gamesDBConnect.getAll();

        // Display the retrieved games
        for (Games game : gamesList) {
            System.out.println("Game ID: " + game.getGameID());
            System.out.println("Title: " + game.getTitle());
            System.out.println("Description: " + game.getDescription());
            System.out.println("Genre ID: " + game.getGenreID());
            System.out.println("Genre Name: " + game.getGenres().getGenreName()); // Corrected line
            System.out.println("Image Link: " + game.getImageLink());
            System.out.println("Developer: " + game.getDeveloper());
            System.out.println("Release Date: " + game.getReleaseDate());
            System.out.println("Price: " + game.getPrice());
            System.out.println();
        }
    }

}
