<%-- 
    Document   : register
    Created on : 9 Ara 2023, 03:59:32
    Author     : iscie
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="com.mycompany.web.programming.project.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
          href="css/register.css"
        />
        <link
          rel="stylesheet"
          href="css/general.css"
        />
        <title>Register</title>
    </head>
    <body>
        <p class="logo-p"><a class="logo" href="index.jsp">LOGO</a></p>
        <div class="login-div">
            <p class="title">ÜYE OL</p>
            <form class="loginForm" method="post">
                <div class="inputs"><p>Kullanıcı Adı</p><input class="inp" type="text" name="registerNickname" maxlength="20" pattern="[a-zA-ZçÇğĞıİöÖşŞüÜ]+" title="Sadece Türkçe karakterler kullanılabilir. [a-z] veya [A-Z]" placeholder="Kullanıcı Adı" required/></div>
                <div class="inputs"><p>Şifre</p><input class="inp" type="password" name="registerPassword" pattern="^[^\s]+$" title="Boşluk içeremez." placeholder="Şifre" required/></div>
                <div class="inputs"><p>E-Posta</p><input class="inp" type="email" name="registerEmail" placeholder="E-Posta" required/></div>
                <div class="inputs"><p class="hid">EŞ</p><input class="inpCheck" type="checkbox" required/><p class="new-register"><a class="linktoregister" href="">Üyelik Sözleşmesi</a>'ni okudum ve kabul ediyorum.</p></div>
                <div><p class="hid">EŞ</p><button class="inp sub" type="submit">Üye ol</button></div>
            </form>
            <p class="newregister">Zaten bir hesabınız var mı? <a class="linktoregister" href="login.jsp">Giriş Yap</a></p>
        </div>
        <%
            String registerNickname = request.getParameter("registerNickname");
            String registerPassword = request.getParameter("registerPassword");
            String registerEmail = request.getParameter("registerEmail");
            
            try {
                if (registerNickname != null && registerPassword != null && registerEmail != null) {
                    
                    String sqlCheckNickname = "SELECT COUNT(*) FROM kullanicilar WHERE kullaniciNick = ?";
                    try (PreparedStatement checkNicknameStatement = DBConnection.getConnection().prepareStatement(sqlCheckNickname)) {
                        checkNicknameStatement.setString(1, registerNickname);
                        ResultSet nicknameResultSet = checkNicknameStatement.executeQuery();
                        nicknameResultSet.next();
                        int nicknameCount = nicknameResultSet.getInt(1);

                        String sqlCheckEmail = "SELECT COUNT(*) FROM kullanicilar WHERE kullaniciEposta = ?";
                        try (PreparedStatement checkEmailStatement = DBConnection.getConnection().prepareStatement(sqlCheckEmail)) {
                            checkEmailStatement.setString(1, registerEmail);
                            ResultSet emailResultSet = checkEmailStatement.executeQuery();
                            emailResultSet.next();
                            int emailCount = emailResultSet.getInt(1);
                            
                            if (nicknameCount > 0) {
        %>
                                <script>
                                    alert("Kullanıcı adı zaten kayıtlı!");
                                    window.location.href = "register.jsp";
                                </script>
        <%
                            } else if (emailCount > 0) {
        %>
                                <script>
                                    alert("E-Posta adresi zaten kayıtlı!");
                                    window.location.href = "register.jsp";
                                </script>
        <%
                            } else {
                                String sqlInsert = "INSERT INTO kullanicilar (kullaniciNick, kullaniciEposta, kullaniciSifre) VALUES (?, ?, ?)";
                                try (PreparedStatement preparedStatement = DBConnection.getConnection().prepareStatement(sqlInsert)) {
                                    preparedStatement.setString(1, registerNickname);
                                    preparedStatement.setString(2, registerEmail);
                                    preparedStatement.setString(3, registerPassword);
                                    preparedStatement.executeUpdate();
                                }
                                %>
                                    <script>
                                        alert("Başarıyla Kayıt Oldunuz!");
                                        window.location.href = "login.jsp";
                                    </script>
                                <%
                            }
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
