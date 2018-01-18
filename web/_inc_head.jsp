<%@page import="com.epay.entities.User"%>
<%
    boolean isConnected = false;
    if (session.getAttribute("isConnected") != null) {
        isConnected = true;
    }
    
    User user = new User();
    user = (User) session.getAttribute("user");
    
%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/general.css" rel="stylesheet" type="text/css"/>
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">