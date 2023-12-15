<%-- 
    Document   : settings
    Created on : 10 Ara 2023, 05:48:40
    Author     : iscie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String changed = request.getParameter("changed");
    String error = request.getParameter("error");
    
    if(changed != null) {
        if(changed.equals("nick")) {
            %><script>alert("Kullanıcı Adınızı Başarıyla Değiştirdiniz!");</script><%
        }
        if(changed.equals("email")) {
            %><script>alert("E-Postanızı Başarıyla Değiştirdiniz!");</script><%
        }
        if(changed.equals("password")) {
            %><script>alert("Şifrenizi Başarıyla Değiştirdiniz!");</script><%
        }
    }

    if (error != null) {
        if(error.equals("userNick_exists")) {
            %><script>alert("Kullanıcı Adı Kullanımda!");</script><%
        }
        if(error.equals("email_exists")) {
            %><script>alert("E-Posta Kullanımda!");</script><%
        }
        if(error.equals("passFalse")) {
            %><script>alert("Mevcut Şifreniz Yanlış!");</script><%
        }
    }
%>

<div class="container-height">
    <div class="forms-flex">
        <p class="par">Kullanıcı Adı Değiştir</p>
        <form class="form-flex" method="post" action="set.jsp">
            <input type="hidden" name="userNick" value="nick"/>
            <input type="text" name="newUserNick" maxlength="20" pattern="[a-zA-Z][a-zA-Z0-9]*" title="Kullanıcı adı harfle başlamalı ve yalnızca harf ve rakam içerebilir. Kullanıcı adı sayı ile başlayamaz. [a-z], [A-Z], [0-9]" placeholder="Yeni Kullanıcı Adı" required/>
            <input type="password" name="currentPassword" pattern="^[^\s]+$" title="Boşluk içeremez." placeholder="Mevcut Şifre" required/>
            <input class="subm" type="submit" value="Değiştir"/>
        </form>
    </div>
    <div class="forms-flex">
        <p class="par">E-Posta Değiştir</p>
        <form id="emailForm" class="form-flex" method="post" action="set.jsp" onsubmit="return validateEmail()">
            <input type="hidden" name="userEmail" value="email"/>
            <input type="email" id="newUserEmail" name="newUserEmail" placeholder="Yeni E-Posta" required/>
            <input type="password" name="currentPassword" pattern="^[^\s]+$" title="Boşluk içeremez." placeholder="Mevcut Şifre" required/>
            <input class="subm" type="submit" value="Değiştir"/>
        </form>
    </div>
    <div class="forms-flex">
        <p class="par">Şifre Değiştir</p>
        <form id="last" class="form-flex" method="post" action="set.jsp">
            <input type="hidden" name="userPassword" value="sifre"/>
            <input type="password" name="newUserPassword" pattern="^[^\s]+$" title="Boşluk içeremez." placeholder="Yeni Şifre" required/>
            <input type="password" name="currentPassword" pattern="^[^\s]+$" title="Boşluk içeremez." placeholder="Mevcut Şifre" required/>
            <input class="subm" type="submit" value="Değiştir"/>
        </form>
    </div>
</div>

<script>
    function validateEmail() {
        let emailField = document.getElementById('newUserEmail');
        let emailValue = emailField.value;

        let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!emailRegex.test(emailValue)) {
            alert('Geçerli bir e-posta adresi giriniz.');
            return false;
        }
    }
    document.getElementById('emailForm').onsubmit = function() {
        return validateEmail();
    };
</script>