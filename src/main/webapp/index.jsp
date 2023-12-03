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
        <div class="searchBar">SEARCH
            <div>
                <form class="form-select" method="get">
                    <%
                        String val = "";
                        if(request.getParameter("search") != null) val = request.getParameter("search");
                    %>
                    <input type="text" name="search" value="<%out.print(val);%>"/>
                    <input type="submit" value="ARA"/>

                    <div class="sorting-options">
                        <% String sortOption = request.getParameter("sort"); %>
                        <select name="sort">
                            <option value="" disabled selected>Sırala</option>
                            <option value="AZ" <%= "AZ".equals(sortOption) ? "selected" : "" %>>A-Z</option>
                            <option value="ZA" <%= "ZA".equals(sortOption) ? "selected" : "" %>>Z-A</option>
                            <option value="priceAsc" <%= "priceAsc".equals(sortOption) ? "selected" : "" %>>Fiyat Artan</option>
                            <option value="priceDesc" <%= "priceDesc".equals(sortOption) ? "selected" : "" %>>Fiyat Azalan</option>
                        </select>
                    </div>
                </form>
                <p>
                <%
                    if (sortOption != null && !sortOption.isEmpty()) {
                        if ("AZ".equals(sortOption)) out.println("A-Z sıralama");
                        else if ("ZA".equals(sortOption)) out.println("Z-A sıralama");
                        else if ("priceAsc".equals(sortOption)) out.println("Fiyat artan sıralama");
                        else if ("priceDesc".equals(sortOption))out.println("Fiyat azalan sıralama");
                    }
                %>
                </p>
            </div>
        </div>
        <!-- Product page -->
        <div class="productDiv">
        <%
            int urunlerPerPage = 8;
            int currentPage = 1;
            
            String pageParam = request.getParameter("page");
            String searchKeyword = request.getParameter("search");
            
            if (pageParam != null && !pageParam.isEmpty()) {
                currentPage = Integer.parseInt(pageParam);
            }
            int startIndex = (currentPage - 1) * urunlerPerPage;
            String colmnSort = "urunIsim";
            if ("ZA".equals(sortOption)) {
                colmnSort = "urunIsim DESC";
            } else if ("priceAsc".equals(sortOption)) {
                colmnSort = "urunFiyat ASC";
            } else if ("priceDesc".equals(sortOption)) {
                colmnSort = "urunFiyat DESC";
            }
            
            if (searchKeyword != null && !searchKeyword.isEmpty()) {
                String searchSQL = "SELECT * FROM urunler WHERE urunIsim LIKE '" + searchKeyword + "%' ORDER BY " + colmnSort + " LIMIT " + startIndex + "," + urunlerPerPage;
                try (ResultSet result = DBOperations.executeQuery(searchSQL)) {
                    List<Product> searchResults = new ArrayList<>();

                    while (result.next()) {
                        Product urun = new Product();
                        urun.setUrunIsim(result.getString("urunIsim"));
                        urun.setUrunUrl(result.getString("urunUrl"));
                        urun.setUrunFiyat(result.getFloat("urunFiyat"));
                        urun.setUrunStok(result.getInt("urunStok"));
                        searchResults.add(urun);
                    }

                    for (Product product : searchResults) {
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
              <span><%out.println(product.getUrunFiyat());%>TL</span>
            </div>
            <div class="center">
              <button class="buyBut">SATIN AL</button>
            </div>
        </div>
        <%
                    }
                } catch (SQLException c) {
                    String hataMesaji = c.getMessage();
                    out.println("SQLException Hatası: " + hataMesaji);
                }
            } else {
                String sql = "SELECT * FROM urunler ORDER BY " + colmnSort + " LIMIT " + startIndex + "," + urunlerPerPage;
                try (ResultSet result = DBOperations.executeQuery(sql)) {
                    List<Product> productList = new ArrayList<>();

                    while (result.next()) {
                        Product urun = new Product();
                        urun.setUrunIsim(result.getString("urunIsim"));
                        urun.setUrunUrl(result.getString("urunUrl"));
                        urun.setUrunFiyat(result.getFloat("urunFiyat"));
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
                  <span><%out.println(product.getUrunFiyat());%>TL</span>
                </div>
                <div class="center">
                  <button class="buyBut">SATIN AL</button>
                </div>
            </div>
        <%
                    }
                } catch (SQLException c) {
                    String hataMesaji = c.getMessage();
                    out.println("SQLException Hatası: " + hataMesaji);
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println(e);
                }
            }
        %>
        </div>        
        <%
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
      </div>
    </main>
    <!-- Footer -->
    <footer>FOOTER</footer>
    <script>
        document.querySelector('form.form-select').addEventListener('change', function () {
            this.submit();
        });
    </script>
  </body>
</html>
