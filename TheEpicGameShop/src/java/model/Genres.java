/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Mr.Khanh
 */
public class Genres {

    private int GenreID;
    private String GenreName;

    public Genres() {
    }

    public Genres(int GenreID, String GenreName) {
        this.GenreID = GenreID;
        this.GenreName = GenreName;
    }

    public int getGenreID() {
        return GenreID;
    }

    public void setGenreID(int GenreID) {
        this.GenreID = GenreID;
    }

    public String getGenreName() {
        return GenreName;
    }

    public void setGenreName(String GenreName) {
        this.GenreName = GenreName;
    }

}
