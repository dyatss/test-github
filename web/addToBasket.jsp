<%@page import="com.epay.entities.Product"%>
<%
  
int productId = Integer.parseInt( request.getParameter("id") );
Product product = new Product();
product.setProductId(productId);
product.getProductInfos();
product.addProductToBasket();
response.sendRedirect("basket.jsp");

%>