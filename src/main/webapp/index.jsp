<%-- 
    Document   : index
    Created on : 1 Ara 2023, 02:02:37
    Author     : iscie
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mycompany.web.programming.project.Categories"%>
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
        
        <!-- CATEGORIES NAV -->
        <nav>
            <div>
              <a href="?search=&sort=">
                Tüm Ürünler
              </a>
            </div>
        <%
            String val = "";
            if(request.getParameter("search") != null) val = request.getParameter("search");
            
            String sortOption = request.getParameter("sort");
            
            String sqlKategori = "SELECT * FROM kategoriler ORDER BY urunKategori_ad";
            try (ResultSet resultCat = DBOperations.executeQuery(sqlKategori)) {
                List<Categories> categoryResults = new ArrayList<>();
                while (resultCat.next()) {
                    Categories category = new Categories();
                    category.setCategoryId(resultCat.getInt("urunKategori_id"));
                    category.setCategoryName(resultCat.getString("urunKategori_ad"));
                    categoryResults.add(category);
                }
                
                for (Categories category : categoryResults) {
        %>
          <div>
              <a href="?category=<%out.print(category.getCategoryId());%>&search=<%out.print(val);%>&sort=<%out.print(sortOption);%>">
              <%out.print(category.getCategoryName());%>
            </a>
          </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        </nav>
        
        <!-- SEARCH NAV -->
        <div class="search-productDiv">
            <div class="searchBar">
                <form class="form-select" method="get">
                    
                    <!-- Search OPTION -->
                    <div class="search">
                        <div class="search-bar">
                            <input class="searchText" type="text" name="search" value="<%out.print(val);%>"/>
                            <input class="searchBut" type="submit" value="ARA"/>
                        </div>
                        
                        <!-- Sorting OPTION -->
                        <div class="sorting-options">
                            <select class="searchText" name="sort">
                                <option value="" disabled selected>Sırala</option>
                                <option value="AZ" <%= "AZ".equals(sortOption) ? "selected" : "" %>>A-Z</option>
                                <option value="ZA" <%= "ZA".equals(sortOption) ? "selected" : "" %>>Z-A</option>
                                <option value="priceAsc" <%= "priceAsc".equals(sortOption) ? "selected" : "" %>>Fiyat Artan</option>
                                <option value="priceDesc" <%= "priceDesc".equals(sortOption) ? "selected" : "" %>>Fiyat Azalan</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
                            
        <!-- Product page -->
        <div class="productDiv">
        <%
            List<Product> searchResults = new ArrayList<>();
            
            int urunlerPerPage = 8;
            int currentPage = 1;
                        
            String pageParam = request.getParameter("page");
            String searchKeyword = request.getParameter("search");
            String categoryKeyword = request.getParameter("category");
            
            if (pageParam != null && !pageParam.isEmpty()) {
                currentPage = Integer.parseInt(pageParam);
            }
                        
            String colmnSort = "urunIsim";
            if ("ZA".equals(sortOption)) {
                colmnSort = "urunIsim DESC";
            } else if ("priceAsc".equals(sortOption)) {
                colmnSort = "urunFiyat ASC";
            } else if ("priceDesc".equals(sortOption)) {
                colmnSort = "urunFiyat DESC";
            }
            
            String sql = "";
            int startIndex = (currentPage - 1) * urunlerPerPage;
            if (searchKeyword != null && !searchKeyword.isEmpty())
                sql = "SELECT * FROM urunler WHERE urunIsim LIKE '" + searchKeyword + "%' ORDER BY " + colmnSort + " LIMIT " + startIndex + "," + urunlerPerPage;
            else if (categoryKeyword != null && !categoryKeyword.isEmpty())
                sql = "SELECT u.*" +
                            "FROM urunler u " +
                            "LEFT JOIN kategoriler k ON u.urunKategori_id = k.urunKategori_id " +
                            "WHERE k.urunKategori_id = '" + categoryKeyword + "'" + " LIMIT " + startIndex + "," + urunlerPerPage;
            else
                sql = "SELECT * FROM urunler ORDER BY " + colmnSort + " LIMIT " + startIndex + "," + urunlerPerPage;
            
            try (ResultSet result = DBOperations.executeQuery(sql)) {
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
        <%@include file="components/urunBox.jsp"%>
        <%
                }
            } catch (SQLException c) {
                String hataMesaji = c.getMessage();
                out.println("SQLException Hatası: " + hataMesaji);
            }
        %>
        </div>
        
        <!-- PAGINATION -->
        <div class="pagination">
        <%
            int totalProduct = 0;
            if (categoryKeyword != null && !categoryKeyword.isEmpty()) totalProduct = DBOperations.getTotalCategoryProduct(sql);
            else totalProduct = DBOperations.getTotalQueryProduct(sql);
             
            int totalPage = (int) Math.ceil((double) totalProduct / urunlerPerPage);

            if (currentPage > 1) {
                if (sortOption != null && !sortOption.isEmpty()) {
                    out.println("<a href='index.jsp?page=" + (currentPage - 1) + "&sort=" + sortOption + "'>&lt;</a>");
                } else {
                    out.println("<a href='index.jsp?page=" + (currentPage - 1) + "'>&lt;</a>");
                }
            }

            for (int i = 1; i <= totalPage; i++) {
                if (sortOption != null && !sortOption.isEmpty()) {
                    if (i == currentPage) {
                        out.println("<div class='aktif'>" + i + "</div>");
                    } else {
                        out.println("<a href='index.jsp?page=" + i + "&sort=" + sortOption + "'>" + i + "</a>");
                    }
                } else {
                    if (i == currentPage) {
                        out.println("<div class='aktif'>" + i + "</div>");
                    } else {
                        out.println("<a href='index.jsp?page=" + i + "'>" + i + "</a>");
                    }
                }
            }

            if (currentPage < totalPage) {
                if (sortOption != null && !sortOption.isEmpty()) {
                    out.println("<a href='index.jsp?page=" + (currentPage + 1) + "&sort=" + sortOption + "'>&gt;</a>");
                } else {
                    out.println("<a href='index.jsp?page=" + (currentPage + 1) + "'>&gt;</a>");
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
