<%-- 
    Document   : urunBox
    Created on : 5 Ara 2023, 05:01:37
    Author     : iscie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="box" onclick="redirectToPurchase('<%out.print(product.getUrunNewPageUrl());%>')">
    <div class="imgBox">
      <img
        class="resim"
        src="<%out.print(product.getUrunUrl());%>"
        alt="<%out.print(product.getUrunIsim());%>"
      />
      <div class="stokDiv"><p class="stok">STOK: <%out.print(product.getUrunStok());%></p></div>
    </div>
    <div class="name-value">
      <span><%out.print(product.getUrunIsim());%></span>
      <span><%out.print(product.getUrunFiyat());%>TL</span>
    </div>
    <div class="center">
      <form action="purchase.jsp" method="get">
        <input type="hidden" name="productName" value="<%out.print(product.getUrunIsim());%>"/>
        <input type="hidden" name="productUrl" value="<%out.print(product.getUrunUrl());%>"/>
        <input type="hidden" name="productPrice" value="<%out.print(product.getUrunFiyat());%>"/>
        <input type="hidden" name="productStock" value="<%out.print(product.getUrunStok());%>"/>
        <button type="submit">Satın Al</button>
    </form>
    </div>
</div>
