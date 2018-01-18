<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 id="test">Hello World!</h1>
        <input type="button" id="testbtn" onclick="" />
        <%
            //CODE JAVA
            String testVar = "Hello world from java";
            out.write("<h1>Hello from java</h1>");
            out.write("<h1>" + testVar + "</h1>");
            
            int x = 0;
            if (x == 0) {
                out.write("Test");
            }
            String newVar = "This is a test";
        %>
        <h1>Show value : <%= newVar%></h1>
        <h1>Show value : <% out.write(newVar);%></h1>
        <%!
            public String sayHello() {
                return "Hello from java function";
            }
        %>
        <%-- --%>
        <!-- -->
        <h1>Test function : <%= sayHello()%></h1>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script>
            $("#testbtn").click(function(){
               $.get("change.jsp", "", function(data){
                   $("#test").html(data);
               });
            });
        </script>
    </body>
</html>
