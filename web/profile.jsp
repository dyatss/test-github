<%
    if (session.getAttribute("isConnected") == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="_inc_head.jsp" %>
        <title><%= user.getUserName() %> - Profile</title>
    </head>
    <body>
        <%@include file="_inc_header.jsp" %>  
        <div id="content">
            <div id="profile">
                <div id="userInfos">
                    <h2>Personal informations</h2>
                    <form action="updatePersonalInfos.jsp" method="post">
                        <input type="text" class="input" value="<%= user.getUserName()%>" name="name" />
                        <input type="text" class="input" value="<%= user.getUserMail()%>" disabled />
                        <input type="submit" value="Update" class="btn1" />
                    </form>
                    <h2>Security informations</h2>
                    <form action="updateSecurityInfos.jsp" metho="post">
                        <input type="password" class="input" placeholder="Old password" name="opassword" required />
                        <input type="password" class="input" placeholder="New password" name="npassword" required />
                        <input type="password" class="input" placeholder="Confirmation password" name="cpassword" required />
                        <input type="submit" value="Update" class="btn1" />
                    </form>
                    <%
                        if ( request.getParameter("error") != null){
                            if ( request.getParameter("error").toString().equals("0") )
                                out.write("<p style='color:green'>Password updated</p>");
                            if ( request.getParameter("error").toString().equals("1") )
                                out.write("<p style='color:red'>Old passwrod error</p>");
                            if ( request.getParameter("error").toString().equals("2") )
                                out.write("<p style='color:red'>Confirmation passwrod error</p>");
                        }
                    %>
                </div>
                <div id="userProducts">
                    <h2>My products</h2>
                </div>
            </div>
        </div>
        <%@include file="_inc_footer.jsp" %> 
        <%@include file="_inc_popup.jsp" %>
        <%@include file="_inc_js.jsp" %>
    </body>
</html>
