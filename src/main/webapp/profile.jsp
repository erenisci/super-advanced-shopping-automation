<%-- 
    Document   : profile
    Created on : 10 Ara 2023, 04:22:14
    Author     : iscie
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mycompany.web.programming.project.UserBean"%>
<%@page import="com.mycompany.web.programming.project.DBConnection"%>
<%@page import="com.mycompany.web.programming.project.DBOperations"%>
<%@page import="com.mycompany.web.programming.project.Product"%>
<%@page import="com.mycompany.web.programming.project.Orders"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <%
            String myForm = request.getParameter("link");
            UserBean userBean = (UserBean) session.getAttribute("userBean");
            boolean isLoggedIn = (userBean != null && userBean.getUserId() != 0);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
          href="css/profile.css"
        />
        <link
          rel="stylesheet"
          href="css/general.css"
        />
        <link
          rel="stylesheet"
          href="css/component-css/<%out.print(myForm);%>.css"
        />
        <title>Profile</title>
    </head>
    <%
        if (isLoggedIn) {
    %>
    <body>
        <p class="logo-p"><a class="logo" href="index.jsp">LOGO</a></p>
        <div class="profile-cont">
            <div class="left-col">
                <div>
                    <div class=
                        "<%
                           if (myForm.equals("profile")) out.print("div-myLink-active");
                           else out.print("div-mylink");
                        %>"
                        ><a class=
                            "<%
                                if (myForm.equals("profile")) out.print("myLinks-active");
                                else out.print("myLinks");
                            %>"
                            href="profile.jsp?link=profile">Profil</a></div>
                    <div class=
                        "<%
                            if (myForm.equals("addProduct")) out.print("div-myLink-active");
                            else out.print("div-mylink");
                        %>"
                        ><a class=
                            "<%
                                if (myForm.equals("addProduct")) out.print("myLinks-active");
                                else out.print("myLinks");
                            %>"
                            href="profile.jsp?link=addProduct">Ürün Ekle</a></div>
                    <div class=
                        "<%
                            if (myForm.equals("myProducts")) out.print("div-myLink-active");
                            else out.print("div-mylink");
                        %>"
                        ><a class=
                            "<%
                                 if (myForm.equals("myProducts")) out.print("myLinks-active");
                                 else out.print("myLinks");
                            %>"
                            href="profile.jsp?link=myProducts">Ürünlerim</a></div>
                    <div class=
                            "<%
                                if (myForm.equals("myOrders")) out.print("div-myLink-active");
                                else out.print("div-mylink");
                            %>"
                        ><a class=
                            "<%
                                 if (myForm.equals("myOrders")) out.print("myLinks-active");
                                 else out.print("myLinks");
                            %>"
                            href="profile.jsp?link=myOrders">Siparişlerim</a></div>
                    <div class=
                            "<%
                                if (myForm.equals("settings")) out.print("div-myLink-active");
                                else out.print("div-mylink");
                            %>"
                        ><a class=
                            "<%
                                 if (myForm.equals("settings")) out.print("myLinks-active");
                                 else out.print("myLinks");
                            %>"
                            href="profile.jsp?link=settings">Ayarlar</a>
                    </div>
                </div>
                <div>
                    <div class="div-mylink-last"><a class="myLinks-last" href="logout.jsp">Çıkış</a></div>
                </div>                        
            </div>
            <%
                if(myForm.equals("profile")) {
                    String kullaniciAdi = "";
                    String kullaniciEposta = "";
                    String kullaniciUrl = "";
                    String query = "SELECT * FROM kullanicilar WHERE urunKullanici_id = " + userBean.getUserId();
                    ResultSet resultSet = DBOperations.executeQuery(query);

                    if (resultSet.next()) {
                        kullaniciAdi = resultSet.getString("kullaniciNick");
                        kullaniciEposta = resultSet.getString("kullaniciEposta");
                        kullaniciUrl = resultSet.getString("kullaniciUrl");
                    }
            %><%@include file="components/profile.jsp"%>
            <%
                }
            %>
            <%
                if(myForm.equals("addProduct")) {
                %><%@include file="components/addProduct.jsp"%>
            <%
                }

                if(myForm.equals("myProducts")) {
                    String sql = "SELECT * FROM urunler WHERE urunKullanici_id = " + userBean.getUserId();
                    try (ResultSet result = DBOperations.executeQuery(sql)) {
                        List<Product> searchResults = new ArrayList<>();
                        while (result.next()) {
                            Product urun = new Product();
                            urun.setUrunId(result.getInt("id"));
                            urun.setUrunIsim(result.getString("urunIsim").substring(0, 1).toUpperCase() + result.getString("urunIsim").substring(1));
                            urun.setUrunUrl(result.getString("urunUrl"));
                            urun.setUrunFiyat(result.getFloat("urunFiyat"));
                            urun.setUrunStok(result.getInt("urunStok"));
                            searchResults.add(urun);
                        }
            %>
            <div class="right-col right-col-add">
            <%
                        for (Product product : searchResults) {
            %>
                            <%@include file="components/myProducts.jsp"%>
            <%
                        }
            %>
                </div>
            <%
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                if(myForm.equals("myOrders")) {
                    String sql = "SELECT * FROM siparisler";
System.out.println(sql);
                    try (ResultSet result = DBOperations.executeQuery(sql)) {
                        List<Orders> searchResults = new ArrayList<>();
                        while (result.next()) {
System.out.println(sql);
                            Orders orderDetail = new Orders();
                            orderDetail.setSiparisId(result.getInt("siparis_id"));
                            orderDetail.setKullaniciId(result.getInt("kullanici_id"));
                            orderDetail.setSiparisIsim(result.getString("siparisIsim").substring(0, 1).toUpperCase() + result.getString("siparisIsim").substring(1));
                            orderDetail.setSiparisUrl(result.getString("siparisUrl"));
                            orderDetail.setSiparisFiyat(result.getFloat("siparisFiyat"));
                            orderDetail.setSiparisAdet(result.getInt("siparisAdet"));
                            orderDetail.setSiparisTarih(result.getTimestamp("siparis_tarih"));
                            searchResults.add(orderDetail);
                        }
            %>
            <div class="right-col right-col-add">
            <%
                        for (Orders order : searchResults) {
            %>
                            <%@include file="components/myOrders.jsp"%>
            <%
                        }
            %>
                </div>
            <%
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } 
                }

                if(myForm.equals("settings")) {
                %><%@include file="components/settings.jsp"%>
            <%
                }
            %>
        </div>
        <script>
            let productNameInput = document.querySelector('.product-Name');
            let productName = productNameInput.innerHTML;
            if (productName.length > 9) {
                productName = productName.substring(0, 6) + "...";
                productNameInput.innerHTML = productName;
            }
        </script>
    </body>
    <%
        } else {
    %>
    <body>
        404 NOT FOUND EN SON İŞİM
    </body>
    <%
        }
    %>
</html>
