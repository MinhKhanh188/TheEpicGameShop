/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Mr.Khanh
 */
public class UserTransactions {

    private int TransactionID;
    private int UserID;
    private int GameID;
    private Double Expenditure;
    private String TransactionDate;
    private String PaymentMethod;
    Users users;
    Games games;

    public UserTransactions() {
    }

    public UserTransactions(int TransactionID, int UserID, int GameID, Double Expenditure, String TransactionDate, String PaymentMethod, Users users, Games games) {
        this.TransactionID = TransactionID;
        this.UserID = UserID;
        this.GameID = GameID;
        this.Expenditure = Expenditure;
        this.TransactionDate = TransactionDate;
        this.PaymentMethod = PaymentMethod;
        this.users = users;
        this.games = games;
    }

    public int getTransactionID() {
        return TransactionID;
    }

    public void setTransactionID(int TransactionID) {
        this.TransactionID = TransactionID;
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

    public Double getExpenditure() {
        return Expenditure;
    }

    public void setExpenditure(Double Expenditure) {
        this.Expenditure = Expenditure;
    }

    public String getTransactionDate() {
        return TransactionDate;
    }

    public void setTransactionDate(String TransactionDate) {
        this.TransactionDate = TransactionDate;
    }

    public String getPaymentMethod() {
        return PaymentMethod;
    }

    public void setPaymentMethod(String PaymentMethod) {
        this.PaymentMethod = PaymentMethod;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public Games getGames() {
        return games;
    }

    public void setGames(Games games) {
        this.games = games;
    }

}
