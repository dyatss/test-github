<%@page import="com.epay.entities.Product"%>
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
            <div id="products">
                <%= new Product().getLastProducts() %>
                
                <!--<div class="product">
                    <%
                        float f = 150;
                    %>
                    <h1><%= String.format("%.2f", f) %> MAD</h1>
                    <img src="images/products/p1.jpg" />
                    <p>Name</p>
                    <a href="#" class="btn1">Details</a>
                    <a href="#" class="btn2">Add to basket</a>
                </div>
                <div class="product">
                    <h1>000.00 MAD</h1>
                    <img src="images/products/p2.jpg" />
                    <p>Name</p>
                    <a href="#" class="btn1">Details</a>
                    <a href="#" class="btn2">Add to basket</a>
                </div>
                <div class="product">
                    <h1>000.00 MAD</h1>
                    <img src="images/products/p2.jpg" />
                    <p>Name</p>
                    <a href="#" class="btn1">Details</a>
                    <a href="#" class="btn2">Add to basket</a>
                </div>
                <div class="product">
                    <h1>000.00 MAD</h1>
                    <img src="images/products/p2.jpg" />
                    <p>Name</p>
                    <a href="#" class="btn1">Details</a>
                    <a href="#" class="btn2">Add to basket</a>
                </div>-->
            </div>
        </div>
        <%@include file="_inc_footer.jsp" %> 
        <%@include file="_inc_popup.jsp" %>
        <%@include file="_inc_js.jsp" %>
    </body>
</html>