<%-- 
    Document   : register
    Created on : 9 Ara 2023, 03:59:32
    Author     : iscie
--%>

<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="com.mycompany.web.programming.project.UserBean"%>
<%@page import="com.mycompany.web.programming.project.DBOperations"%>
<%@page import="com.mycompany.web.programming.project.DBConnection"%>
<%@page import="com.mycompany.web.programming.project.SessionUtils"%>
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

    if (!isLoggedIn) {
%>
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
<div class="logoDivs"><a class="logo" href="index.jsp"><img class="imgLogo" src="logo/f8f8f8.png" alt="Site logosu"/></a></div>
<div class="login-div">
    <p class="title">ÜYE OL</p>
    <form id="emailForm" class="loginForm" method="post" onsubmit="return validateEmail()" enctype="multipart/form-data">
        <div class="inputs"><p>Kullanıcı Adı</p><input class="inp" type="text" name="registerNickname" maxlength="20" pattern="[a-zA-ZğğüşıöçĞÜŞİÖÇı][a-zA-Z0-9ğüşıöçĞÜŞİÖÇı]*" title="Kullanıcı adı harfle başlamalı ve yalnızca harf ve rakam içerebilir. Kullanıcı adı sayı ile başlayamaz. [a-z], [A-Z], [0-9]" placeholder="Kullanıcı Adı" required/></div>
        <div class="inputs"><p>Şifre</p><input class="inp" type="password" name="registerPassword" pattern="^[^\s]+$" title="Boşluk içeremez." placeholder="Şifre" required/></div>
        <div class="inputs"><p>E-Posta</p><input class="inp" type="email" id="newUserEmail" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" name="registerEmail" placeholder="E-Posta" required/></div>
        <div class="inputs"><p class="hid">EŞ</p><input class="inpCheck" type="checkbox" required/><p class="new-register"><a class="linktoregister" href="">Üyelik Sözleşmesi</a>'ni okudum ve kabul ediyorum.</p></div>
        <div><p class="hid">EŞ</p><button class="inp sub" type="submit">Üye ol</button></div>
    </form>
    <p class="newregister">Zaten bir hesabınız var mı? <a class="linktoregister" href="login.jsp">Giriş Yap</a></p>
</div>
<%
    FileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);

    String registerNickname = null;
    String registerPassword = null;
    String registerEmail = null;

    try {
        List<FileItem> items = upload.parseRequest(request);

        for (FileItem item : items) {
            if (item.isFormField()) {
                String paramName = item.getFieldName();
                String paramValue = item.getString("UTF-8");

                switch (paramName) {
                    case "registerNickname":
                        registerNickname = paramValue;
                        break;
                    case "registerPassword":
                        registerPassword = paramValue;
                        break;
                    case "registerEmail":
                        registerEmail = paramValue;
                        break;
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

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
    String sessId = SessionUtils.generateUniqueSessionID();
    String sqlInsert = "INSERT INTO kullanicilar (kullaniciNick, kullaniciEposta, kullaniciSifre, kullaniciUrl, kullaniciSessId) VALUES (?, ?, ?, ?, ?)";
    try (PreparedStatement preparedStatement = DBConnection.getConnection().prepareStatement(sqlInsert)) {
        preparedStatement.setString(1, registerNickname);
        preparedStatement.setString(2, registerEmail);
        preparedStatement.setString(3, registerPassword);
        preparedStatement.setString(4, "kullaniciResim/user.jpg");
        preparedStatement.setString(5, sessId);
        preparedStatement.executeUpdate();
    }

%>
<script>
    alert("Başarıyla Kayıt Oldunuz!");
    window.location.href = "login.jsp";
</script>
<%                                                            }
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<script>
    function validateEmail() {
        let emailField = document.getElementById('newUserEmail');
        let emailValue = emailField.value;
        let emailRegex = /^[a-zA-Z0-9._+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

        if (!emailRegex.test(emailValue)) {
            alert('Geçerli bir e-posta adresi girin.');
            return false;
        }

        return true;
    }

    document.getElementById('emailForm').onsubmit = function () {
        return validateEmail();
    };
</script>
</body>
</html>
<%
} else {
%>
<%@include file="goToLogin.jsp"%>
<%
    }
%>