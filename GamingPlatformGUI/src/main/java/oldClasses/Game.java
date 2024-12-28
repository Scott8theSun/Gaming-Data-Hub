package oldClasses;
import java.util.Date;

/**
 * Game Class to represent the columns in the
 * game SQL table.
 */
public class Game {
    private Integer gameID;  //Primary Key
    private Integer developerID; //Foreign Key - Developer(DeveloperID)
    private String title;
    private Date releaseDate;
    private String genre;
    private Integer rating;

    public Game() {
        this.gameID = null;
        this.developerID = null;
        this.title = null;
        this.releaseDate = null;
        this.genre = null;
        this.rating = null;
    }
    public Game(Integer gameID, Integer developerID, String title, Date releaseDate, String genre, Integer rating) {
        this.gameID = gameID;
        this.developerID = developerID;
        this.title = title;
        this.releaseDate = releaseDate;
        this.genre = genre;
        this.rating = rating;
    }
    /**
     * Getter Methods
     */
    public Integer getGameID() {
        return gameID;
    }
    public Integer getDeveloperID() {
        return developerID;
    }
    public String getTitle() {
        return title;
    }
    public Date getReleaseDate() {
        return releaseDate;
    }
    public String getGenre() {
        return genre;
    }
    public Integer getRating() {
        return rating;
    }
    /**
     * Setter Methods
     */
    public void setGameID(Integer gameID) {
        this.gameID = gameID;
    }
    public void setDeveloperID(Integer developerID) {
        this.developerID = developerID;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }
    public void setGenre(String genre) {
        this.genre = genre;
    }
    public void setRating(Integer rating) {
        this.rating = rating;
    }
}
