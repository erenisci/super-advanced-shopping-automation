<%-- 
    Document   : cartBox
    Created on : 16 Ara 2023, 04:11:30
    Author     : iscie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="div-myProduct">
    <div class="inside-product-div">
        <img src="<%out.print(product.getUrunUrl());%>" alt="<%out.print(product.getUrunIsim());%>"/>
    </div>
    <div class="productName">
        <p class="product-Name"><%out.print(product.getUrunIsim());%></p>
    </div>
    <div class="productPrice">
        <span class="fiyatText">Fiyat:</span> <span id='productPrice_<%out.print(product.getUrunId());%>' class="fiyat"><%out.print(product.getUrunFiyat());%></span><span class="fiyatText money"> TL</span>
    </div>
    <div class="form">
        <div class="productStok"><span>STOK: </span><span class="stokS"><%out.print(product.getUrunStok());%></span></div>
        <input class="inputNumber" type="number" name="stockNum" value="1" max="<%out.print(product.getUrunStok());%>" min="1"/>        
        <form method="get" action="remove.jsp">
            <input type="hidden" name="productId" value="<%out.print(product.getUrunId());%>"/>
            <button type="submit" class="delete-button">Sepetten Kaldır</button>
        </form>
    </div>
</div>