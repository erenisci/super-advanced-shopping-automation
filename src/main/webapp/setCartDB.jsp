<%-- 
    Document   : setCartDB
    Created on : 16 Ara 2023, 15:15:17
    Author     : iscie
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
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
        int stockNum = Integer.parseInt(request.getParameter("stockNum"));
        int productId = Integer.parseInt(request.getParameter("productIdUpdate"));
        try (Connection connection = DBConnection.getConnection()) {
            String updateQuery = "UPDATE sepetler SET urunAdet = ? WHERE urunId = ?";

            try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                preparedStatement.setInt(1, stockNum);
                preparedStatement.setInt(2, productId);
                preparedStatement.executeUpdate();
            }

            response.sendRedirect("cart.jsp?update=true");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    } else {
%>
<%@include file="goToLogin.jsp"%>
<%
    }
%>