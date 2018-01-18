<%@page import="com.epay.entities.User"%>
<%
    User user = new User();
    user = (User) session.getAttribute("user");
    user.setUserName(request.getParameter("name"));
    user.updatePersonalInfos();
    response.sendRedirect("profile.jsp");
%>