<%-- 
    Document   : profile
    Created on : 10 Ara 2023, 06:03:52
    Author     : iscie
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mycompany.web.programming.project.Product"%>
<%@page import="com.mycompany.web.programming.project.UserBean"%>
<%@page import="com.mycompany.web.programming.project.DBConnection"%>
<%@page import="com.mycompany.web.programming.project.DBOperations"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String isChange = request.getParameter("change");
    String isChanged = request.getParameter("changed");

    if (isChange != null && !isChange.isEmpty()) {
        if (isChange.equals("true")) {
            int userId = userBean.getUserId();

            String updateSql = "UPDATE kullanicilar SET kullaniciUrl = ? WHERE urunKullanici_id = ?";
            try (Connection connection = DBConnection.getConnection();
                    PreparedStatement updateStatement = connection.prepareStatement(updateSql)) {

                updateStatement.setString(1, request.getParameter("url"));
                updateStatement.setInt(2, userId);
                updateStatement.executeUpdate();
                response.sendRedirect("profile.jsp?link=profile&changed=true");
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

                response.sendRedirect("profile.jsp?link=profile&changed=false");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

<div class="right-col right-col-profile">
    <div class="profile-pic">
        <div class="div-userBean-img">
            <img class="userBean-img" src="<%out.print(kullaniciUrl);%>" alt="<%out.print(kullaniciAdi);%>-resim"/>
        </div>
        <p class="resimChange <%if (isChanged == null)
                    out.print("opac");%>">
            <%
                if (isChanged != null) {
                    if (isChanged.equals("true")) {
            %><script>alert("Resminizi başarıyla değiştirdiniz!");</script><%
                            out.print("Resminizin değişmesi biraz zaman alabilir...");
                        } else {
        %><script>alert("Resminizi başarıyla sildiniz!");</script><%
                                    out.print("Resminizin silinmesi biraz zaman alabilir...");
                                }
                            } else {
                                out.print("Resminizin değişmesi biraz zaman alabilir...");
                            }
        %>
        </p>
        <div class="divFormImg">
            <p class="divFormImgP">Resmi Değiştir</p>
            <form class="sendImg" method="post" action="upload.jsp" enctype="multipart/form-data">
                <input id="fileCss" type="file" name="image" accept="image/jpeg, image/png" required/>
                <input class="save" type="submit" value="Kaydet"/>
            </form>


            <form class="deleteImg" action="profile.jsp?link=profile&change=false&url=kullaniciResim/user.jpg" method="post">
                <p class="divFormDeleP">Resmi Sil</p>
                <input class="save" type="submit" value="Sil"/>
            </form>
        </div>
    </div>
    <div class="profile-info">
        <div class="profile-info-div" id="firs-bottom-div">
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