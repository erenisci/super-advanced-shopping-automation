<%-- 
    Document   : payment
    Created on : 16 Ara 2023, 15:41:07
    Author     : iscie
--%>

<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mycompany.web.programming.project.CartItem"%>
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
        if (request.getParameter("payment") != null && request.getParameter("payment").equals("true")) {

            // PRODUCT SET
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
                        if (newIsim.length() > 12) {
                            newIsim = newIsim.substring(0, 12) + "...";
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

            // SIPARISLER UPDATE
            for (CartItem product : products) {
                String query = "INSERT INTO siparisler (kullanici_id, siparisIsim, siparisUrl, siparisFiyat, siparisAdet) VALUES (?, ?, ?, ?, ?)";
                try (Connection connection = DBConnection.getConnection();
                        PreparedStatement preparedStatement = connection.prepareStatement(query);) {

                    preparedStatement.setInt(1, product.getUserId());
                    preparedStatement.setString(2, product.getProductName());
                    preparedStatement.setString(3, product.getProductUrl());
                    preparedStatement.setBigDecimal(4, new BigDecimal(product.getProductPrice()));
                    preparedStatement.setInt(5, product.getProductQuantity());

                    preparedStatement.executeUpdate();

                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            // SEPETLER DELETE
            for (CartItem product : products) {
                String query = "DELETE FROM sepetler WHERE urunId = ?";
                try (Connection connection = DBConnection.getConnection();
                        PreparedStatement preparedStatement = connection.prepareStatement(query);) {

                    preparedStatement.setInt(1, product.getProductId());

                    preparedStatement.executeUpdate();

                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            // URUNLER UPDATE
            for (CartItem product : products) {
                String query = "UPDATE urunler SET urunStok = ? WHERE id = ?";
                try (Connection connection = DBConnection.getConnection();
                        PreparedStatement preparedStatement = connection.prepareStatement(query);) {

                    preparedStatement.setInt(1, product.getTotalStock() - product.getProductQuantity());
                    preparedStatement.setInt(2, product.getProductId());

                    preparedStatement.executeUpdate();

                } catch (SQLException e) {
                    e.printStackTrace();
                }

                if (product.getTotalStock() - product.getProductQuantity() == 0) {
                    String deleteQuery = "DELETE FROM urunler WHERE id = ?";
                    try (Connection connection = DBConnection.getConnection();
                            PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery);) {

                        preparedStatement.setInt(1, product.getProductId());

                        preparedStatement.executeUpdate();
                    }
                }
            }

            response.sendRedirect("profile.jsp?link=myOrders&order=complete");
        }
        if (request.getParameter("payment") != null && request.getParameter("payment").equals("false")) {
            response.sendRedirect("cart.jsp?isOk=false");
        }
    } else {
%>
<%@include file="goToLogin.jsp"%>
<%
    }
%>