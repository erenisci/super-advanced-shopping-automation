<%-- 
    Document   : cart
    Created on : 14 Ara 2023, 15:41:23
    Author     : iscie
--%>

<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.mycompany.web.programming.project.CartItem"%>
<%@page import="com.mycompany.web.programming.project.UserBean"%>
<%@page import="com.mycompany.web.programming.project.DBConnection"%>
<%@page import="com.mycompany.web.programming.project.DBOperations"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    UserBean userBean = (UserBean) session.getAttribute("userBean");
    String sessionIdFromCookie = "";

    if (userBean == null) {
        UserBean userBeanTemp = new UserBean();
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("userSessId".equals(cookie.getName())) {
                    sessionIdFromCookie = cookie.getValue();

                    userBeanTemp.setUserId(DBOperations.getUserIdFromSess(sessionIdFromCookie));
                    userBeanTemp.setUserNick(DBOperations.getUserNickFromSess(sessionIdFromCookie));

                    session.setAttribute("userBean", userBeanTemp);
                    break;
                }
            }
        }
    }

    userBean = (UserBean) session.getAttribute("userBean");
    boolean isLoggedIn = (userBean != null && userBean.getUserId() != 0) || !sessionIdFromCookie.equals("");

    if (isLoggedIn) {
        if (request.getParameter("deleted") != null && request.getParameter("deleted").equals("true")) {
%><script>alert("Ürün sepetten başarıyla kaldırıldı!");</script><%
                }
                if (request.getParameter("update") != null && request.getParameter("update").equals("true")) {
%><script>alert("Ürün başarıyla güncellendi!");</script><%
                }
                if (request.getParameter("isOk") != null && request.getParameter("isOk").equals("false")) {
%><script>alert("Satın alım başarısız!");</script><%
                }
                if (request.getParameter("update") != null && request.getParameter("update").equals("false")) {
%><script>alert("Ürün güncellenmedi!");</script><%
                }
%>
<!DOCTYPE html>
<html>
    <head>
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
        href="css/cart.css"
        />
    <link
        rel="stylesheet"
        href="css/general.css"
        />
    <title>Login</title>
</head>
<body>
<div class="logoDivs"><a class="logo" href="index.jsp"><img class="imgLogo" src="logo/f8f8f8.png" alt="Site logosu"/></a></div>
<div class='allflex'>
    <div class="turnback">
        <a class="turn" href="index.jsp">
            Ana Sayfaya Dön
        </a>
    </div>
    <div class='rowflex'>
        <div class="profile-cont">
            <div class="left-col">
                <%
                    int count = DBOperations.getTotalSepet(userBean.getUserId());
                    double total = 0.0;
                    if (count != 0) {
                        List<CartItem> products = new ArrayList<>();

                        try (Connection connection = DBConnection.getConnection();
                                Statement statement = connection.createStatement();) {
                            String query = "SELECT s.*, u.urunStok "
                                    + "FROM sepetler s "
                                    + "JOIN urunler u ON s.urunId = u.id "
                                    + "WHERE s.kullanici_id = " + userBean.getUserId();

                            try (ResultSet resultSet = statement.executeQuery(query)) {
                                while (resultSet.next()) {
                                    CartItem urun = new CartItem();
                                    urun.setProductId(resultSet.getInt("urunId"));
                                    urun.setUserId(resultSet.getInt("kullanici_id"));
                                    String newIsim = resultSet.getString("urunIsim").substring(0, 1).toUpperCase() + resultSet.getString("urunIsim").substring(1);
                                    if (newIsim.length() > 20) {
                                        newIsim = newIsim.substring(0, 20) + "...";
                                    }
                                    urun.setProductName(newIsim);
                                    urun.setProductUrl(resultSet.getString("urunUrl"));
                                    urun.setProductPrice(resultSet.getFloat("urunFiyat"));
                                    urun.setProductQuantity(resultSet.getInt("urunAdet"));
                                    urun.setTotalStock(resultSet.getInt("urunStok"));
                                    products.add(urun);
                                }
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        for (CartItem product : products) {
                            total += product.getProductQuantity() * product.getProductPrice();
                                        %>
                <%@include file="components/cartBox.jsp"%>
                <%
                    }
                } else {
                %>
                <p class="empty">Sepetiniz boş...</p>
                <%
                    }
                %>
            </div>
        </div>
        <div class="right-col">
            <div style="align-self: center">
                <p class="detay">Sepet Detay</p>
            </div>
            <div>
                <%
                    double miktar = total;
                    DecimalFormat decimalFormat = new DecimalFormat("#,##0.0");
                    String miktarFormatted = decimalFormat.format(miktar);
                %>
                <p class="tutar">Ödenecek tutar: <span id="totalAmount" class="fiyatSepet"><%out.print(miktarFormatted);%></span><span class="tl"> TL</span></p>
            </div>
            <form method="post" action="payment.jsp?payment=true">
                <input type="hidden" name="toplam_tutar" value="<%out.print(total);%>"/>
                <button class="satinAl <%if (count == 0)
                                        out.print("dis");%>">Satın Al</button>
            </form>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
<%
} else {
%>
<%@include file="goToLogin.jsp"%>
<%
    }
%>