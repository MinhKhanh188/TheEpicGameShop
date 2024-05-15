create database epicGameShop1

use epicGameShop1

-- User Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY,
    Username NVARCHAR(60) UNIQUE,
    Password NVARCHAR(100), -- Hashed and salted for security
    Role INT, -- 1 is productManager 2 is user
    DateCreated NVARCHAR(50),
    UserPurse DECIMAL(10, 2)
);

-- Genres Table
CREATE TABLE Genres (
    GenreID INT PRIMARY KEY IDENTITY,
    GenreName NVARCHAR(200) UNIQUE
);

-- Games Table
CREATE TABLE Games (
    GameID INT PRIMARY KEY IDENTITY,
    Title NVARCHAR(400),
    Description NVARCHAR(MAX),
    GenreID INT,
	ImageLink NVARCHAR(MAX),
    Developer NVARCHAR(100),
    ReleaseDate DATE,
    Price DECIMAL(10, 2),
	FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);


-- User Games Library Table (Many-to-Many Relationship)
CREATE TABLE UserGamesLibrary (
    UserID INT,
    GameID INT,
    PRIMARY KEY (UserID, GameID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (GameID) REFERENCES Games(GameID)
);

-- User Transactions History Table
CREATE TABLE UserTransactions (
    TransactionID INT PRIMARY KEY IDENTITY,
    UserID INT,
    BoughtedGames NVARCHAR(MAX),
    TransactionDate NVARCHAR(50),
    PaymentMethod NVARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- User Transactions Details Table (for storing individual bought games per transaction)
CREATE TABLE UserTransactionDetails (
    TransactionDetailID INT PRIMARY KEY IDENTITY,
    TransactionID INT,
    GameID INT,
    FOREIGN KEY (TransactionID) REFERENCES UserTransactions(TransactionID),
    FOREIGN KEY (GameID) REFERENCES Games(GameID)
);





