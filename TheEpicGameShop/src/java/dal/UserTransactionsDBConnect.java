package dal;

import model.UserTransactions;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class UserTransactionsDBConnect extends DBConnect {

    public void insertTransactionHistories(List<UserTransactions> transactionsList) throws SQLException {
        String sql_insert = "INSERT INTO [dbo].[UserTransactions] ([UserID], [GameID], [Expenditure], [TransactionDate], [PaymentMethod]) VALUES (?, ?, ?, ?, ?)";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql_insert)) {
            for (UserTransactions transaction : transactionsList) {
                stmt.setInt(1, transaction.getUserID());
                stmt.setInt(2, transaction.getGameID());
                stmt.setDouble(3, transaction.getExpenditure());
                stmt.setString(4, transaction.getTransactionDate());
                stmt.setString(5, transaction.getPaymentMethod());
                stmt.addBatch();
            }
            stmt.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e; // Rethrow the exception after logging it
        }
    }
}
