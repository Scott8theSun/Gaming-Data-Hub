/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group2project.gamingplatformgui;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
/**
 * MainApplication class containing main method.
 *
 * The purpose of this program is to provide a
 * front end UI leveraging Java Swing for access
 * to a backend SQL database designed to store
 * Gaming Platform data.
 *
 * Metropolitan State University
 * ICS 311 Database Managment Systems
 * Kenji
 *
 * @author Group 2
 *
 */
public class MainApplication {

    public static void main(String[] args) {
        PasswordUtilities.getInstance();
        SQLConnection.getInstance();

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new LoginPage().setVisible(true);
            }
        });
    }
}

