/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Mr.Khanh
 */
public class UserGamesLibrary {

    private int UserID;
    private int GameID;
    Users users;

    public UserGamesLibrary() {
    }

    public UserGamesLibrary(int UserID, int GameID, Users users) {
        this.UserID = UserID;
        this.GameID = GameID;
        this.users = users;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getGameID() {
        return GameID;
    }

    public void setGameID(int GameID) {
        this.GameID = GameID;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

}
