package com.epay.entities;

import com.epay.database.DbHandler;

public class User {

    private int userId;
    private String userName;
    private String userMail;
    private String userPassword;
    DbHandler db = new DbHandler();
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public String getUserName() {
        return userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    public String getUserMail() {
        return userMail;
    }
    
    public void setUserMail(String userMail) {
        this.userMail = userMail;
    }
    
    public String getUserPassword() {
        return userPassword;
    }
    
    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }
    
    public User(int userId, String userName, String userMail, String userPassword) {
        this.userId = userId;
        this.userName = userName;
        this.userMail = userMail;
        this.userPassword = userPassword;
    }
    
    public User() {
    }

    public User(String userMail, String userPassword) {
        this.userMail = userMail;
        this.userPassword = userPassword;
    }
    
    public boolean login() {
        boolean isExists = false;
        try {
            db.select("SELECT COUNT(*), users.* from users WHERE userMail = '" + getUserMail() + "' AND userPassword = '" + getUserPassword() + "'");
            db.rslt.next();
            if (db.rslt.getInt("COUNT(*)") == 1) {
                isExists = true;
                setUserId(db.rslt.getInt("userId"));
                setUserName(db.rslt.getString("userName"));
            }
        } catch (Exception e) {
            System.out.println("Error while login : " + e.getMessage());
        }
        return isExists;
    }
    
    public void updatePersonalInfos(){
        try {
            db.execute("UPDATE users SET userName = '"+ getUserName() +"' WHERE userId = " + getUserId());
        } catch (Exception e) {
            System.out.println("Error while updating personal infos : " + e.getMessage());
        }
    }
    
    public void updateSecurityInfos(){
        try {
            db.execute("UPDATE users SET userPassword = '"+ getUserPassword() +"' WHERE userId = " + getUserId());
        } catch (Exception e) {
            System.out.println("Error while updating security infos : " + e.getMessage());
        }
    }
    
}
