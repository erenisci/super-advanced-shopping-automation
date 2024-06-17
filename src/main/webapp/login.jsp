<%-- 
    Document   : login
    Created on : 9 Ara 2023, 01:53:45
    Author     : iscie
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mycompany.web.programming.project.UserBean"%>
<%@page import="com.mycompany.web.programming.project.SessionUtils"%>
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
        href="css/login.css"
        />
    <link
        rel="stylesheet"
        href="css/general.css"
        />
    <title>Login</title>
</head>
<body>
<div class="logoDivs"><a class="logo" href="index.jsp"><img class="imgLogo" src="logo/f8f8f8.png" alt="Site logosu"/></a></div>
<div class="login-div">
    <p class="title">GİRİŞ YAP</p>
    <form id="emailForm" class="loginForm" method="post" onsubmit="return validateEmail()">
        <div class="inputs"><p>E-Posta</p><input class="inp loginName" id="newUserEmail" type="email" pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" name="userEmail" placeholder="E-Posta" required/></div>
        <div class="inputs"><p>Şifre</p><input class="inp loginPassword" type="password" name="userPassword" pattern="^[^\s]+$" title="Boşluk içeremez." placeholder="Şifre" required/></div>
        <div class="inputs"><p class="hid">EŞ</p><input class="inpCheck" type="checkbox" name="session"/><p class="new-register">Oturumum açık kalsın.</p></div>
        <div class="inputs marg-top"><p class="hid">EŞ</p><button class="inp sub" type="submit">Giriş Yap</button></div>
    </form>
    <p class="newregister">Henüz üye olmadınız mı? <a class="linktoregister" href="register.jsp">Üye Ol</a></p>
</div>
<%
    userBean = new UserBean();
    String userEmail = request.getParameter("userEmail");
    String userPassword = request.getParameter("userPassword");

    int userId = 0;
    String sessId = "";
    String userNick = "";
    try {
        if (DBOperations.validateUser(userEmail, userPassword)) {
            userId = DBOperations.getUserId(userEmail);
            userNick = DBOperations.getUserNick(userEmail);
            userBean.setUserId(userId);
            userBean.setUserNick(userNick);
            session.setAttribute("userBean", userBean);

            if (request.getParameter("session") != null) {
                String userSessId = DBOperations.getUserSessionId(userBean.getUserId());
                response.addCookie(SessionUtils.createSessionCookie(userSessId));
            }

            response.sendRedirect("index.jsp");
        } else if (userEmail == null || userPassword == null) {

        } else {
%><script>alert("E-Posta veya Şifre uyuşmuyor!");</script><%
                    }
                } catch (SQLException e) {
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