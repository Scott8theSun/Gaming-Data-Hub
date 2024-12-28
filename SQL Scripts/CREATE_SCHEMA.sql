CREATE SCHEMA Group2Project; 
USE Group2Project;

CREATE TABLE Developer
    (DeveloperID INTEGER, 
    Name VARCHAR(50), 
    Email VARCHAR(50), 
    DeveloperDesc VARCHAR(250),
    PRIMARY KEY (DeveloperID));

CREATE TABLE Player 
    (PlayerID INTEGER, 
    Username VARCHAR(50),
    Email VARCHAR(50), 
    Password VARCHAR(50), 
    JoinDate DATETIME, 
    IsBanned BOOLEAN, 
    BannedUntil DATETIME, 
    PRIMARY KEY (PlayerID));

CREATE TABLE Game
    (GameID INTEGER, 
    DeveloperID INTEGER, 
    Title VARCHAR(100), 
    ReleaseDate DATETIME, 
    Genre VARCHAR(50), 
    Rating INTEGER,
    PRIMARY KEY (GameID),
    FOREIGN KEY (DeveloperID) REFERENCES Developer(DeveloperID));

CREATE TABLE GameSession
    (SessionID INTEGER, 
    GameID INTEGER, 
    PlayerID INTEGER, 
    StartTime DATETIME, 
    EndTime DATETIME,
    PRIMARY KEY (SessionID),
    FOREIGN KEY (GameID) REFERENCES Game(GameID),
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID));

CREATE TABLE Achievement
    (AchievementID INTEGER, 
    GameID INTEGER, 
    Title VARCHAR(50), 
    AchievementDesc VARCHAR(250), 
    PRIMARY KEY (AchievementID),
    FOREIGN KEY (GameID) REFERENCES Game(GameID));

CREATE TABLE Report
    (ReportID INTEGER, 
    ReporterID INTEGER, 
    OffenderID INTEGER, 
    ReportDesc TEXT, 
    ReportStatus CHAR(10),
    CONSTRAINT chk_status CHECK (ReportStatus IN ('Pending', 'Resolved')),
    PRIMARY KEY (ReportID),
    FOREIGN KEY (ReporterID) REFERENCES Player(PlayerID),
    FOREIGN KEY (OffenderID) REFERENCES Player(PlayerID));

CREATE TABLE Reviews
    (ReviewID INTEGER, 
    ReviewerID INTEGER, 
    GameID INTEGER, 
    Content TEXT, 
    StarRating INTEGER,
    PRIMARY KEY (ReviewID),
    FOREIGN KEY (ReviewerID) REFERENCES Player(PlayerID),
    FOREIGN KEY (GameID) REFERENCES Game(GameID));

CREATE TABLE PlayerAchievement
	(PlayerID INTEGER,
    AchievementID INTEGER,
    UnlockDate DATETIME,
    PRIMARY KEY (PlayerID, AchievementID),
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
    FOREIGN KEY (AchievementID) REFERENCES Achievement(AchievementID)); 

CREATE TABLE PlayerGames
(
    PlayerID INTEGER,
    GameID INTEGER,
    PurchaseDate DATETIME,
    IsInstalled BOOLEAN,
    PRIMARY KEY (PlayerID, GameID),
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
    FOREIGN KEY (GameID) REFERENCES Game(GameID)
);
