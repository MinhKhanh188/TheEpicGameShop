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
import model.Genres;

/**
 *
 * @author Mr.Khanh
 */
public class GenresDBConnect extends DBConnect {

    public List<Genres> getAll() {
        List<Genres> list = new ArrayList<>();
        String sql = "SELECT [GenreID]\n"
                + "      ,[GenreName]\n"
                + "  FROM [dbo].[Genres]\n";

        try ( PreparedStatement stmt = connection.prepareStatement(sql);  ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Genres genres = new Genres();
                genres.setGenreID(rs.getInt("GenreID"));
                genres.setGenreName(rs.getString("GenreName"));

                // Add game to the list
                list.add(genres);
            }
        } catch (SQLException ex) {
            // Handle the exception, e.g., log it or rethrow it
            System.err.println("SQL Exception: " + ex.getMessage());
        }

        return list;
    }
}
