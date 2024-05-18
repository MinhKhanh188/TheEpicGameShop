package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Games;

public class UserGamesLibraryDBConnect extends DBConnect {
    private int userID;

    public UserGamesLibraryDBConnect(int userID) {
        super();
        this.userID = userID;
    }

    public List<Games> getUserLibrary() {
        List<Games> userLibrary = new ArrayList<>();
        String sql = "SELECT Games.* "
                + "FROM Games "
                + "INNER JOIN UserGamesLibrary ON Games.GameID = UserGamesLibrary.GameID "
                + "WHERE UserGamesLibrary.UserID = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userID);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Games game = new Games();
                game.setGameID(resultSet.getInt("GameID"));
                game.setTitle(resultSet.getString("Title"));
                game.setDescription(resultSet.getString("Description"));
                game.setGenreID(resultSet.getInt("GenreID"));
                game.setImageLink(resultSet.getString("ImageLink"));
                game.setDeveloper(resultSet.getString("Developer"));
                game.setReleaseDate(resultSet.getString("ReleaseDate"));
                game.setPrice(resultSet.getDouble("Price"));
                userLibrary.add(game);
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userLibrary;
    }
}
