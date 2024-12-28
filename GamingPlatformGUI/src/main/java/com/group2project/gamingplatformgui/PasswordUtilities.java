package com.group2project.gamingplatformgui;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *  Singleton Class representing password handling
 *  and authentication.
 */

public class PasswordUtilities {

    // Single instance of the class
    private static PasswordUtilities instance;

    // Private constructor to prevent instantiation
    private PasswordUtilities() {}

    // Public method to get the instance of the class
    public static synchronized PasswordUtilities getInstance() {
        if (instance == null) {
            instance = new PasswordUtilities();
        }
        return instance;
    }
    /**
     * Method that hashes a string. This is unused due to passwords
     * being stored in plain-text in the sql database.
     * @param stringToHash
     * @return String hashedString
     */
    public String hashString(String stringToHash) {
        String hashedString = "";
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(stringToHash.getBytes());

            // Convert the byte array to a hexadecimal string
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashedBytes) {
                hexString.append(String.format("%02x", b));
            }
            hashedString = hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return hashedString;
    }
    /**
     * This Method compares two strings and returns true if they
     * are equal and false if they are not.
     * @param password1
     * @param password2
     * @return Boolean
     */
    public boolean comparePass(String password1, String password2){
        return password1.equals(password2);
    }
}
