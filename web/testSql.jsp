<%@page import="java.sql.*" %>
<%
    //USE THIS OBJECT TO INIT CONNECTION PARAMS
    Connection conn = null;
    //USE THIS OBJECT TO EXECUTE SQL QUERIES
    Statement stm = null;
    //USE THIS OBJECT TO READ SELECTED DATA
    ResultSet rslt = null;
    
    //LOAD THE DRIVER INTO MEMORY
    Class.forName("com.mysql.jdbc.Driver");
    //INIT CONNECTION STRING
    conn = DriverManager.getConnection("jdbc:mysql://localhost/epay", "root", "");
    
    //PREPARE STATEMENT OBJECT
    stm = conn.createStatement();
    
    //EXECUTE : INSERT/UPDATE/DELETE
    /*stm.execute("INSERT INTO users VALUES(NULL, 'albert Einstein', 'albert@supinfo.com', '123456')");
    out.write("Done");*/
    
    //SELECT
    rslt = stm.executeQuery("SELECT * FROM users");
    
    while ( rslt.next() ){
        out.write( rslt.getInt("userId") +", "+ rslt.getString("userName")  );
    }
    
%>