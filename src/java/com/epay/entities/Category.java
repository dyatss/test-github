package com.epay.entities;

import com.epay.database.DbHandler;
import java.util.ArrayList;

public class Category {

    private int categoryId;
    private String categoryName;
    private int categoryParent;
    DbHandler db = new DbHandler();

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getCategoryParent() {
        return categoryParent;
    }

    public void setCategoryParent(int categoryParent) {
        this.categoryParent = categoryParent;
    }

    public Category(int categoryId, String categoryName, int categoryParent) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.categoryParent = categoryParent;
    }

    public Category() {
    }
    
    public void getCategoryInfos(){
        try {
            db.select("SELECT * FROM category WHERE categoryId = " + getCategoryId());
            db.rslt.next();
            setCategoryName( db.rslt.getString("categoryName"));
            setCategoryParent( db.rslt.getInt("categoryParent"));
        } catch (Exception e) {
        }
    }

    public String getSideBarList() {
        String list = "";
        try {
            //METHOD 1
            /*db.select("SELECT * FROM category WHERE categoryParent = -1");
            while ( db.rslt.next() ){
                list += "<a href=''>"+ db.rslt.getString("categoryName") +"</a>";
                list += "<ul>";
                DbHandler db2 = new DbHandler();
                db2.select("SELECT * FROM category WHERE categoryParent = " + db.rslt.getInt("categoryId"));
                while( db2.rslt.next()){
                    list += "<li><a href=\"\" class=\"subcategory\">"+ db2.rslt.getString("categoryName") +"</a></li>";
                }
                list += "</ul>";
            }*/

            //METHOD 2
            ArrayList<Category> categories = new ArrayList<Category>();
            db.select("SELECT * FROM category");
            while (db.rslt.next()) {
                categories.add(new Category(db.rslt.getInt("categoryId"), db.rslt.getString("categoryName"), db.rslt.getInt("categoryParent")));
            }

            for (Category c : categories) {
                if (c.getCategoryParent() == -1) {
                    list += "<a href=''>" + c.categoryName + "</a>";
                    list += "<ul>";
                    for(Category c2 : categories ){
                        if ( c2.getCategoryParent() == c.getCategoryId() )
                            list += "<li><a href='category.jsp?id="+ c2.getCategoryId() +"' class=\"subcategory\">"+ c2.getCategoryName() +"</a></li>";
                    }
                    list += "</ul>";
                }
            }

        } catch (Exception e) {
            System.out.println("Error while listing categories : " + e.getMessage());
        }
        return list;
    }

}
