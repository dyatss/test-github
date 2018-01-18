<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>SEND POST DATA</h1>
        <form action="getData.jsp" method="post">
            <input type="text" placeholder="Email" name="email" />
            <input type="password" placeholder="password" name="password" />
            <input type="submit" value="Send" />
        </form>
        <h1>SEND GET DATA</h1>
        <form action="getData.jsp" method="get">
            <input type="text" placeholder="Email" name="email" />
            <input type="password" placeholder="password" name="password" />
            <input type="submit" value="Send" />
        </form>
        <h1>SEND GET DATA</h1>
        <a href="getData.jsp?email=test@test.com&password=123456">Send data</a>
    </body>
</html>
