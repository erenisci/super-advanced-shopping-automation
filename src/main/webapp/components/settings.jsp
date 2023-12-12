<%-- 
    Document   : settings
    Created on : 10 Ara 2023, 05:48:40
    Author     : iscie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container-height">
    <div class="forms-flex">
        <p class="par">Kullanıcı Adı Değiştir</p>
        <form class="form-flex" method="post" action="set.jsp">
            <input type="hidden" value="nick"/>
            <input type="text" maxlength="20" pattern="[a-zA-ZçÇğĞıİöÖşŞüÜ]+" title="Sadece Türkçe karakterler kullanılabilir. [a-z] veya [A-Z]" placeholder="Yeni Kullanıcı Adı" required/>
            <input type="password" pattern="^[^\s]+$" title="Boşluk içeremez." placeholder="Mevcut Şifre" required/>
            <input class="subm" type="submit" value="Değiştir"/>
        </form>
    </div>
    <div class="forms-flex">
        <p class="par">E-Posta Değiştir</p>
        <form class="form-flex" method="post" action="set.jsp">
            <input type="hidden" value="email"/>
            <input type="email" placeholder="Yeni E-Posta" required/>
            <input type="password" pattern="^[^\s]+$" title="Boşluk içeremez." placeholder="Mevcut Şifre" required/>
            <input class="subm" type="submit" value="Değiştir"/>
        </form>
    </div>
    <div class="forms-flex">
        <p class="par">Şifre Değiştir</p>
        <form class="form-flex" method="post" action="set.jsp">
            <input type="hidden" value="sifre"/>
            <input type="password" pattern="^[^\s]+$" title="Boşluk içeremez." placeholder="Yeni Şifre" required/>
            <input type="password" pattern="^[^\s]+$" title="Boşluk içeremez." placeholder="Mevcut Şifre" required/>
            <input class="subm" type="submit" value="Değiştir"/>
        </form>
    </div>
</div>