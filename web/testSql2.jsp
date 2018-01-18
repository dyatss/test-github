<%@page import="com.epay.database.dbHandler"%>
<%
    dbHandler db = new dbHandler();
    //db.execute("INSERT INTO users VALUES(NULL, 'Leonardo DAVINCI', 'leo@supinfo.com', '123456')");
    db.select("SELECT * FROM users");
    while ( db.rslt.next() ){
        out.write( db.rslt.getInt("userId") +", "+ db.rslt.getString("userName") +"<br>" );
    }
%>