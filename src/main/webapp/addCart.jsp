<%-- 
    Document   : addCart
    Created on : 14 Ara 2023, 15:20:04
    Author     : iscie
--%>

<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="com.mycompany.web.programming.project.UserBean"%>
<%@page import="com.mycompany.web.programming.project.DBConnection"%>
<%@page import="com.mycompany.web.programming.project.DBOperations"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>

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
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        String kullaniciId = null;
        String urunId = null;
        String urunIsim = null;
        String urunUrl = null;
        String urunFiyat = null;

        try {
            List<FileItem> items = upload.parseRequest(request);

            for (FileItem item : items) {
                if (item.isFormField()) {
                    String paramName = item.getFieldName();
                    String paramValue = item.getString("UTF-8");

                    switch (paramName) {
                        case "kullanici_id":
                            kullaniciId = paramValue;
                            break;
                        case "urunId":
                            urunId = paramValue;
                            break;
                        case "urunIsim":
                            urunIsim = paramValue;
                            break;
                        case "urunUrl":
                            urunUrl = paramValue;
                            break;
                        case "urunFiyat":
                            urunFiyat = paramValue;
                            break;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        String insertQuery = "INSERT INTO sepetler (kullanici_id, urunId, urunIsim, urunUrl, urunFiyat, urunAdet) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
                PreparedStatement updateStatement = connection.prepareStatement(insertQuery)) {

            updateStatement.setInt(1, Integer.parseInt(kullaniciId));
            updateStatement.setInt(2, Integer.parseInt(urunId));
            updateStatement.setString(3, urunIsim);
            updateStatement.setString(4, urunUrl);
            updateStatement.setDouble(5, Double.parseDouble(urunFiyat));
            updateStatement.setInt(6, 1);
            updateStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("purchase.jsp?added=true");
    } else {
%>
<%@include file="goToLogin.jsp"%>
<%
    }
%>