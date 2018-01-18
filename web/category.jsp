<%@page import="com.epay.entities.Product"%>
<%
    int categoryId = Integer.parseInt( request.getParameter("id") ); 
    Category category = new Category();
    category.setCategoryId(categoryId);
    category.getCategoryInfos();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>ePay - Latest pubs</title>
        <%@include file="_inc_head.jsp" %>
    </head>
    <body>
        <%@include file="_inc_header.jsp" %>  
        <h2 style="width:1200px; margin: auto; padding-top: 30px;"><%= category.getCategoryName() %></h2>
        <div id="content">
            <%@include file="_inc_categories.jsp" %>
            <div id="products">
                
                <%= new Product().getCategoryProducts(categoryId) %>
            </div>
        </div>
        <%@include file="_inc_footer.jsp" %> 
        <%@include file="_inc_popup.jsp" %>
        <%@include file="_inc_js.jsp" %>
    </body>
</html>