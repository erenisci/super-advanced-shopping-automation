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
    
</head>
<body>
    <div class="box">
        <div class="loginpanel">
            <form method="post">
                <label class="lbl">Ad:</label>
                <input type="text" name="ad" maxlength="25" pattern="[a-zA-ZçÇğĞıİöÖşŞüÜ]+" title="Sadece Türkçe karakterler kullanılabilir." /><br />
                <label class="lbl">Soyad:</label>
                <input type="text" name="soyad" maxlength="25" pattern="[a-zA-ZçÇğĞıİöÖşŞüÜ]+" title="Sadece Türkçe karakterler kullanılabilir." /><br />
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
       
       if (ad != null && ad.matches("[a-zA-ZçÇğĞıİöÖşŞüÜ]+") && ad.length() <= 25 &&
           soyad != null && soyad.matches("[a-zA-ZçÇğĞıİöÖşŞüÜ]+") && soyad.length() <= 25 &&
           sifre != null && sifre.matches("[A-Za-z0-9ğüşıöçĞÜŞİÖÇ]{7,20}")) {
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
       } else {
          if (ad != null && (ad.length() > 25 || !ad.matches("[a-zA-ZçÇğĞıİöÖşŞüÜ]+"))) {
    %>
    <p>Geçersiz ad formatı. Ad en fazla 25 karakter uzunluğunda olabilir ve sadece Türkçe karakterler kullanılabilir.</p>
    <%
          }
          if (soyad != null && (soyad.length() > 25 || !soyad.matches("[a-zA-ZçÇğĞıİöÖşŞüÜ]+"))) {
    %>
    <p>Geçersiz soyad formatı. Soyad en fazla 25 karakter uzunluğunda olabilir ve sadece Türkçe karakterler kullanılabilir.</p>
    <%
          }
          if (sifre != null && !sifre.matches("[A-Za-z0-9ğüşıöçĞÜŞİÖÇ]{7,20}")) {
    %>
    <p>Geçersiz şifre biçimi. Şifre yalnızca Türkçe harf ve rakamlardan oluşmalı ve en az 7 en fazla 20 karakter uzunluğunda olmalıdır.</p>
    <%
          }
       }
    %>

</body>
</html>
