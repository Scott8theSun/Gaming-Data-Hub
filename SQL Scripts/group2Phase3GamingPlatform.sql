drop schema if exists Group2Project;
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
    StarRating DOUBLE,
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

INSERT INTO Developer (DeveloperID, Name, Email, DeveloperDesc)
VALUES
    (1, 'John Smith', 'john.smith@example.com', 'Experienced full-stack developer specializing in web technologies.'),
    (2, 'Emily Johnson', 'emily.johnson@example.com', 'Front-end developer with expertise in React and Angular.'),
    (3, 'Michael Brown', 'michael.brown@example.com', 'Backend developer focusing on Node.js and MongoDB.'),
    (4, 'Jessica Davis', 'jessica.davis@example.com', 'Mobile app developer proficient in iOS and Android development.'),
    (5, 'Christopher Wilson', 'chris.wilson@example.com', 'UI/UX designer with a passion for creating engaging user experiences.'),
    (6, 'Sarah Miller', 'sarah.miller@example.com', 'Software engineer specializing in Java and Spring Boot applications.'),
    (7, 'Matthew Thompson', 'matthew.thompson@example.com', 'Game developer experienced in Unity and Unreal Engine.'),
    (8, 'Laura Martinez', 'laura.martinez@example.com', 'AI and machine learning specialist working with Python and TensorFlow.'),
    (9, 'Kevin Anderson', 'kevin.anderson@example.com', 'Database administrator with expertise in SQL and data modeling.'),
    (10, 'Amanda Garcia', 'amanda.garcia@example.com', 'Cybersecurity analyst focusing on threat detection and prevention.'),
    (11, 'Daniel Hernandez', 'daniel.hernandez@example.com', 'Cloud solutions architect specializing in AWS and Azure.'),
    (12, 'Jennifer White', 'jennifer.white@example.com', 'Software tester ensuring high-quality and bug-free software products.'),
    (13, 'Robert Lee', 'robert.lee@example.com', 'Embedded systems engineer working on IoT devices and firmware development.'),
    (14, 'Kimberly Taylor', 'kimberly.taylor@example.com', 'DevOps engineer automating deployment pipelines and infrastructure management.'),
    (15, 'Mark Adams', 'mark.adams@example.com', 'Blockchain developer building decentralized applications and smart contracts.'),
    (16, 'Melissa Harris', 'melissa.harris@example.com', 'Web accessibility specialist ensuring inclusive design practices.'),
    (17, 'Steven Clark', 'steven.clark@example.com', 'Software project manager leading teams and delivering successful projects.'),
    (18, 'Catherine King', 'catherine.king@example.com', 'Technical writer creating clear and comprehensive documentation.'),
    (19, 'Jonathan Brown', 'jonathan.brown@example.com', 'IT support specialist resolving technical issues and providing user assistance.'),
    (20, 'Stephanie Martinez', 'stephanie.martinez@example.com', 'Full-stack developer proficient in multiple programming languages and frameworks.');
    
    INSERT INTO Player (PlayerID, Username, Email, Password, JoinDate, IsBanned, BannedUntil)
VALUES
    (1, 'player1', 'player1@example.com', 'pass123', '2023-01-15 10:30:00', FALSE, NULL),
    (2, 'player2', 'player2@example.com', 'abc456', '2023-02-20 14:45:00', TRUE, '2023-03-01 00:00:00'),
    (3, 'player3', 'player3@example.com', 'qwerty789', '2023-03-10 08:00:00', FALSE, NULL),
    (4, 'player4', 'player4@example.com', 'secure987', '2023-04-05 18:20:00', FALSE, NULL),
    (5, 'player5', 'player5@example.com', 'password123', '2023-05-12 12:10:00', TRUE, '2023-06-01 00:00:00'),
    (6, 'player6', 'player6@example.com', 'testpass', '2023-06-25 16:30:00', FALSE, NULL),
    (7, 'player7', 'player7@example.com', 'passpass', '2023-07-03 09:45:00', FALSE, NULL),
    (8, 'player8', 'player8@example.com', 'abcxyz123', '2023-08-18 21:15:00', TRUE, '2023-09-01 00:00:00'),
    (9, 'player9', 'player9@example.com', 'pass1234', '2023-09-07 14:00:00', FALSE, NULL),
    (10, 'player10', 'player10@example.com', 'password456', '2023-10-22 11:20:00', FALSE, NULL),
    (11, 'player11', 'player11@example.com', 'abc123', '2023-11-30 19:40:00', FALSE, NULL),
    (12, 'player12', 'player12@example.com', 'qwertyuiop', '2023-12-10 06:00:00', TRUE, '2024-01-01 00:00:00'),
    (13, 'player13', 'player13@example.com', 'passpass123', '2024-01-25 15:30:00', FALSE, NULL),
    (14, 'player14', 'player14@example.com', 'securepass', '2024-02-08 08:45:00', FALSE, NULL),
    (15, 'player15', 'player15@example.com', 'testing123', '2024-03-15 17:10:00', TRUE, '2024-04-01 00:00:00'),
    (16, 'player16', 'player16@example.com', 'letmein123', '2024-04-20 09:30:00', FALSE, NULL),
    (17, 'player17', 'player17@example.com', 'passpass456', '2024-05-02 12:45:00', FALSE, NULL),
    (18, 'player18', 'player18@example.com', 'abc456xyz', '2024-06-10 20:00:00', TRUE, '2024-07-01 00:00:00'),
    (19, 'player19', 'player19@example.com', 'password789', '2024-07-15 13:20:00', FALSE, NULL),
    (20, 'player20', 'player20@example.com', 'passpasspass', '2024-08-30 18:40:00', FALSE, NULL);
    
    INSERT INTO Game (GameID, DeveloperID, Title, ReleaseDate, Genre, Rating)
VALUES
    (1, 1, 'Space Adventure', '2023-01-20 00:00:00', 'Action', 4),
    (2, 2, 'Fantasy Quest', '2023-02-15 00:00:00', 'Adventure', 5),
    (3, 3, 'Cyberpunk Chronicles', '2023-03-10 00:00:00', 'RPG', 4),
    (4, 4, 'Racing Rivals', '2023-04-05 00:00:00', 'Racing', 3),
    (5, 5, 'Puzzle Mania', '2023-05-01 00:00:00', 'Puzzle', 4),
    (6, 6, 'Survival Island', '2023-06-20 00:00:00', 'Survival', 3),
    (7, 7, 'Battle Royale Madness', '2023-07-15 00:00:00', 'Action', 4),
    (8, 8, 'AI Revolution', '2023-08-10 00:00:00', 'Strategy', 5),
    (9, 9, 'Escape Room Challenge', '2023-09-05 00:00:00', 'Puzzle', 4),
    (10, 10, 'Epic Journey', '2023-10-01 00:00:00', 'Adventure', 4),
    (11, 11, 'Cloud City Builders', '2023-11-20 00:00:00', 'Simulation', 3),
    (12, 12, 'Zombie Apocalypse', '2023-12-15 00:00:00', 'Action', 4),
    (13, 13, 'Space Exploration', '2024-01-10 00:00:00', 'Adventure', 5),
    (14, 14, 'Virtual Reality World', '2024-02-05 00:00:00', 'Simulation', 4),
    (15, 15, 'Crypto Quest', '2024-03-01 00:00:00', 'RPG', 4),
    (16, 16, 'Underwater Adventure', '2024-04-20 00:00:00', 'Adventure', 3),
    (17, 17, 'Desert Racing', '2024-05-15 00:00:00', 'Racing', 4),
    (18, 18, 'Hackers United', '2024-06-10 00:00:00', 'Strategy', 5),
    (19, 19, 'Mystery Mansion', '2024-07-05 00:00:00', 'Adventure', 4),
    (20, 20, 'Galactic Conquest', '2024-08-01 00:00:00', 'Strategy', 4);
    
INSERT INTO GameSession (SessionID, GameID, PlayerID, StartTime, EndTime)
VALUES
    (1, 1, 1, '2023-01-20 15:00:00', '2023-01-20 16:30:00'),
    (2, 2, 2, '2023-02-15 14:00:00', '2023-02-15 16:00:00'),
    (3, 3, 3, '2023-03-10 18:30:00', '2023-03-10 20:00:00'),
    (4, 4, 4, '2023-04-05 19:45:00', '2023-04-05 21:15:00'),
    (5, 5, 5, '2023-05-01 12:00:00', '2023-05-01 13:30:00'),
    (6, 6, 6, '2023-06-20 17:30:00', '2023-06-20 19:00:00'),
    (7, 7, 7, '2023-07-15 10:00:00', '2023-07-15 12:00:00'),
    (8, 8, 8, '2023-08-10 16:45:00', '2023-08-10 18:30:00'),
    (9, 9, 9, '2023-09-05 20:00:00', '2023-09-05 22:00:00'),
    (10, 10, 10, '2023-10-01 13:15:00', '2023-10-01 14:45:00'),
    (11, 11, 11, '2023-11-20 18:00:00', '2023-11-20 19:30:00'),
    (12, 12, 12, '2023-12-15 20:30:00', '2023-12-15 22:00:00'),
    (13, 13, 13, '2024-01-10 14:45:00', '2024-01-10 16:15:00'),
    (14, 14, 14, '2024-02-05 09:30:00', '2024-02-05 11:00:00'),
    (15, 15, 15, '2024-03-01 17:00:00', '2024-03-01 18:30:00'),
    (16, 16, 16, '2024-04-20 10:45:00', '2024-04-20 12:15:00'),
    (17, 17, 17, '2024-05-15 14:30:00', '2024-05-15 16:00:00'),
    (18, 18, 18, '2024-06-10 19:00:00', '2024-06-10 20:30:00'),
    (19, 19, 19, '2024-07-05 15:45:00', '2024-07-05 17:15:00'),
    (20, 20, 20, '2024-08-01 11:00:00', '2024-08-01 12:30:00');

INSERT INTO Achievement (AchievementID, GameID, Title, AchievementDesc)
VALUES
    (1, 1, 'Space Explorer', 'Explore all planets in the galaxy.'),
    (2, 2, 'Master Wizard', 'Complete all magical quests.'),
    (3, 3, 'Cybernetic Champion', 'Defeat the final boss in Cyberpunk Chronicles.'),
    (4, 4, 'Speed Demon', 'Win 10 races in Racing Rivals.'),
    (5, 5, 'Puzzle Genius', 'Solve 100 puzzles in Puzzle Mania.'),
    (6, 6, 'Survivalist', 'Survive on the island for 30 days in Survival Island.'),
    (7, 7, 'Battle Royale Winner', 'Be the last player standing in Battle Royale Madness.'),
    (8, 8, 'AI Strategist', 'Achieve victory in AI Revolution without losing a unit.'),
    (9, 9, 'Escape Artist', 'Escape from all rooms in Escape Room Challenge.'),
    (10, 10, 'Epic Adventurer', 'Complete the epic journey in Epic Journey.'),
    (11, 11, 'City Architect', 'Build the most advanced city in Cloud City Builders.'),
    (12, 12, 'Zombie Hunter', 'Survive 100 waves of zombies in Zombie Apocalypse.'),
    (13, 13, 'Space Pioneer', 'Discover new galaxies in Space Exploration.'),
    (14, 14, 'Virtual Reality Expert', 'Master all challenges in Virtual Reality World.'),
    (15, 15, 'Crypto Conqueror', 'Become the wealthiest player in Crypto Quest.'),
    (16, 16, 'Underwater Explorer', 'Discover hidden treasures in Underwater Adventure.'),
    (17, 17, 'Desert Dominator', 'Win all races in Desert Racing.'),
    (18, 18, 'Hacker Supreme', 'Hack into the most secure systems in Hackers United.'),
    (19, 19, 'Mystery Solver', 'Unravel the secrets of Mystery Mansion.'),
    (20, 20, 'Galactic Conqueror', 'Conquer multiple planets in Galactic Conquest.');

INSERT INTO Report (ReportID, ReporterID, OffenderID, ReportDesc, ReportStatus)
VALUES
    (1, 1, 2, 'Player2 is using inappropriate language in chat.', 'Pending'),
    (2, 3, 4, 'Player4 is cheating in the game.', 'Pending'),
    (3, 5, 6, 'Player6 is harassing other players.', 'Pending'),
    (4, 7, 8, 'Player8 is spamming advertisements.', 'Pending'),
    (5, 9, 10, 'Player10 is engaging in suspicious behavior.', 'Pending'),
    (6, 11, 12, 'Player12 is exploiting a game bug.', 'Pending'),
    (7, 13, 14, 'Player14 is griefing other players.', 'Pending'),
    (8, 15, 16, 'Player16 is using offensive symbols in the game.', 'Pending'),
    (9, 17, 18, 'Player18 is disrupting gameplay.', 'Pending'),
    (10, 19, 20, 'Player20 is suspected of cheating.', 'Pending'),
    (11, 2, 3, 'Player3 is using inappropriate language in chat.', 'Pending'),
    (12, 4, 5, 'Player5 is cheating in the game.', 'Pending'),
    (13, 6, 7, 'Player7 is harassing other players.', 'Pending'),
    (14, 8, 9, 'Player9 is spamming advertisements.', 'Pending'),
    (15, 10, 11, 'Player11 is engaging in suspicious behavior.', 'Pending'),
    (16, 12, 13, 'Player13 is exploiting a game bug.', 'Pending'),
    (17, 14, 15, 'Player15 is griefing other players.', 'Pending'),
    (18, 16, 17, 'Player17 is using offensive symbols in the game.', 'Pending'),
    (19, 18, 19, 'Player19 is disrupting gameplay.', 'Pending'),
    (20, 20, 1, 'Player1 is suspected of cheating.', 'Pending');

INSERT INTO Reviews (ReviewID, ReviewerID, GameID, Content, StarRating)
VALUES
    (1, 1, 1, 'Great game, loved exploring the galaxy!', 5),
    (2, 2, 2, 'Awesome quests, very immersive experience.', 5),
    (3, 3, 3, 'Enjoyed the cybernetic theme, challenging boss fights.', 4),
    (4, 4, 4, 'Fun racing game, great graphics!', 4),
    (5, 5, 5, 'Puzzles were engaging, kept me hooked.', 5),
    (6, 6, 6, 'Survival mechanics were realistic, enjoyed crafting.', 4),
    (7, 7, 7, 'Exciting battles, great for competitive players.', 5),
    (8, 8, 8, 'Strategic gameplay, AI opponents are challenging.', 4),
    (9, 9, 9, 'Interesting puzzles, loved the escape room concept.', 4),
    (10, 10, 10, 'Epic storyline, lots of adventures!', 5),
    (11, 11, 11, 'City building mechanics were addictive.', 4),
    (12, 12, 12, 'Zombie waves were intense, great survival game.', 5),
    (13, 13, 13, 'Expansive universe, enjoyed exploring new planets.', 5),
    (14, 14, 14, 'Virtual reality challenges were mind-bending.', 4),
    (15, 15, 15, 'Crypto quests added a unique twist to RPG.', 5),
    (16, 16, 16, 'Underwater world was beautifully designed.', 4),
    (17, 17, 17, 'Desert racing tracks were thrilling.', 4),
    (18, 18, 18, 'Hacking mechanics were innovative and fun.', 5),
    (19, 19, 19, 'Mystery mansion had a great atmosphere.', 4),
    (20, 20, 20, 'Conquering planets was a challenging but rewarding experience.', 5);

INSERT INTO PlayerAchievement (PlayerID, AchievementID, UnlockDate)
VALUES
    (1, 1, '2023-01-25 14:00:00'),
    (2, 2, '2023-02-18 12:30:00'),
    (3, 3, '2023-03-12 17:45:00'),
    (4, 4, '2023-04-08 19:00:00'),
    (5, 5, '2023-05-15 10:00:00'),
    (6, 6, '2023-06-22 16:20:00'),
    (7, 7, '2023-07-18 09:30:00'),
    (8, 8, '2023-08-15 14:15:00'),
    (9, 9, '2023-09-10 18:45:00'),
    (10, 10, '2023-10-05 11:30:00'),
    (11, 11, '2023-11-25 20:00:00'),
    (12, 12, '2023-12-20 21:45:00'),
    (13, 13, '2024-01-15 13:00:00'),
    (14, 14, '2024-02-10 08:00:00'),
    (15, 15, '2024-03-05 16:30:00'),
    (16, 16, '2024-04-25 10:15:00'),
    (17, 17, '2024-05-20 14:45:00'),
    (18, 18, '2024-06-15 19:00:00'),
    (19, 19, '2024-07-10 15:30:00'),
    (20, 20, '2024-08-05 11:00:00');
    
INSERT INTO PlayerGames (PlayerID, GameID, PurchaseDate, IsInstalled)
VALUES
    (1, 1, '2023-01-20 00:00:00', TRUE),
    (1, 2, '2023-02-01 00:00:00', TRUE),
    (2, 1, '2023-02-15 00:00:00', FALSE),
    (2, 3, '2023-03-05 00:00:00', TRUE),
    (3, 5, '2023-03-22 00:00:00', TRUE),
    (3, 10, '2023-04-10 00:00:00', FALSE),
    (4, 1, '2023-04-15 00:00:00', TRUE),
    (4, 4, '2023-05-05 00:00:00', TRUE),
    (5, 2, '2023-05-20 00:00:00', FALSE),
    (5, 5, '2023-06-01 00:00:00', TRUE),
    (6, 3, '2023-06-18 00:00:00', TRUE),
    (7, 7, '2023-07-07 00:00:00', TRUE),
    (8, 8, '2023-08-24 00:00:00', FALSE),
    (9, 1, '2023-09-15 00:00:00', TRUE),
    (10, 10, '2023-10-02 00:00:00', TRUE),
    (11, 5, '2023-10-22 00:00:00', TRUE),
    (12, 12, '2023-11-15 00:00:00', TRUE),
    (13, 13, '2023-12-05 00:00:00', FALSE),
    (14, 1, '2024-01-10 00:00:00', TRUE),
    (15, 2, '2024-02-08 00:00:00', TRUE),
    (16, 3, '2024-03-01 00:00:00', FALSE),
    (17, 5, '2024-04-05 00:00:00', TRUE),
    (18, 6, '2024-05-03 00:00:00', TRUE),
    (19, 7, '2024-06-20 00:00:00', TRUE),
    (20, 8, '2024-07-15 00:00:00', FALSE);

# Trigger 1: Ensure star rating is between 1 and 5
DELIMITER //
DROP TRIGGER IF EXISTS trg_CheckRatingBoundaries //
CREATE TRIGGER trg_CheckRatingBoundaries
BEFORE INSERT ON Reviews
FOR EACH ROW
BEGIN
    IF NEW.StarRating < 1 THEN
        SET NEW.StarRating = 1;
    ELSEIF NEW.StarRating > 5 THEN
        SET NEW.StarRating = 5;
    END IF;
END; //

DELIMITER ;

# Trigger 2: Update a game's rating after a review
DELIMITER $$
DROP TRIGGER IF EXISTS AfterReviewInsert $$
CREATE TRIGGER AfterReviewInsert
AFTER INSERT ON Reviews
FOR EACH ROW
BEGIN
    DECLARE newAvgRating DECIMAL(3,2);

    SELECT AVG(StarRating) INTO newAvgRating
    FROM Reviews
    WHERE GameID = NEW.GameID;

    UPDATE Game
    SET Rating = newAvgRating
    WHERE GameID = NEW.GameID;
END$$
DELIMITER ;

# Query 1: Retrieve games by genre
SELECT * FROM game WHERE Genre = "Action";

# Query 2: Get all of a player's achievements
SELECT 
    Player.Username,
    Game.Title AS GameTitle,
    Achievement.Title AS AchievementTitle,
    PlayerAchievement.UnlockDate
FROM
    PlayerAchievement
        INNER JOIN
    Player ON PlayerAchievement.PlayerID = Player.PlayerID
        INNER JOIN
    Achievement ON PlayerAchievement.AchievementID = Achievement.AchievementID
        INNER JOIN
    Game ON Achievement.GameID = Game.GameID
WHERE
    Player.PlayerID = 1
ORDER BY Player.Username , Game.Title , Achievement.Title , PlayerAchievement.UnlockDate;

# Query 3: Show a player count for a timeframe
SELECT 
    Game.Title AS GameTitle,
    Player.Username,
    GameSession.StartTime,
    GameSession.EndTime
FROM
    GameSession
        INNER JOIN
    Game ON GameSession.GameID = Game.GameID
        INNER JOIN
    Player ON GameSession.PlayerID = Player.PlayerID
WHERE
    MONTH(GameSession.StartTime) = 1
ORDER BY Game.Title , Player.Username , GameSession.StartTime;

# Query 4: Get average rating for a game
SELECT
    Game.Title,
    AVG(Reviews.StarRating) AS AveragereviewsContentContentRating
FROM
    Reviews
INNER JOIN Game ON Reviews.GameID = Game.GameID
WHERE
    Game.GameID = 1
GROUP BY
    Game.Title;

# Query 5: Get all pending reports
SELECT * FROM report WHERE ReportStatus = 'Pending';

drop function if exists CalculatePlayerGameTime;
delimiter //
-- calculate the player's game time of a specifc game. 
-- this will take the difference of the endtime and starttime of said gamesession
create function CalculatePlayerGameTime (player_id int, game_id int)
returns time
deterministic
begin
	declare gamePlayTime time;
    select sec_to_time(time_to_sec(timediff(EndTime, StartTime)))
    into gamePlayTime
    from GameSession
    where playerID = player_id and gameID = game_id;
    
    return gamePlayTime;
end;

drop view if exists PlayerGameTimeSummary;
-- view summarizes the playtime of a player for a game
create view PlayerGameTimeSummary as
select
	player.username as PlayerName,
    game.Title as GameTitle,
    CalculatePlayerGameTime(GameSession.PlayerID, GameSession.GameID) as TotalPlayTime
from
	GameSession
inner join player on gameSession.playerID = player.playerID
inner join game on gameSession.gameID = game.gameID;
//
delimiter ;

select * from PlayerGameTimeSummary;

DELIMITER //
CREATE PROCEDURE UnbanPlayer(IN inputPlayerID INT)
BEGIN
    -- Update player to remove ban
    UPDATE Player
    SET IsBanned = FALSE,
        BannedUntil = NULL
    WHERE PlayerID = inputPlayerID;

    -- Retrieve updated player details
    SELECT Username, Email, JoinDate, IsBanned, BannedUntil
    FROM Player
    WHERE IsBanned = TRUE;
END //
DELIMITER ;

-- Input PlayerID and procedure will run
CALL UnbanPlayer(1);

/*
This procedure can be used by developers to unban a player and then displays all the players that are currently banned.
The procedure can help developers be more effiecent when unbanning players and if they need to unban more players, 
then the table that displays after the procedure runs will show them the PlayerID they can input when the call the
procedure again.
*/

ALTER TABLE Reviews MODIFY COLUMN ReviewID INT AUTO_INCREMENT
