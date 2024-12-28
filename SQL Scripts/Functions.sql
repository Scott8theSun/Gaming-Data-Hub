use group2project;
drop function if exists CalculatePlayerGameTime;
delimiter //
-- calculate the player's game time of a specifc game. 
-- this will take the difference of the endtime and starttime of said gamesession
create function CalculatePlayerGameTime (player_id int, game_id int)
returns time
deterministic
no sql
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
