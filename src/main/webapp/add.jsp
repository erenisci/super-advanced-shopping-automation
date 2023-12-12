<%--
    Document   : add.jsp
    Created on : 11 Ara 2023, 17:46:53
    Author     : iscie
--%>

<%@page import="java.io.*, java.util.*" %>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
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
        String isim = null;
        String aciklama = null;
        String fiyat = null;
        String stok = null;
        String kategori = null;
        String picUrl = null;

        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            try {
                List<FileItem> items = upload.parseRequest(request);

                for (FileItem item : items) {
                    if (item.isFormField()) {
                        String paramName = item.getFieldName();
                        String paramValue = item.getString("UTF-8");
                        if ("isim".equals(paramName)) {
                            isim = paramValue;
                            break;
                        }
                    }
                }

                for (FileItem item : items) {
                    if (item.isFormField()) {
                        String paramName = item.getFieldName();
                        String paramValue = item.getString("UTF-8");

                        switch (paramName) {
                            case "isim":
                                break;
                            case "aciklama":
                                aciklama = paramValue;
                                break;
                            case "fiyat":
                                fiyat = paramValue;
                                break;
                            case "stok":
                                stok = paramValue;
                                break;
                            case "kategori":
                                kategori = paramValue;
                                break;
                        }
                    } else {
                        String fileName = userBean.getUserId() + isim + ".jpg";
                        String uploadDir = application.getRealPath("/") + "../../src/main/webapp/urunResim/";

                        String filePath = uploadDir + fileName;
                        File uploadedFile = new File(filePath);
                        item.write(uploadedFile);
                        
                        picUrl = "urunResim/" + fileName;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        String insertSql = "INSERT INTO urunler (urunIsim, urunUrl, urunAciklama, urunFiyat, urunStok, urunKategori_id, urunKullanici_id) VALUES (?, ?, ?, ?, ?, ?, ?)"; 
        try (Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(insertSql)) {
            preparedStatement.setString(1, isim);
            preparedStatement.setString(2, picUrl);
            preparedStatement.setString(3, aciklama);
            preparedStatement.setBigDecimal(4, new BigDecimal(fiyat));
            preparedStatement.setInt(5, Integer.parseInt(stok));
            preparedStatement.setInt(6, Integer.parseInt(kategori));
            preparedStatement.setInt(7, userBean.getUserId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
            
        response.sendRedirect("profile.jsp?link=addProduct&added=true");
    } else {
%>
<body>
    404 NOT FOUND EN SON İŞİM
</body>
<%
    }
%>