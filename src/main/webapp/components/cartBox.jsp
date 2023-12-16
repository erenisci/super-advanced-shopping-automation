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
<<<<<<< HEAD
    <form class="delete" method="get" action="remove.jsp">
        <input type="hidden" name="productId" value="<%out.print(product.getProductId());%>"/>
        <button type="submit" class="delete-button"><ion-icon name="trash-outline"></ion-icon></button>
    </form>
</div>
=======
    <div class="productName">
        <p class="product-Name"><%out.print(product.getUrunIsim());%></p>
    </div>
    <div class="productPrice">
        <span class="fiyatText">Fiyat:</span> <span id='productPrice_<%out.print(product.getUrunId());%>' class="fiyat"><%out.print(product.getUrunFiyat());%></span><span class="fiyatText money"> TL</span>
    </div>
    <div class="form">
        <div class="productStok"><span>STOK: </span><span class="stokS"><%out.print(product.getUrunStok());%></span></div>
        
        <input class="inputNumber" type="number" name="stockNum" value="1" max="<%out.print(product.getUrunStok());%>" min="1" onkeydown="return false;"/>
        <button class="delete-button" onclick="removeFromCart(<%out.print(product.getUrunId());%>)">Sepetten Kaldır</button>
    </div>
</div>
>>>>>>> 2007362d38b8e4776c03e5563e6d8dff84204c66
