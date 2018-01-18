<%@page import="com.epay.entities.User"%>
<%
    String opass = request.getParameter("opassword");
    String npass = request.getParameter("npassword");
    String cpass = request.getParameter("cpassword");

    User user = new User();
    user = (User) session.getAttribute("user");

    if (opass.equals(user.getUserPassword())) {
        if (npass.equals(cpass)) {
            user.setUserPassword(request.getParameter("npassword"));
            user.updateSecurityInfos();
            response.sendRedirect("profile.jsp?error=0");
        } else {
            response.sendRedirect("profile.jsp?error=2");
        }
    } else {
        response.sendRedirect("profile.jsp?error=1");
    }

%>