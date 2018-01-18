<%@page import="com.epay.entities.User"%>
<%
    //GET PARAMS
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    
    User user = new User(email, password);
    
    if ( user.login() ){
        session.setAttribute("isConnected", true);
        session.setAttribute("user", user);
        out.write("ok");
        //response.sendRedirect("profile.jsp");
    }
    else{
        out.write("nok");
        //response.sendRedirect("index.jsp");
    }
%>