<%-- 
    Document   : cartBox
    Created on : 16 Ara 2023, 04:11:30
    Author     : iscie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div style="display: flex; gap: 2rem;">
    <div class="div-myProduct">
        <div class="inside-product-div">
            <img src="<%out.print(product.getProductUrl());%>" alt="<%out.print(product.getProductName());%>"/>
        </div>
        <div class="productName">
            <p class="product-Name"><%out.print(product.getProductName());%></p>
        </div>
        <div class="productPrice">
            <span class="fiyatText">Fiyat:</span> <span id='productPrice_<%out.print(product.getProductId());%>' class="fiyat"><%out.print(product.getProductPrice());%></span><span class="fiyatText money"> TL</span>
        </div>
        <div class="form">
            <div class="productStok"><span>STOK: </span><span class="stokS"><%out.print(product.getTotalStock());%></span></div>
            <form style="display: flex;">
                <input class="inputNumber" type="number" name="stockNum" value="1" max="<%out.print(product.getTotalStock());%>" min="1"/>  
                <button type="submit" class="update-button">Güncelle</button>
            </form>
        </div>
    </div>
    <form class="delete" method="get" action="remove.jsp">
        <input type="hidden" name="productId" value="<%out.print(product.getProductId());%>"/>
        <button type="submit" class="delete-button"><ion-icon name="trash-outline"></ion-icon></button>
    </form>
</div>
