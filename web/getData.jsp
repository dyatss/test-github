<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            public String getClientOs(String userAgent) {
                String os = "";
                if (userAgent.indexOf("Windows") > -1) {
                    os = "Windows";
                } else {
                    os = "Other";
                }
                return os;
            }

            public String getClientBrowser(String userAgent) {
                String os = "";
                if (userAgent.indexOf("Chrome") > -1) {
                    os = "Chrome";
                } else if (userAgent.indexOf("Gecko") > -1 ) {
                    os = "IE";
                } else {
                    os = "Other";
                }
                return os;
            }

        %>
        <%
            //GET PARAMS
            String email = request.getParameter("email");
            String password = request.getParameter("password");

        %>
        <h1>Email : <%= email%></h1>
        <h1>Password : <%= password%></h1>
        <h1>Client Os : <%= getClientOs(request.getHeader("user-agent"))%> </h1>
        <h1>Client Browser : <%= getClientBrowser(request.getHeader("user-agent"))%> </h1>
        <h1>Client IP : <%= request.getRemoteAddr() %> </h1>
        <h1>Query params : <%= request.getQueryString() %></h1>
        <h1>Server : <%= response.getHeader("Server")%> </h1>
    </body>
</html>
