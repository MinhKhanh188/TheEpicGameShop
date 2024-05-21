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

    public Users getUserByID(int userID) {
        Users user = null;
        String sql = "SELECT * FROM Users WHERE UserID = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userID);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                user = new Users();
                user.setUserID(resultSet.getInt("UserID"));
                user.setUsername(resultSet.getString("Username"));
                user.setPassword(resultSet.getString("Password"));
                user.setRole(resultSet.getInt("Role"));
                user.setDateCreated(resultSet.getString("DateCreated"));
                user.setUserPurse(resultSet.getDouble("UserPurse"));
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public void updateUserPurse(int userID, double newPurseBalance) {
        String sql = "UPDATE Users SET UserPurse = ? WHERE UserID = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setDouble(1, newPurseBalance);
            statement.setInt(2, userID);
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("User purse balance updated successfully.");
            } else {
                System.out.println("Failed to update user purse balance.");
            }
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
