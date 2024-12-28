package oldClasses;

/**
 * Singleton class to hold user session data across the application lifecycle.
 * Stores user-specific information such as userId and username.
 */
public class UserSession {
    private static UserSession instance;
    private String userId;
    private String username; // Additional field to store the username

    // Private constructor to prevent external instantiation
    private UserSession() {}

    /**
     * Returns the single instance of this class, creating it if necessary.
     * @return the singleton instance
     */
    public static UserSession getInstance() {
        if (instance == null) {
            instance = new UserSession();
        }
        return instance;
    }

    /**
     * Gets the user ID stored in the session.
     * @return the user ID
     */
    public String getUserId() {
        return userId;
    }

    /**
     * Sets the user ID to be stored in the session.
     * @param userId the user ID to set
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * Gets the username stored in the session.
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * Sets the username to be stored in the session.
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }
}
