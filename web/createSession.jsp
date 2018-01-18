<%
    //CREATE SESSIONS
    session.setAttribute("mysession", "Hello session");
%>
<%= session.getAttribute("mysession") %>