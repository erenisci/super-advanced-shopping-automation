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
        <span class="login">LOGIN</span>
        <span class="register">REGISTER</span>
      </div>
    </header>

    <!-- CONTENT -->
    <main>
      <nav>NAV</nav>
      <div class="search-productDiv">
        <!-- Search Bar -->
        <div class="searchBar">SEARCH</div>
        <!-- Product page -->
        <div class="productDiv">
        <%
            int urunlerPerPage = 8;
            int currentPage = 1;

            String pageParam = request.getParameter("page");
            if (pageParam != null && !pageParam.isEmpty()) {
                currentPage = Integer.parseInt(pageParam);
            }

            try {
                int startIndex = (currentPage - 1) * urunlerPerPage;

                String sql = "SELECT * FROM urunler LIMIT " + startIndex + "," + urunlerPerPage;
                try (ResultSet sonucKumesi = DBOperations.executeQuery(sql)) {
                    List<Product> productList = new ArrayList<>();

                    while (sonucKumesi.next()) {
                        Product urun = new Product();
                        urun.setUrunIsim(sonucKumesi.getString("urunIsim"));
                        urun.setUrunUrl(sonucKumesi.getString("urunUrl"));
                        urun.setUrunFiyat(sonucKumesi.getString("urunFiyat"));
                        urun.setUrunStok(sonucKumesi.getInt("urunStok"));
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
            for (int i = 1; i <= totalPage; i++) {
                if (i == currentPage) {
                    out.println("<div class='aktif'>" + i + "</div>");
                } else {
                    out.println("<a href='index.jsp?page=" + i + "'>" + i + "</a>");
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
