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
    AVG(Reviews.StarRating) AS AverageRating
FROM
    Reviews
INNER JOIN Game ON Reviews.GameID = Game.GameID
WHERE
    Game.GameID = 1
GROUP BY
    Game.Title;

# Query 5: Get all pending reports
SELECT * FROM report WHERE ReportStatus = 'Pending';

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
