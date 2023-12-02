<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>CodePen - Animated Border Gradient</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css" />
    <link rel="stylesheet" href="registerin.css" />
</head>
<body>
    <div class="box">
        <div class="loginpanel">
            <form method="post">
                <label class="lbl">Ad:</label>
                <input type="text" name="ad" /><br />
                <label class="lbl">Soyad:</label>
                <input type="text" name="soyad" /><br />
                <label class="lbl">Email:</label>
                <input type="email" class="email1" name="eposta" /><br />
                <label class="lbl">Password:</label>
                <input type="password" class="password1" name="sifre" /><br />
                <input type="submit" class="buton" value="Kayıt OL" />
            </form>
        </div>
    </div>

    <%
       String url = "jdbc:mysql://localhost:3306/sys";
       String user = "root";
       String password = "Tunahan06";   

       String ad = request.getParameter("ad");
       String soyad = request.getParameter("soyad");
       String eposta = request.getParameter("eposta");
       String sifre = request.getParameter("sifre");
       
       Connection connection = null;
       PreparedStatement preparedStatement = null;

       try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          connection = DriverManager.getConnection(url, user, password);

          String sql = "INSERT INTO kullanicilar (`isim`, `soyIsim`, `eMail`, `passw`) VALUES (?, ?, ?, ?)";
          preparedStatement = connection.prepareStatement(sql);

          preparedStatement.setString(1, ad);
          preparedStatement.setString(2, soyad);
          preparedStatement.setString(3, eposta);
          preparedStatement.setString(4, sifre);
          
          preparedStatement.executeUpdate();
       } catch (Exception e) {
          e.printStackTrace();
       } finally {
          try {
             if (preparedStatement != null) {
                preparedStatement.close();
             }
             if (connection != null) {
                connection.close();
             }
          } catch (SQLException e) {
             e.printStackTrace();
          }
       }
    %>

 
</body>
</html>
