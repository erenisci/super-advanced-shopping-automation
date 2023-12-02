<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Veritabanı bağlantısı için gerekli bilgiler
    String url = "jdbc:mysql://localhost:3306/sys";
    String kullaniciAdi = "root";
    String sifre = "Tunahan06";

    String kullaniciAdiForm = request.getParameter("kullaniciAdi");
    String sifreForm = request.getParameter("sifre");
   
    out.println("Kullanıcı Adı: " + kullaniciAdiForm);
    out.println("Şifre: " + sifreForm);

    try {
        // JDBC sürücüsünü yükle
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Veritabanına bağlan
        Connection conn = DriverManager.getConnection(url, kullaniciAdi, sifre);

        // SQL sorgusu
        PreparedStatement st = conn.prepareStatement("SELECT * FROM kullanicilar WHERE `eMail`=? AND `passw`=?");


        // Prepared statement oluştur
        st.setString(1, kullaniciAdiForm.trim());
        st.setString(2, sifreForm.trim());

        // Sorguyu çalıştır ve sonuç kümesini al
        ResultSet resultSet = st.executeQuery();

        // Eğer kullanıcı bilgileri doğru ise
        if (resultSet.next()) {
            out.println("<p>Başarılı giriş!</p>");
        } else {
            out.println("<p>Başarısız giriş! Kullanıcı adı veya şifre hatalı.</p>");
        }
        out.println("SQL Sorgusu: " + st);
        // Kaynakları serbest bırak
        resultSet.close();
        st.close();
        conn.close();
    } catch (Exception e) {
        out.println("Hata: " + e.getMessage());
        e.printStackTrace();
    }
    
    
%>
