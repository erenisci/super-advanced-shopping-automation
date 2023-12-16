<%-- 
    Document   : index
    Created on : 1 Ara 2023, 02:02:37
    Author     : iscie
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mycompany.web.programming.project.DBConnection"%>
<%@page import="com.mycompany.web.programming.project.DBOperations"%>
<%@page import="com.mycompany.web.programming.project.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0"
    />
    <link
      rel="preconnect"
      href="https://fonts.googleapis.com"
    />
    <link
      rel="preconnect"
      href="https://fonts.gstatic.com"
      crossorigin
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="css/style.css"
    />

    <title>Index</title>
  </head>
  <body>
    <!-- Header -->
    <header>
      <p class="logo">LOGO</p>
      <div class="log-reg">
        <a href="insLogin.jsp"><span class="login">LOGIN</span></a>
        <a href="insregister.jsp"><span class="register">REGISTER</span></a>
      </div>
    </header>

    <!-- CONTENT -->
    <main>
      <nav>NAV</nav>
      <div class="search-productDiv">
        <!-- Search Bar -->
        <div class="searchBar">SEARCH
            <div class="sorting-options">
                <a href="index.jsp?page=1&sort=AZ">A-Z</a>
                <a href="index.jsp?page=1&sort=ZA">Z-A</a>
                <a href="index.jsp?page=1&sort=priceAsc">Price Ascending</a>
                <a href="index.jsp?page=1&sort=priceDesc">Price Descending</a>
            </div>
        </div>
        <!-- Product page -->
        <div class="productDiv">
        <%
            int urunlerPerPage = 8;
            int currentPage = 1;
            
            String sortOption = request.getParameter("sort");
            String pageParam = request.getParameter("page");
            
            if (pageParam != null && !pageParam.isEmpty()) {
                currentPage = Integer.parseInt(pageParam);
            }

            try {
                int startIndex = (currentPage - 1) * urunlerPerPage;
                String colmnSort = "urunIsim";
                if ("ZA".equals(sortOption)) {
                    colmnSort = "urunIsim DESC";
                } else if ("priceAsc".equals(sortOption)) {
                    colmnSort = "urunFiyat ASC";
                } else if ("priceDesc".equals(sortOption)) {
                    colmnSort = "urunFiyat DESC";
                }
                
                String sql = "SELECT * FROM urunler ORDER BY " + colmnSort + " LIMIT " + startIndex + "," + urunlerPerPage;
                try (ResultSet result = DBOperations.executeQuery(sql)) {
                    List<Product> productList = new ArrayList<>();
                    
                    while (result.next()) {
                        Product urun = new Product();
                        urun.setUrunIsim(result.getString("urunIsim"));
                        urun.setUrunUrl(result.getString("urunUrl"));
                        urun.setUrunFiyat(result.getString("urunFiyat"));
                        urun.setUrunStok(result.getInt("urunStok"));
                        productList.add(urun);
                    }

                    for (Product product : productList) {
        %>
            <div class="box">
                <div class="imgBox">
                  <img
                    class="resim"
                    src="<%out.println(product.getUrunUrl());%>"
                  />
                  <div class="stokDiv"><p class="stok">STOK: <%out.println(product.getUrunStok());%></p></div>
                </div>
                <div class="name-value">
                  <span><%out.println(product.getUrunIsim());%></span>
                  <span>
                        <%
                            String urunFiyat = product.getUrunFiyat();
                            if(urunFiyat.length() > 3) {
                                urunFiyat = urunFiyat.substring(0, urunFiyat.length() - 3) + "." + urunFiyat.substring(urunFiyat.length() - 3);
                            }
                            out.println(urunFiyat);
                        %> 
                      TL
                  </span>
                </div>
                <div class="center">
                  <button class="buyBut">SATIN AL</button>
                </div>
            </div>
        <%
                    }
        %>
        </div>        
        <%
                }
            int totalProduct = DBOperations.getTotalProduct();
            int totalPage = (int) Math.ceil((double) totalProduct / urunlerPerPage);
        %>
        <div class='pagination'>
        <%
            if (sortOption != null && !sortOption.isEmpty()){
                for (int i = 1; i <= totalPage; i++) {
                    if (i == currentPage) {
                        out.println("<div class='aktif'>" + i + "</div>");
                    } else {
                        out.println("<a href='index.jsp?page=" + i + "&sort=" + sortOption + "'>" + i + "</a>");
                    }
                }
            }
            else {
                for (int i = 1; i <= totalPage; i++) {
                    if (i == currentPage) {
                        out.println("<div class='aktif'>" + i + "</div>");
                    } else {
                        out.println("<a href='index.jsp?page=" + i + "'>" + i + "</a>");
                    }
                }
            }
            
        %>
        </div>
        <%
            } catch (SQLException c) {
                String hataMesaji = c.getMessage();
                out.println("SQLException Hatası: " + hataMesaji);
            } catch (Exception e) {
                e.printStackTrace();
                out.println(e);
            }
        %>
        </div>
      </div>
    </main>
    <!-- Footer -->
    <footer>FOOTER</footer>
  </body>
</html>
