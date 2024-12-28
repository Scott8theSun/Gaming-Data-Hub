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
