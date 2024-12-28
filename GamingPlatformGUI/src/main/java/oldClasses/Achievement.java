package oldClasses;

/**
 * Acheivement Class to represent columns in the achievement table.
 */
public class Achievement {
    private Integer achievementID; //Primary Key
    private Integer gameID; //Foreign key - Game(GameID)
    private String title;
    private String achievementDesc;

    public Achievement() {
        this.achievementID = null;
        this.gameID = null;
        this.title = null;
        this.achievementDesc = null;
    }
    public Achievement(Integer achievementID, Integer gameID, String title, String achievementDesc) {
        this.achievementID = achievementID;
        this.gameID = gameID;
        this.title = title;
        this.achievementDesc = achievementDesc;
    }
    /*
        Getter Methods
     */
    public Integer getAchievementID() {
        return achievementID;
    }
    public Integer getGameID() {
        return gameID;
    }
    public String getTitle() {
        return title;
    }
    public String getAchievementDesc() {
        return achievementDesc;
    }
    /*
        Setter Methods
     */
    public void setAchievementID(Integer achievementID) {
        this.achievementID = achievementID;
    }
    public void setGameID(Integer gameID) {
        this.gameID = gameID;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public void setAchievementDesc(String achievementDesc) {
        this.achievementDesc = achievementDesc;
    }
}
