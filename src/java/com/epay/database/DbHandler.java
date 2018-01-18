package com.epay.database;

import java.sql.*;

public class DbHandler {

    //USE THIS OBJECT TO INIT CONNECTION PARAMS
    Connection conn = null;
    //USE THIS OBJECT TO EXECUTE SQL QUERIES
    Statement stm = null;
    //USE THIS OBJECT TO READ SELECTED DATA
    public ResultSet rslt = null;

    public void connect() {
        try {
            //LOAD THE DRIVER INTO MEMORY
            Class.forName("com.mysql.jdbc.Driver");
            //INIT CONNECTION STRING
            conn = DriverManager.getConnection("jdbc:mysql://localhost/epay", "root", "");
            stm = conn.createStatement();
        } catch (Exception e) {
            System.out.println("Error while connecting to Database : " + e.getMessage());
        }
    }
    
    public void execute(String sql){
        try {
            connect();
            stm.execute(sql);
        } catch (Exception e) {
            System.out.println("Error while executing query : " + e.getMessage());
        }
    }
    
    public void select(String sql){
        try {
            connect();
            rslt = stm.executeQuery(sql);
        } catch (Exception e) {
            System.out.println("Error while selecting data : " + e.getMessage());
        }
    }

}
