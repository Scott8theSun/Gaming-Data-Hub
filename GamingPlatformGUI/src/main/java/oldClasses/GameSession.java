package oldClasses;

import java.util.Date;

/**
 * GameSession class to represent the columns
 * in the gameSession SQL table.
 */
public class GameSession {
    private Integer sessionID;  //Primary Key
    private Integer gameID;  //Foreign Key - Game(GameID)
    private Integer playerID;  //Foreign Key - Player(PlayerID)
    private Date startTime;
    private Date endTime;

    public GameSession() {
        this.sessionID = null;
        this.gameID = null;
        this.playerID = null;
        this.startTime = null;
        this.endTime = null;
    }
    public GameSession(Integer sessionID, Integer gameID, Integer playerID, Date startTime, Date endTime) {
        this.sessionID = sessionID;
        this.gameID = gameID;
        this.playerID = playerID;
        this.startTime = startTime;
        this.endTime = endTime;
    }
    /**
     * Getter Methods
     */
    public Integer getSessionID() {
        return sessionID;
    }
    public Integer getGameID() {
        return gameID;
    }
    public Integer getPlayerID() {
        return playerID;
    }
    public Date getStartTime() {
        return startTime;
    }
    public Date getEndTime() {
        return endTime;
    }
    /**
     * Setter Methods
     */
    public void setSessionID(Integer sessionID) {
        this.sessionID = sessionID;
    }
    public void setGameID(Integer gameID) {
        this.gameID = gameID;
    }
    public void setPlayerID(Integer playerID) {
        this.playerID = playerID;
    }
    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
}
