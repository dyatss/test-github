<%@page import="com.epay.entities.Category"%>
<div id="categories">
    <%
        /*Category category = new Category();
        out.write(category.getSideBarList());*/
    %>
    <%= new Category().getSideBarList() %>
    
</div>