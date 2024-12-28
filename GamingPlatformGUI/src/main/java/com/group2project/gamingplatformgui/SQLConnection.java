package com.group2project.gamingplatformgui;
import javax.swing.*;
import java.sql.*;
import java.util.*;

/**
 *  Singleton SQLConnection class to handle the connection to
 *  the local SQL database.
 */
public class SQLConnection {
    private static SQLConnection instance;
    private Connection connection;
    private static final String DATABASE_NAME = "group2project";
    private static final String SQL_USERNAME = "root";  // Edit username to reflect YOUR SQL database username
    private static final String SQL_PASSWORD = "The creek runs fast!";  // Edit password to reflect YOUR SQL database password

    // Private constructor to prevent instantiation
    private SQLConnection() {
        connect();
    }
    //get Connection
    public Connection getConnection() {
        return connection;
    }

    // Public method to get the instance of the class
    public static synchronized SQLConnection getInstance() {
        if (instance == null) {
            instance = new SQLConnection();
        }
        return instance;
    }

    // Method to establish a database connection

    private void connect() {
        try {
            String url = "jdbc:mysql://localhost/" + DATABASE_NAME + "?user=" + SQL_USERNAME + "&password=" + SQL_PASSWORD;
            connection = DriverManager.getConnection(url);
            System.out.println("Database connected successfully.");
        } catch (SQLException e) {
            System.out.println("Error connecting to the database: " + e.getMessage());
            connection = null;
        }
    }

    /**
     * getPasswordForUserID method takes userID passed to it and returns
     * the password from the Player SQL table.
     *
     * @param ID
     * @return String password
     */
    public String getPasswordForUserID(String ID) {
        String query = "SELECT Password FROM Player WHERE Username = ?;";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setString(1, ID);  // Set the userID in the prepared statement

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("Password");  // Return the password
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Handle any SQL exceptions
        }
        return null;  // Return null if the password is not found or an error occurs
    }

    // Method to get PlayerID for a given username
    public String getPlayerIdByUsername(String userName) {
        String query = "SELECT PlayerID FROM Player WHERE Username = ?;";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, userName);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("PlayerID");
                }
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving player ID: " + e.getMessage());
            e.printStackTrace();
        }
        return null;  // Return null if the player ID is not found or an error occurs
    }
    public String getUsernameByPlayerID(Integer playerID) {
        String query = "SELECT Username FROM Player WHERE PlayerID = ?;";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, playerID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("Username");
                }
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving Username: " + e.getMessage());
            e.printStackTrace();
        }
        return null;  // Return null if the player ID is not found or an error occurs
    }

    public Map<String, Object> getGameDetails(int gameId) {
        Map<String, Object> gameDetails = new HashMap<>();
        String query = "SELECT GameID, Title, DeveloperID, Genre, ReleaseDate, Rating FROM Game WHERE GameID = ?;";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, gameId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    gameDetails.put("GameID", rs.getInt("GameID"));
                    gameDetails.put("Title", rs.getString("Title"));
                    gameDetails.put("DeveloperID", rs.getInt("DeveloperID"));
                    gameDetails.put("Genre", rs.getString("Genre"));
                    gameDetails.put("ReleaseDate", rs.getDate("ReleaseDate"));
                    gameDetails.put("Rating", rs.getInt("Rating"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving game details: " + e.getMessage());
        }
        return gameDetails;
    }
    public Set<Integer> getOwnedGames(int playerID) {
        Set<Integer> ownedGames = new HashSet<>();
        String query = "SELECT GameID FROM PlayerGames WHERE PlayerID = ?;";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, playerID);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ownedGames.add(rs.getInt("GameID"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving owned games: " + e.getMessage());
        }
        return ownedGames;
    }
    public List<String> getAllGames() {
        List<String> games = new ArrayList<>();
        String query = "SELECT GameID, Title FROM Game;";
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                int gameId = rs.getInt("GameID");
                String title = rs.getString("Title");
                games.add(gameId + " - " + title);
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving games: " + e.getMessage());
        }
        return games;
    }

    public DefaultListModel getReportList(int userID) {
        DefaultListModel listModel = new DefaultListModel();

        String query = "SELECT r.ReportID, p.Username AS OffenderUsername\n" +
                "FROM Report r\n" +
                "INNER JOIN Player p ON r.OffenderID = p.PlayerID\n" +
                "WHERE r.ReporterID = ?\n" + // Add WHERE clause to filter by ReporterID
                "ORDER BY r.ReportID;";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, userID); // Set the parameter for ReporterID

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int reportID = rs.getInt("ReportID");
                    String offenderUsername = rs.getString("OffenderUsername");
                    String reportInfo = reportID + " - " + offenderUsername;
                    listModel.addElement(reportInfo);
                }
            }

        } catch (SQLException exception) {
            exception.printStackTrace();
            return null; // or handle the exception appropriately
        }
        return listModel;
    }
    public HashMap getReport(Integer reportID) {
        HashMap<String, Object> reportDetails = new HashMap<>();

        String query = "SELECT * FROM Report WHERE ReportID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, reportID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
                        String columnName = rs.getMetaData().getColumnName(i);
                        Object columnValue = rs.getObject(i);
                        reportDetails.put(columnName, columnValue);
                    }
                } else {
                    System.out.println("Review ID not found in the database.");
                }
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return reportDetails;
    }
    public Integer getNewReportID(){
        Integer newID = null;
        String query = "SELECT MIN(t1.ReportID + 1) AS next_available_id " +
                "FROM Report AS t1 " +
                "WHERE NOT EXISTS (SELECT 1 FROM Report AS t2 WHERE t2.ReportID = t1.ReportID + 1)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    newID = rs.getInt("next_available_id");
                }
            } catch (SQLException e) {
                System.out.println("Error retrieving new ID: " + e.getMessage());
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving new ID: " + e.getMessage());
        }
        return newID;
    }
    public void insertReport(HashMap<String, String> reportMap) {
        String insertQuery = "INSERT INTO Report (ReportID, ReporterID, OffenderID, ReportDesc, ReportStatus) " +
                "VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(insertQuery)) {
            // Set values for the prepared statement
            stmt.setString(1, reportMap.get("reportID"));
            stmt.setString(2, reportMap.get("reporterID"));
            stmt.setString(3, reportMap.get("offenderID"));
            stmt.setString(4, reportMap.get("reportDesc"));
            stmt.setString(5, reportMap.get("reportStatus"));

            // Execute the insert statement
            stmt.executeUpdate();
            System.out.println("Report inserted successfully.");
        } catch (SQLException e) {
            System.out.println("Error inserting report: " + e.getMessage());
        }
    }
    public void updateReport(HashMap<String, String> reportMap){
        String updateQuery = "UPDATE Report " +
                "SET  OffenderID = ?, ReportDesc = ?, ReportStatus = ? " +
                "WHERE ReportID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(updateQuery)) {
            // Set values for the prepared statement
            stmt.setString(1, reportMap.get("offenderID"));
            stmt.setString(2, reportMap.get("reportDesc"));
            stmt.setString(3, reportMap.get("reportStatus"));
            stmt.setString(4, reportMap.get("reportID"));

            // Execute the update statement
            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Report updated successfully.");
            } else {
                System.out.println("No report found with the specified ReportID.");
            }
        } catch (SQLException e) {
            System.out.println("Error updating report: " + e.getMessage());
        }
    }
    public void deleteReport(Integer reportID){
        String deleteQuery = "DELETE FROM Report WHERE ReportID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(deleteQuery)) {
            stmt.setInt(1, reportID);

            int rowsDeleted = stmt.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("Report deleted successfully.");
            } else {
                System.out.println("No report found with the specified ReportID.");
            }
        } catch (SQLException e) {
            System.out.println("Error deleting report: " + e.getMessage());
        }
    }
    public boolean purchaseGame(int playerId, int gameId) {
        if (getOwnedGames(playerId).contains(gameId)) { // Shouldn't happen with the button, but just in case
            System.out.println("Player already owns this game.");
            return false;
        }

        String query = "INSERT INTO PlayerGames (PlayerID, GameID, PurchaseDate) VALUES (?, ?, NOW());";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, playerId);
            stmt.setInt(2, gameId);

            int result = stmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println("Error purchasing game: " + e.getMessage());
            return false;
        }
    }
    public List<String> getOwnedGamesTitles(int playerId) {
        List<String> ownedGames = new ArrayList<>();
        String query = "SELECT g.Title FROM Game g JOIN PlayerGames pg ON g.GameID = pg.GameID WHERE pg.PlayerID = ?;";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, playerId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ownedGames.add(rs.getString("Title"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving owned games: " + e.getMessage());
        }
        return ownedGames;
    }
    public int getGameIdByTitle(String gameTitle) {
    String query = "SELECT GameID FROM Game WHERE Title = ?;";
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        stmt.setString(1, gameTitle);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("GameID");
            }
        }
    } catch (SQLException e) {
        System.out.println("Error retrieving gameID for title '" + gameTitle + "': " + e.getMessage());
    }
    return -1;  // Return -1 if gameID is not found or an error occurs
}
    public boolean installGame(int playerId, int gameId) {
    String query = "UPDATE PlayerGames SET IsInstalled = TRUE WHERE PlayerID = ? AND GameID = ?;";
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        stmt.setInt(1, playerId);
        stmt.setInt(2, gameId);
        int rowsAffected = stmt.executeUpdate();
        return rowsAffected > 0;
    } catch (SQLException e) {
        System.out.println("Error installing game: " + e.getMessage());
        return false;
    }
}
    public boolean uninstallGame(int playerId, int gameId) {
    String query = "UPDATE PlayerGames SET IsInstalled = FALSE WHERE PlayerID = ? AND GameID = ?;";
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        stmt.setInt(1, playerId);
        stmt.setInt(2, gameId);
        int rowsAffected = stmt.executeUpdate();
        return rowsAffected > 0;
    } catch (SQLException e) {
        System.out.println("Error uninstalling game: " + e.getMessage());
        return false;
    }
}
    public Map<String, Boolean> getInstallationStatus(int playerId, int gameId) {
    Map<String, Boolean> status = new HashMap<>();
    String query = "SELECT IsInstalled FROM PlayerGames WHERE PlayerID = ? AND GameID = ?;";
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        stmt.setInt(1, playerId);
        stmt.setInt(2, gameId);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                status.put("IsInstalled", rs.getBoolean("IsInstalled"));
            } else {
                status.put("IsInstalled", false); // Default to false if no record is found
            }
        }
    } catch (SQLException e) {
        System.out.println("Error retrieving installation status: " + e.getMessage());
    }
    return status;
}
    
    public boolean refundGame(int playerId, int gameId) {
    if (!isRefundable(playerId, gameId)){
        return false;
    }

    // Process the refund
    String query = "DELETE FROM PlayerGames WHERE PlayerID = ? AND GameID = ?";
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        stmt.setInt(1, playerId);
        stmt.setInt(2, gameId);
        int affectedRows = stmt.executeUpdate();
        return affectedRows > 0;
    } catch (SQLException e) {
        System.out.println("Error processing refund: " + e.getMessage());
        return false;
    }
}
    
    public boolean isRefundable(int playerId, int gameId) {
    String query = "SELECT PurchaseDate FROM PlayerGames WHERE PlayerID = ? AND GameID = ?";
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        stmt.setInt(1, playerId);
        stmt.setInt(2, gameId);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            Timestamp purchaseDate = rs.getTimestamp("PurchaseDate");
            long purchaseTime = purchaseDate.getTime();
            long currentTime = System.currentTimeMillis();
            long elapsedHours = (currentTime - purchaseTime) / (1000 * 60 * 60);
            return elapsedHours <= 336; // 14 days in hours
        }
    } catch (SQLException e) {
        System.out.println("Error checking refund eligibility: " + e.getMessage());
    }
    return false;
}

    public Map<Integer, Boolean> getInstallationStatusForUser(int userId) {
    Map<Integer, Boolean> statusMap = new HashMap<>();
    String query = "SELECT GameID, IsInstalled FROM PlayerGames WHERE PlayerID = ?";
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        stmt.setInt(1, userId);
        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                statusMap.put(rs.getInt("GameID"), rs.getBoolean("IsInstalled"));
            }
        }
    } catch (SQLException e) {
        System.out.println("Error retrieving installation status: " + e.getMessage());
    }
    return statusMap;
}




}
