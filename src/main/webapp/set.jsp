<%-- 
    Document   : set
    Created on : 12 Ara 2023, 20:44:35
    Author     : iscie
--%>

<%@page import="java.io.*, java.util.*" %>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mycompany.web.programming.project.UserBean"%>
<%@page import="com.mycompany.web.programming.project.Categories"%>
<%@page import="com.mycompany.web.programming.project.DBConnection"%>
<%@page import="com.mycompany.web.programming.project.DBOperations"%>
<%@page import="com.mycompany.web.programming.project.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    UserBean userBean = (UserBean) session.getAttribute("userBean");
    boolean isLoggedIn = (userBean != null && userBean.getUserId() != 0);
    
    if (isLoggedIn) {
        int userId = userBean.getUserId();
        
        if(request.getParameter("userNick") != null) {
            String newUserNick = request.getParameter("newUserNick");
            boolean checkPass = DBOperations.userPassMatches(userId, request.getParameter("currentPassword"));
            System.out.println("a");
            System.out.println(checkPass);
            if (!DBOperations.isUserNickExists(newUserNick) && DBOperations.userIdMatches(userId)) {
                    if(checkPass) {
                        try (Connection connection = DBConnection.getConnection()) {
                        String updateQuery = "UPDATE kullanicilar SET kullaniciNick = ? WHERE urunKullanici_id = ?";

                        try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                            preparedStatement.setString(1, newUserNick);
                            preparedStatement.setInt(2, userId);
                            preparedStatement.executeUpdate();
                        }
                        response.sendRedirect("profile.jsp?link=settings&changed=nick");
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    } else {
                        response.sendRedirect("profile.jsp?link=settings&error=passFalse");
                    }
            } else {
                response.sendRedirect("profile.jsp?link=settings&error=userNick_exists");
            }
        }
        
        if (request.getParameter("userEmail") != null) {
            String newUserEmail = request.getParameter("newUserEmail");
            boolean checkPass = DBOperations.userPassMatches(userId, request.getParameter("currentPassword"));
            if (!DBOperations.isEmailExists(newUserEmail) && DBOperations.userIdMatches(userId)) {
                if(checkPass) {
                    try (Connection connection = DBConnection.getConnection()) {
                    String updateQuery = "UPDATE kullanicilar SET kullaniciEposta = ? WHERE urunKullanici_id = ?";

                    try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                        preparedStatement.setString(1, newUserEmail);
                        preparedStatement.setInt(2, userId);
                        preparedStatement.executeUpdate();
                    }
                    response.sendRedirect("profile.jsp?link=settings&changed=email");
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }     
                } else {
                    response.sendRedirect("profile.jsp?link=settings&error=passFalse");
                }
            } else {
                response.sendRedirect("profile.jsp?link=settings&error=email_exists");
            }
        }
        
        if (request.getParameter("userPassword") != null) {
            String newUserPassword = request.getParameter("newUserPassword");
            boolean checkPass = DBOperations.userPassMatches(userId, request.getParameter("currentPassword"));
            if (DBOperations.userIdMatches(userId)) {
                if(checkPass) {
                    try (Connection connection = DBConnection.getConnection()) {
                    String updateQuery = "UPDATE kullanicilar SET kullaniciSifre = ? WHERE urunKullanici_id = ?";

                    try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                        preparedStatement.setString(1, newUserPassword);
                        preparedStatement.setInt(2, userId);
                        preparedStatement.executeUpdate();
                    }
                    response.sendRedirect("profile.jsp?link=settings&changed=password");
                    
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                } else {
                    response.sendRedirect("profile.jsp?link=settings&error=passFalse");
                }
            }
        }
    } else {
%>
<%@include file="goToLogin.jsp"%>
<%
    }
%>