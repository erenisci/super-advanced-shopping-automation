<%-- 
    Document   : upload
    Created on : 11 Ara 2023, 02:15:09
    Author     : iscie
--%>

<%@page import="java.io.*, java.util.*" %>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="com.mycompany.web.programming.project.UserBean"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    UserBean userBean = (UserBean) session.getAttribute("userBean");
    boolean isLoggedIn = (userBean != null && userBean.getUserId() != 0);
    String targetURL = "";
    
    if(isLoggedIn) {
        String uploadSubDir = "../../src/main/webapp/kullaniciResim/";
        String uploadDir = application.getRealPath("/") + uploadSubDir;
        DiskFileItemFactory factory = new DiskFileItemFactory();
        File repository = new File(uploadDir);
        factory.setRepository(repository);
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List<FileItem> items = upload.parseRequest(request);
            for (FileItem item : items) {
                if (!item.isFormField()) {
                    String filePath = uploadDir + userBean.getUserId() + userBean.getUserNick() + ".jpg";
                    File uploadedFile = new File(filePath);
                    item.write(uploadedFile);
                }
            }
            response.sendRedirect("profile.jsp?link=profile&change=true&url=kullaniciResim/" + userBean.getUserId() + userBean.getUserNick() + ".jpg");
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
