<%@page import="com.epay.entities.Product"%>
<%
  Product product = new Product();
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="_inc_head.jsp" %>
        <title>Basket</title>
    </head>
    <body>
        <%@include file="_inc_header.jsp" %>  
        <div id="content">
            <div id="profile">
                <div id="basketList">
                    <%= product.getBasketProducts() %>
                </div>
                <div id="totalPrice">
                    <%= product.getBasketTotalPrice(isConnected) %>
                </div>
            </div>
        </div>
        <%@include file="_inc_footer.jsp" %> 
        <%@include file="_inc_popup.jsp" %>
        <%@include file="_inc_js.jsp" %>
    </body>
</html>