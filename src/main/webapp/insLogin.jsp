<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>

<body>
    <h2>Login</h2>
    
<!-- login.jsp -->
<form action="insloginKontrol.jsp" method="post">
    E-mail: <input type="text" name="kullaniciAdi"><br>
    Şifre: <input type="password" name="sifre"><br>
        <input type="submit" value="Giriş"><br>
    <p>Hesabın yoksa kayıt olmaya <a href="insregister.jsp">git</a></p>
</form>

</body>
</html>
