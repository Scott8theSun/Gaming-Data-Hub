package oldClasses;

/**
 * Review class to represent the columns
 * in the review SQL table.
 */
public class Review {
    private Integer reviewID;  //Primary key
    private Integer reviewerID;  //Foreign key - Player(PlayerID)
    private Integer gameID;  //Foreign key - Game(GameID)
    private String content;
    private Integer starRating;  //Between 1 & 5

    public Review() {
        this.reviewID = null;
        this.reviewerID = null;
        this.gameID = null;
        this.content = null;
        this.starRating = null;
    }
    public Review(Integer reviewID, Integer reviewerID, Integer gameID, String content, Integer starRating) {
        this.reviewID = reviewID;
        this.reviewerID = reviewerID;
        this.gameID = gameID;
        this.content = content;
        this.starRating = starRating;
    }

    /**
     * Getter Methods
     */
    public Integer getReviewID() {
        return reviewID;
    }
    public Integer getReviewerID() {
        return reviewerID;
    }
    public Integer getGameID() {
        return gameID;
    }
    public String getContent() {
        return content;
    }
    public Integer getStarRating() {
        return starRating;
    }
    /**
     * Setter Methods
     */
    public void setReviewID(Integer reviewID) {
        this.reviewID = reviewID;
    }
    public void setReviewerID(Integer reviewerID) {
        this.reviewerID = reviewerID;
    }
    public void setGameID(Integer gameID) {
        this.gameID = gameID;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public void setStarRating(Integer starRating) {
        if (starRating >= 1 && starRating <= 5) {
            this.starRating = starRating;
        } else {
            throw new IllegalArgumentException("Star rating must be between 1 and 5.");
        }
    }
}
