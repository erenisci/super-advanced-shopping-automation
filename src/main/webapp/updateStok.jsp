<%-- 
    Document   : updateStok
    Created on : 12 Ara 2023, 04:48:22
    Author     : iscie
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mycompany.web.programming.project.DBConnection"%>
<%@page import="com.mycompany.web.programming.project.DBOperations"%>
<%@page import="com.mycompany.web.programming.project.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    UserBean userBean = (UserBean) session.getAttribute("userBean");
    boolean isLoggedIn = (userBean != null && userBean.getUserId() != 0);
    
    if(isLoggedIn) {
        try (Connection connection = DBConnection.getConnection()) {
            int stockNum = Integer.parseInt(request.getParameter("stockNum"));
            int productId = Integer.parseInt(request.getParameter("productId"));
            int productStok = Integer.parseInt(request.getParameter("productStok"));
            
            String updateQuery = "UPDATE urunler SET urunStok = ? WHERE id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                preparedStatement.setInt(1, productStok - stockNum);
                preparedStatement.setInt(2, productId);
                preparedStatement.executeUpdate();
            }            
            

            if(productStok - stockNum == 0) {
                String deleteQuery = "DELETE FROM urunler WHERE id = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
                    preparedStatement.setInt(1, productId);
                    preparedStatement.executeUpdate();
                }
            }

            response.sendRedirect("profile.jsp?link=myProducts");
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
%>
<body>
    404 NOT FOUND EN SON İŞİM
</body>
<%
    }
%>