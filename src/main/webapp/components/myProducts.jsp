<%-- 
    Document   : myProducts
    Created on : 10 Ara 2023, 06:00:08
    Author     : iscie
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mycompany.web.programming.project.DBConnection"%>
<%@page import="com.mycompany.web.programming.project.DBOperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="div-myProduct">
    <div class="inside-product-div">
        <img src="<%out.print(product.getUrunUrl());%>" alt="<%out.print(product.getUrunIsim());%>"/>
    </div>
    <div class="productName">
        <p class="product-Name"><%out.print(product.getUrunIsim());%></p>
    </div>
    <div class="productPrice">
        <span class="fiyatText">Fiyat:</span> <span class="fiyat"><%out.print(product.getUrunFiyat());%></span><span class="fiyatText money"> TL</span>
    </div>
    <form class="form" action="updateStok.jsp" method="get">
        <div class="productStok"><span>STOK: </span><span class="stokS"><%out.print(product.getUrunStok());%></span></div>
        <%%>
        <input type="hidden" name="productId" value="<%out.print(product.getUrunId());%>"/>
        <input type="hidden" name="productStok" value="<%out.print(product.getUrunStok());%>"/>
        <input class="inputNumber" type="number" name="stockNum" value="0" max="<%out.print(product.getUrunStok());%>" min="0"/>
        <button type="submit" class="delete-button">Sil</button>
    </form>
</div>