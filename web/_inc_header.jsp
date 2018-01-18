<%@page import="com.epay.entities.Product"%>
<div id="header">
    <div class="container">
        <div id="logo">
            <a href="index.jsp"><img src="images/logo.png" alt=""/></a>
            <a href="index.jsp"><img src="images/logo.png" alt=""/></a>
        </div>
        <div id="nav">
            <%
                if (isConnected) {
            %>
            <a href="profile.jsp"><%= user.getUserName() %></a>
            <a href="logout.jsp">Logout</a>
            <%} else {%>
            <a href="javascript:void()" id="signinLink">Signin</a>
            <a href="javascript:void()" id="loginLink">Login</a>
            <%}%>
        </div>
        <div id="search">
            <input type="text" placeholder="Search..." />
            <input type="image" src="images/search.png" />
            <div id="searchResults">
                <div class="item">
                    <a href="">
                        <img src="images/products/p1.jpg" alt=""/>
                        <p>Product name</p>
                    </a>
                </div>
                <div class="item">
                    <a href="">
                        <img src="images/products/p1.jpg" alt=""/>
                        <p>Product name</p>
                    </a>
                </div>
                <div class="item">
                    <a href="">
                        <img src="images/products/p1.jpg" alt=""/>
                        <p>Product name</p>
                    </a>
                </div>

            </div>
        </div>
        <div id="cart">
            <a href="basket.jsp"><img src="images/cart.png" alt=""/></a>
            <span><%= Product.basketProducts.size() %></span>
        </div>
    </div>
</div>
