<%-- 
    Document   : login
    Created on : 9 Ara 2023, 01:53:45
    Author     : iscie
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="com.mycompany.web.programming.project.UserBean"%>
<%@page import="com.mycompany.web.programming.project.DBOperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    UserBean userBean = (UserBean) session.getAttribute("userBean");
    boolean isLoggedIn = (userBean != null && userBean.getUserId() != 0);
    
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
                <p class="logo-p"><a class="logo" href="index.jsp">LOGO</a></p>
                <div class="login-div">
                    <p class="title">GİRİŞ YAP</p>
                    <form class="loginForm" method="post">
                        <div class="inputs"><p>E-Posta</p><input class="inp loginName" type="email" name="userEmail" placeholder="E-Posta" required/></div>
                        <div class="inputs"><p>Şifre</p><input class="inp loginPassword" type="password" name="userPassword" pattern="^[^\s]+$" title="Boşluk içeremez." placeholder="Şifre" required/></div>
                        <div class="inputs marg-top"><p class="hid">EŞ</p><button class="inp sub" type="submit">Giriş Yap</button></div>
                        <p class="passwordf"><a class="passwordforgot" href="#">Şifrenizi mi unuttunuz?</a></p>
                    </form>
                    <p class="newregister">Henüz üye olmadınız mı? <a class="linktoregister" href="register.jsp">Üye Ol</a></p>
                </div>
                <%
                    userBean = new UserBean();
                    String userEmail = request.getParameter("userEmail");
                    String userPassword = request.getParameter("userPassword");
                    int userId = 0;
                    String userNick = "";
                    try {
                        if (DBOperations.validateUser(userEmail, userPassword)) {
                            userId = DBOperations.getUserId(userEmail);
                            userNick = DBOperations.getUserNick(userEmail);
                            userBean.setUserId(userId);
                            userBean.setUserNick(userNick);
                            session.setAttribute("userBean", userBean);
                            response.sendRedirect("index.jsp");
                        } else if (userEmail == null || userPassword == null) {

                        } else {
                            %><script>alert("E-Posta veya Şifre uyuşmuyor!");</script><%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>
            </body>
        </html>
<%
    } else {
%>
<%@include file="goToLogin.jsp"%>
<%
    }
%>