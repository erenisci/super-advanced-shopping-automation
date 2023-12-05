<%-- 
    Document   : urunBox
    Created on : 5 Ara 2023, 05:01:37
    Author     : iscie
--%>

<div class="box">
    <div class="imgBox">
      <img
        class="resim"
        src="<%out.println(product.getUrunUrl());%>"
      />
      <div class="stokDiv"><p class="stok">STOK: <%out.println(product.getUrunStok());%></p></div>
    </div>
    <div class="name-value">
      <span><%out.println(product.getUrunIsim());%></span>
      <span><%out.println(product.getUrunFiyat());%>TL</span>
    </div>
    <div class="center">
      <button class="buyBut">SATIN AL</button>
    </div>
</div>
