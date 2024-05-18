package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnect {
    public Connection connection;

    public DBConnect(String url, String username, String pass) {
        try {
            //goi driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //conect
            connection = DriverManager.getConnection(url, username, pass);
            System.out.println("Connected");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public DBConnect() {
        this("jdbc:sqlserver://localhost:1433;databaseName=epicGameShop1",
                "khanh188", "188200321");
    }
    public ResultSet getData(String sql){
        ResultSet rs=null;
         Statement state;
        try {
            state = connection.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
             rs = state.executeQuery(sql);
        } catch (SQLException ex) {
           ex.printStackTrace();
        }
        return rs;
    }

    public static void main(String[] args) {
        new DBConnect();
    }
}