package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Users;

public class UserDBConnect extends DBConnect {

    public UserDBConnect() {
        super(); // Ensure the DBConnect constructor is called
    }

    public Users login(String username, String password) {
        Users user = null;
        String sql = "SELECT * FROM Users WHERE Username = ? AND Password = ?";
        try {
            System.out.println("Attempting to log in with username: " + username); // Add this line
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                user = new Users();
                user.setUserID(resultSet.getInt("UserID"));
                user.setUsername(resultSet.getString("UserName"));
                user.setRole(resultSet.getInt("Role"));
                // Set other user attributes as needed
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            // Handle the exception
            e.printStackTrace();
        }
        System.out.println("Login result: " + user); // Add this line
        return user;
    }
}
