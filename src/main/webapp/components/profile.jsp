<%-- 
    Document   : profile
    Created on : 10 Ara 2023, 06:03:52
    Author     : iscie
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mycompany.web.programming.project.UserBean"%>
<%@page import="com.mycompany.web.programming.project.DBConnection"%>
<%@page import="com.mycompany.web.programming.project.DBOperations"%>
<%@page import="com.mycompany.web.programming.project.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String isChanged = request.getParameter("change");
    
    if(isChanged != null && !isChanged.isEmpty()) {
        if (isChanged.equals("true")) {
            int userId = userBean.getUserId();

            String updateSql = "UPDATE kullanicilar SET kullaniciUrl = ? WHERE urunKullanici_id = ?";
            try (Connection connection = DBConnection.getConnection();
                PreparedStatement updateStatement = connection.prepareStatement(updateSql)) {
                
                updateStatement.setString(1, request.getParameter("url"));
                updateStatement.setInt(2, userId);
                int rowsAffected = updateStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            int userId = userBean.getUserId();
            String updateSql = "UPDATE kullanicilar SET kullaniciUrl = ? WHERE urunKullanici_id = ?";

            try (Connection connection = DBConnection.getConnection();
                PreparedStatement updateStatement = connection.prepareStatement(updateSql)) {
                
                updateStatement.setString(1, "kullaniciResim/user.jpg");
                updateStatement.setInt(2, userId);
                updateStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } 
        }
    }
%>
      
<div class="right-col right-col-profile">
    <div class="profile-pic">
        <div class="div-userBean-img">
            <img class="userBean-img" src="<%out.print(kullaniciUrl);%>" alt="<%out.print(kullaniciAdi);%> resim"/>
        </div>
        <div class="divFormImg">
            <p class="divFormImgP">Resmi Değiştir</p>
            <form class="sendImg" method="post" action="upload.jsp" enctype="multipart/form-data">
                <input type="file" name="image" accept="image/jpeg, image/png" required/>
                <input class="save" type="submit" value="Kaydet"/>
            </form>

            <form class="deleteImg" action="profile.jsp?link=profile&change=false&url=kullaniciResim/user.jpg" method="post">
                <p class="divFormDeleP">Resmi Sil</p>
                <input class="save" type="submit" value="Sil"/>
            </form>
        </div>
    </div>
    <div class="profile-info">
        <div class="profile-info-div">
            <p class="profile-info-p">Kullanıcı Adı</p>
            <div class="profile-info-border">
                <p class="profile-info-border-p"><%out.print(kullaniciAdi);%></p>
            </div>
        </div>
        <div class="profile-info-div">
            <p class="profile-info-p">E-Posta</p>
            <div class="profile-info-border">
                <p class="profile-info-border-p"><%out.print(kullaniciEposta);%></p>
            </div>
        </div>
    </div>
</div>