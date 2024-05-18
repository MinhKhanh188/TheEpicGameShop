/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Mr.Khanh
 */
public class Games {

    private int GameID;
    private String Title;
    private String Description;
    private int GenreID;
    private String ImageLink;
    private String Developer;
    private String ReleaseDate;
    private Double Price;
    Genres genres;

    public Games() {
    }

    public Games(int GameID, String Title, String Description, int GenreID, String ImageLink, String Developer, String ReleaseDate, Double Price, Genres genres) {
        this.GameID = GameID;
        this.Title = Title;
        this.Description = Description;
        this.GenreID = GenreID;
        this.ImageLink = ImageLink;
        this.Developer = Developer;
        this.ReleaseDate = ReleaseDate;
        this.Price = Price;
        this.genres = genres;
    }

    public int getGameID() {
        return GameID;
    }

    public void setGameID(int GameID) {
        this.GameID = GameID;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getGenreID() {
        return GenreID;
    }

    public void setGenreID(int GenreID) {
        this.GenreID = GenreID;
    }

    public String getImageLink() {
        return ImageLink;
    }

    public void setImageLink(String ImageLink) {
        this.ImageLink = ImageLink;
    }

    public String getDeveloper() {
        return Developer;
    }

    public void setDeveloper(String Developer) {
        this.Developer = Developer;
    }

    public String getReleaseDate() {
        return ReleaseDate;
    }

    public void setReleaseDate(String ReleaseDate) {
        this.ReleaseDate = ReleaseDate;
    }

    public Double getPrice() {
        return Price;
    }

    public void setPrice(Double Price) {
        this.Price = Price;
    }

    public Genres getGenres() {
        return genres;
    }

    public void setGenres(Genres genres) {
        this.genres = genres;
    }

}
