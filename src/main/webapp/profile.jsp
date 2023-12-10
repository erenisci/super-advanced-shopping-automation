<%-- 
    Document   : profile
    Created on : 10 Ara 2023, 04:22:14
    Author     : iscie
--%>

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
          href="css/profile.css"
        />
        <link
          rel="stylesheet"
          href="css/general.css"
        />
        <title>Profile</title>
    </head>
    <body>
        <p class="logo-p"><a class="logo" href="index.jsp">LOGO</a></p>
        <div class="profile-cont">
            <div class="left-col">
                <%String myForm = request.getParameter("link");%>
                <div>
                    <div class=
                        "<%
                           if (myForm.equals("profil")) out.print("div-myLink-active");
                           else out.print("div-mylink");
                        %>"
                        ><a class=
                            "<%
                                if (myForm.equals("profil")) out.print("myLinks-active");
                                else out.print("myLinks");
                            %>"
                            href="profile.jsp?link=profil">Profil</a></div>
                    <div class=
                        "<%
                            if (myForm.equals("urunEkle")) out.print("div-myLink-active");
                            else out.print("div-mylink");
                        %>"
                        ><a class=
                            "<%
                                if (myForm.equals("urunEkle")) out.print("myLinks-active");
                                else out.print("myLinks");
                            %>"
                            href="profile.jsp?link=urunEkle">Ürün Ekle</a></div>
                    <div class=
                        "<%
                            if (myForm.equals("urunlerim")) out.print("div-myLink-active");
                            else out.print("div-mylink");
                        %>"
                        ><a class=
                            "<%
                                 if (myForm.equals("urunlerim")) out.print("myLinks-active");
                                 else out.print("myLinks");
                            %>"
                            href="profile.jsp?link=urunlerim">Ürünlerim</a></div>
                    <div class=
                            "<%
                                if (myForm.equals("siparislerim")) out.print("div-myLink-active");
                                else out.print("div-mylink");
                            %>"
                        ><a class=
                            "<%
                                 if (myForm.equals("siparislerim")) out.print("myLinks-active");
                                 else out.print("myLinks");
                            %>"
                            href="profile.jsp?link=siparislerim">Siparişlerim</a></div>
                    <div class=
                            "<%
                                if (myForm.equals("ayarlar")) out.print("div-myLink-active");
                                else out.print("div-mylink");
                            %>"
                        ><a class=
                            "<%
                                 if (myForm.equals("ayarlar")) out.print("myLinks-active");
                                 else out.print("myLinks");
                            %>"
                            href="profile.jsp?link=ayarlar">Ayarlar</a>
                    </div>
                </div>
                <div>
                    <div class="div-mylink-last"><a class="myLinks-last" href="logout.jsp">Çıkış</a></div>
                </div>                        
            </div>
            <div class="right-col">
                <%
                    if(myForm.equals("profil")) {
                    %><%@include file="components/profile.jsp"%>
                <%
                    }
                %>
                <%
                    if(myForm.equals("urunEkle")) {
                    %><%@include file="components/addProduct.jsp"%>
                <%
                    }
                %>
                <%
                    if(myForm.equals("urunlerim")) {
                    %><%@include file="components/myProduct.jsp"%>
                <%
                    }
                %>
                <%
                    if(myForm.equals("siparislerim")) {
                    %><%@include file="components/myOrders.jsp"%>
                <%
                    }
                %>
                <%
                    if(myForm.equals("ayarlar")) {
                    %><%@include file="components/settings.jsp"%>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
