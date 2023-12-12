<%-- 
    Document   : myOrders
    Created on : 10 Ara 2023, 06:02:01
    Author     : iscie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="div-myProduct">
    <div class="inside-product-div">
        <img src="<%out.print(order.getSiparisUrl());%>" alt="<%out.print(order.getSiparisIsim());%>"/>
    </div>
    <div class="productName">
        <p class="product-Name"><%out.print(order.getSiparisIsim());%></p>
    </div>
    <div class="productPrice">
        <div class="fir">
            <span class="fiyatText">Fiyat:</span>
        </div>
        <div class="seco">
            <span class="fiyat"><%out.print(order.getSiparisFiyat());%></span>
            <span class="fiyatText">TL</span>
        </div>
    </div>
    <div  class="productPrice">
        <div  class="fir">
            <span class="fiyatText">Adet:</span>
        </div>
        <div class="seco">
            <span class="fiyat"><%out.print(order.getSiparisAdet());%></span>
        </div>  
    </div>
    <div id="lastTime" class="productPrice">
        <div  class="fir">
            <span class="fiyatText">Sipariş Tarihi:</span>
        </div>
        <div class="seco">
            <span class="fiyat test"><%out.print(order.getSiparisTarih());%></span>
        </div>
    </div>
</div>