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
import java.util.stream.Collectors;
import model.Games;
import model.Genres;

/**
 *
 * @author Mr.Khanh
 */
public class GamesDBConnect extends DBConnect {

     public List<Games> getGamesSortedByPriceRange(double minPrice, double maxPrice) {
        List<Games> list = new ArrayList<>();
        String sql = "SELECT G.*, Genres.GenreName " +
                     "FROM Games AS G " +
                     "INNER JOIN Genres ON G.GenreID = Genres.GenreID " +
                     "WHERE G.Price BETWEEN ? AND ? " +
                     "ORDER BY G.Price ASC";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setDouble(1, minPrice);
            stmt.setDouble(2, maxPrice);
            try (ResultSet rs = stmt.executeQuery()) {
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
                    
                    list.add(game);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }
    
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

    public List<Games> getGamesByIds(List<Integer> gameIds) {
        List<Games> list = new ArrayList<>();
        if (gameIds == null || gameIds.isEmpty()) {
            return list;
        }

        // Create a dynamic SQL query with placeholders
        String placeholders = gameIds.stream()
                .map(id -> "?")
                .collect(Collectors.joining(","));
        String sql = "SELECT * FROM Games WHERE GameID IN (" + placeholders + ")";

        try ( PreparedStatement stmt = connection.prepareStatement(sql)) {
            // Set the parameters for the prepared statement
            for (int i = 0; i < gameIds.size(); i++) {
                stmt.setInt(i + 1, gameIds.get(i));
            }
            try ( ResultSet rs = stmt.executeQuery()) {
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

                    // Add game to the list
                    list.add(game);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    /**
     * Inserts a new game into the database.
     *
     * @param game the game object to insert
     */
    public void insertGame(Games game) {
        String sql = "INSERT INTO Games (Title, Description, GenreID, ImageLink, Developer, ReleaseDate, Price) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try ( PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, game.getTitle());
            stmt.setString(2, game.getDescription());
            stmt.setInt(3, game.getGenreID());
            stmt.setString(4, game.getImageLink());
            stmt.setString(5, game.getDeveloper());
            stmt.setString(6, game.getReleaseDate());
            stmt.setDouble(7, game.getPrice());

            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    /**
     * Deletes a game from the database by its GameID.
     *
     * @param gameID the ID of the game to delete
     */
    public void deleteGame(int gameID) {
        String sql = "DELETE FROM Games WHERE GameID = ?";

        try ( PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, gameID);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    
     /**
     * Updates an existing game in the database.
     * @param game the game object to update
     */
   public boolean updateGame(Games game) {
        String sql = "UPDATE Games SET Title = ?, Description = ?, GenreID = ?, ImageLink = ?, Developer = ?, ReleaseDate = ?, Price = ? WHERE GameID = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, game.getTitle());
            stmt.setString(2, game.getDescription());
            stmt.setInt(3, game.getGenreID());
            stmt.setString(4, game.getImageLink());
            stmt.setString(5, game.getDeveloper());
            stmt.setString(6, game.getReleaseDate());
            stmt.setDouble(7, game.getPrice());
            stmt.setInt(8, game.getGameID());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
     public List<Games> searchGamesByTitle(String searchQuery) {
        List<Games> list = new ArrayList<>();
        String sql = "SELECT G.*, Genres.GenreName "
                   + "FROM Games AS G "
                   + "INNER JOIN Genres ON G.GenreID = Genres.GenreID "
                   + "WHERE G.Title LIKE ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, "%" + searchQuery + "%");
            try (ResultSet rs = stmt.executeQuery()) {
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
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }
   
    public static void main(String[] args) {
        // Create an instance of GamesDBConnect
        GamesDBConnect gamesDBConnect = new GamesDBConnect();

        // Call the getAll method to retrieve all games
        List<Games> gamesList = gamesDBConnect.getGamesSortedByPriceRange(0, 110);

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
