<%-- 
    Document   : index
    Created on : 1 Ara 2023, 02:02:37
    Author     : iscie
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mycompany.web.programming.project.DBConnection"%>
<%@page import="com.mycompany.web.programming.project.DBOperations"%>
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
                try {
                    String sql = "SELECT * FROM urunler";
                    try (ResultSet resultSet = DBOperations.executeQuery(sql)) {
                        while (resultSet.next()) {
                            String urunIsim = resultSet.getString("urunIsim");
                            String urunUrl = resultSet.getString("urunUrl");
                            String urunFiyat = resultSet.getString("urunFiyat");
                            int urunStok = resultSet.getInt("urunStok");
                            %>
                                <div class="box">
                                    <div class="imgBox">
                                      <img
                                        class="resim"
                                        src="<%out.println(urunUrl);%>"
                                      />
                                      <div class="stokDiv"><p class="stok">STOK: <%out.println(urunStok);%></p></div>
                                    </div>
                                    <div class="name-value">
                                      <span><%out.println(urunIsim);%></span>
                                      <span>
                                            <%
                                                if(urunFiyat.length() > 3) {
                                                    urunFiyat = urunFiyat.substring(0, urunFiyat.length() - 3) + "." + urunFiyat.substring(urunFiyat.length() - 3);
                                                }
                                                out.println(urunFiyat);
                                            %> 
                                          TL</span>
                                    </div>
                                    <div class="center">
                                      <button class="buyBut">SATIN AL</button>
                                    </div>
                                </div>
                            <%
                        }
                    }
                } catch (SQLException c) {
                    String errorMessage = c.getMessage();
                    out.println("SQLException Hatası: " + errorMessage);
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println(e);
                }
            %>
        </div>

        <div class="pagination">
          <div>1</div>
          <div>2</div>
          <div>3</div>
        </div>
      </div>
    </main>

    <!-- Footer -->
    <footer>FOOTER</footer>
  </body>
</html>
