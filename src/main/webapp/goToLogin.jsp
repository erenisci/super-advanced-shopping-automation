<%-- 
    Document   : goToLogin
    Created on : 13 Ara 2023, 04:59:48
    Author     : iscie
--%>

<%@page import="com.mycompany.web.programming.project.UserBean"%>
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
          href="css/goToLogin.css"
        />
        <link
          rel="stylesheet"
          href="css/general.css"
        />
        <%
            if (isLoggedIn) {
                %>
                <script> 
                    let seconds = 3;
                    function countdown() {
                        if (seconds === 0) { 
                            window.location.href = "index.jsp"; 
                        } else { 
                            document.querySelector("#message").innerHTML += ".";
                            seconds--; 
                            setTimeout(countdown, 1000); 
                        } 
                    } setTimeout(countdown, 1000); 
                </script>
                <%
            } else {
                %>
                <script> 
                    let seconds = 3;
                    function countdown() {
                        if (seconds === 0) { 
                            window.location.href = "login.jsp"; 
                        } else { 
                            document.querySelector("#message").innerHTML += ".";
                            seconds--; 
                            setTimeout(countdown, 1000); 
                        } 
                    } setTimeout(countdown, 1000); 
                </script>
                <%
            }
        %>
        <title>Re-Log</title>
    </head>
    <body>
        <p class="logo-p"><a class="logo" href="index.jsp">LOGO</a></p>
    <div class="profile-cont">
        <%if(isLoggedIn) out.print("<p class='countdown-message'>Zaten Giriş Yaptınız</p>");%>
        <p id="message" class="countdown-message"><%if(isLoggedIn) out.print("Ana Sayfaya Yönlendiriliyorsunuz"); else out.print("Giriş Sayfasına Yönlendiriliyorsunuz");%></p>
    </div>
    </body>
</html>