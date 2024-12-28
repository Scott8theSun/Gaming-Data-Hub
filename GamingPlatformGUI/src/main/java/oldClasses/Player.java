package oldClasses;

import java.util.Date;

/**
 * Player class to represent the columns in
 * the player SQL table.
 */
public class Player {

    private Integer playerID; //Primary Key
    private String username;
    private String email;
    private String password;
    private String joinDate;
    private Boolean isBanned;
    private Date bannedUntil;

    public Player() {
        this.playerID = null;
        this.username = null;
        this.email = null;
        this.password = null;
        this.joinDate = null;
        this.isBanned = false;
        this.bannedUntil = null;
    }

    public Player(Integer playerID, String username, String email, String password, String joinDate, Boolean isBanned, Date bannedUntil) {
        this.playerID = playerID;
        this.username = username;
        this.email = email;
        this.password = password;
        this.joinDate = joinDate;
        this.isBanned = isBanned;
        this.bannedUntil = bannedUntil;
    }

    /**
     *  Getter Methods
     */
    public Integer getPlayerID() {
        return playerID;
    }
    public String getUsername() {
        return username;
    }
    public String getEmail() {
        return email;
    }
    public String getPassword() {
        return password;
    }
    public String getJoinDate() {
        return joinDate;
    }
    public Boolean getIsBanned() {
        return isBanned;
    }
    public Date getBannedUntil() {
        return bannedUntil;
    }

    /**
     * Setter Methods
     */
    public void setPlayerID(Integer playerID) {
        this.playerID = playerID;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public void setJoinDate(String joinDate) {
        this.joinDate = joinDate;
    }
    public void setIsBanned(Boolean isBanned) {
        this.isBanned = isBanned;
    }
    public void setBannedUntil(Date bannedUntil) {
        this.bannedUntil = bannedUntil;
    }
}
