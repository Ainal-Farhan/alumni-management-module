/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ainal farhan
 */
public class Database {

//    final static String DATABASE_URL = "jdbc:mysql://localhost:3307/alumni_module-db?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false";
    final static  String DATABASE_URL = "jdbc:mysql://johnny.heliohost.org:3306/ainalfa_alumni_module-db?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false";
    private static Connection con = null;

    public Database() throws SQLException, ClassNotFoundException {
        if (Database.con == null) {
            setConnection();
        }
    }

    public Connection getCon() {
        return Database.con;
    }

    public static void setConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
//        Database.con = DriverManager.getConnection(DATABASE_URL, "root", "");

        Database.con = DriverManager.getConnection(DATABASE_URL, "ainalfa_ainal2", "ainal2@123");
    }
}
