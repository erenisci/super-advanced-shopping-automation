<%-- 
    Document   : myProducts
    Created on : 10 Ara 2023, 06:00:08
    Author     : iscie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="div-myProduct">
    <div class="inside-product-div">
        <img src="<%out.print(product.getUrunUrl());%>" alt="<%%>"/>
    </div>
    <div class="productName">
        <p class="product-Name"><%out.print(product.getUrunIsim());%></p>
    </div>
    <div class="productPrice">
        <span class="fiyatText">Fiyat:</span> <span class="fiyat"><%out.print(product.getUrunFiyat());%></span><span class="fiyatText money"> TL</span></div>
    <form class="form" method="get">
        <div class="productStok"><span>STOK: </span><span class="stokS"><%out.print(product.getUrunStok());%></span></div>
        <input class="inputNumber" type="number" onKeyDown="return false" value="0" max="<%out.print(product.getUrunStok());%>" min="0"/>
        <button type="submit" class="delete-button">Sil</button>
    </form>
</div>
<script>
    let productNameInput = document.querySelector('.product-Name');
    let productName = productNameInput.innerHTML;
    if (productName.length > 13) {
        productName = productName.substring(0, 10) + "...";
        productNameInput.innerHTML = productName;
    }
</script>