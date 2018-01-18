<%@page import="com.epay.entities.Product"%>
<%
    int productId = Integer.parseInt( request.getParameter("id") ); 
    Product product = new Product();
    product.setProductId( productId );
    product.getProductInfos();
    
    Category category = new Category();
    category.setCategoryId( product.getProductCategory() );
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
        
        <div id="content">
            <%@include file="_inc_categories.jsp" %>
            <div id="productDetails">
                <h2 style="display:block; border-bottom: 1px solid #eee; padding-bottom: 20px;">
                    <a href="index.jsp">Home</a> / <a href="category.jsp?id=<%= category.getCategoryId() %>"><%= category.getCategoryName() %></a> / <%= product.getProductName() %>
                </h2>
                <img src="images/products/<%= product.getProductPicture() %>" />
                <h1><%= product.getProductName() %></h1>
                <h3><%= String.format("%.2f", product.getProductPrice()) %> MAD</h3>
                <p><%= product.getProductDescription() %></p>
                <a href="addToBasket.jsp?id=<%= productId %>" class="btn1">Add to basket</a>
            </div>
        </div>
        <%@include file="_inc_footer.jsp" %> 
        <%@include file="_inc_popup.jsp" %>
        <%@include file="_inc_js.jsp" %>
    </body>
</html>