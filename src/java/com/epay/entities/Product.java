package com.epay.entities;

import com.epay.database.DbHandler;
import java.util.ArrayList;

public class Product {

    private int productId;
    private String productName;
    private String productDescription;
    private int productCategory;
    private String productPicture;
    private float productPrice;
    DbHandler db = new DbHandler();
    public static ArrayList<Product> basketProducts = new ArrayList<Product>();

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public int getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(int productCategory) {
        this.productCategory = productCategory;
    }

    public String getProductPicture() {
        return productPicture;
    }

    public void setProductPicture(String productPicture) {
        this.productPicture = productPicture;
    }

    public float getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(float productPrice) {
        this.productPrice = productPrice;
    }

    public Product(int productId, String productName, String productDescription, int productCategory, String productPicture, float productPrice) {
        this.productId = productId;
        this.productName = productName;
        this.productDescription = productDescription;
        this.productCategory = productCategory;
        this.productPicture = productPicture;
        this.productPrice = productPrice;
    }

    public Product() {
    }

    public String getProductForm(float price, String picture, String name, int Id) {
        return "<div class=\"product\">\n"
                + "                    <h1>" + String.format("%.2f", price) + " MAD</h1>\n"
                + "                    <img src=\"images/products/" + picture + "\" />\n"
                + "                    <p>" + name + "</p>\n"
                + "                    <a href=\"product.jsp?id=" + Id + "\" class=\"btn1\">Details</a>\n"
                + "                    <a href=\"addToBasket.jsp?id=" + Id + "\" class=\"btn2\">Add to basket</a>\n"
                + "                </div>";
    }

    public String getLastProducts() {
        String data = "<h3>No products</h3>";
        try {
            //METHOD 1
            db.select("SELECT COUNT(*) FROM product");
            db.rslt.next();
            if (db.rslt.getInt("COUNT(*)") != 0) {
                data = "";
                db = new DbHandler();
                db.select("SELECT * FROM product ORDER BY productId DESC LIMIT 9");
                while (db.rslt.next()) {
                    data += getProductForm(db.rslt.getFloat("productPrice"), db.rslt.getString("productPicture"), db.rslt.getString("productName"), db.rslt.getInt("productId"));
                }
            }
        } catch (Exception e) {
            System.out.println("Error while listing products : " + e.getMessage());
        }
        return data;
    }

    public String getCategoryProducts(int categoryId) {
        String data = "<h3>No products in this category</h3>";
        try {
            //METHOD 1
            db.select("SELECT COUNT(*) FROM product WHERE productCategory = " + categoryId);
            db.rslt.next();
            if (db.rslt.getInt("COUNT(*)") != 0) {
                data = "";
                db = new DbHandler();
                db.select("SELECT * FROM product WHERE productCategory = " + categoryId);
                while (db.rslt.next()) {
                    data += getProductForm(db.rslt.getFloat("productPrice"), db.rslt.getString("productPicture"), db.rslt.getString("productName"), db.rslt.getInt("productId"));
                }
            }
        } catch (Exception e) {
            System.out.println("Error while listing products : " + e.getMessage());
        }
        return data;
    }

    public void getProductInfos() {
        try {
            db.select("SELECT * FROM product WHERE productId = " + getProductId());
            db.rslt.next();
            setProductCategory(db.rslt.getInt("productCategory"));
            setProductDescription(db.rslt.getString("productDescription"));
            setProductName(db.rslt.getString("productName"));
            setProductPicture(db.rslt.getString("productPicture"));
            setProductPrice(db.rslt.getFloat("productPrice"));
        } catch (Exception e) {
            System.out.println("Error while loading product infos : " + e.getMessage());
        }
    }

    public String getBasketProducts() {
        String data = "<h2>You have no products</h2>";
        if (!basketProducts.isEmpty()) {
            data = "<h2>You have (" + basketProducts.size() + ") products in the basket</h2>";
            for (Product product : basketProducts) {
                data += "<div class='productLine'>"
                        + "<img src='images/products/" + product.getProductPicture() + "' />"
                        + "<h4>" + product.getProductName() + "</h4>"
                        + "<a class='btn1' href='product.jsp?id=" + product.getProductId() + "'>Details</a>"
                        + "<span>" + String.format("%.2f", product.getProductPrice()) + "</span>"
                        + "<a href='deleteFromBasket.jsp?id=" + product.getProductId() + "'><img src='images/delete.png' /></a></div>";
            }
            data += "<br><br><a href='index.jsp' class='btn1' style='margin-top:30px;'>Add more articles</a>";
        }

        return data;
    }

    public String getBasketTotalPrice(boolean isConnected) {
        String data = "";
        if (!basketProducts.isEmpty()) {
            float total = 0;
            for (Product product : basketProducts) {
                total += product.getProductPrice();
            }
            data += "<h4>Total : " + String.format("%.2f", total) + " MAD</h4>";
            if (isConnected) {
                data += "<a href=''>Proceed to payment</a>";
            } else {
                data += "<p style='color:red'>You are not connected</p>";
            }
        }
        return data;
    }

    public void addProductToBasket() {
        boolean ifExists = false;
        for (Product product : basketProducts) {
            if (product.getProductId() == this.getProductId()) {
                ifExists = true;
            }
        }
        if (!ifExists) {
            basketProducts.add(this);
        }
    }
    
    public void deleteProductFromBasket(){
        for (Product product : basketProducts) {
            if (product.getProductId() == this.getProductId()) {
                basketProducts.remove(product);
                break;
            }
        }
    }

}
