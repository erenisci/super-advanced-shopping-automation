<%-- 
    Document   : purchase.jsp
    Created on : 7 Ara 2023, 22:41:03
    Author     : iscie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta
          name="viewport"
          content="width=device-width, initial-scale=1.0"
        />
        <link
          rel="preconnect"
          href="https://fonts.googleapis.com"
        />
        <link
          rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin
        />
        <link
          href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
          rel="stylesheet"
        />
        <link
          rel="stylesheet"
          href="css/purchase.css"
        />
        <link
          rel="stylesheet"
          href="css/general.css"
        />
        <title>Purchase</title>
    </head>
    <body>
        <div class="div-product">
            <div class="child">
                <div class="turnback">
                    <a class="turn" href="index.jsp?page=<%out.print(request.getParameter("page"));%>&search=<%out.print(request.getParameter("search"));%>&category=<%out.print(request.getParameter("category"));%>&sort=<%out.print(request.getParameter("sort"));%>">
                        <
                    </a>
                </div>
                <div class="div-info">
                    <img class="img-product" src="<%out.print(request.getParameter("productUrl"));%>" alt="<%out.print(request.getParameter("productName"));%>"/>
                    <div class="text-product">
                        <p class="product-name color"><%out.print(request.getParameter("productName"));%></p>
                        <p class="product-info color">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor. Cursus mattis molestie a iaculis at erat. Purus sit amet volutpat consequat mauris nunc congue nisi. Magna sit amet purus gravida quis blandit turpis. Vitae ultricies leo integer malesuada nunc vel risus</p>
                        <div class="stock-price">
                            <p class="stock-price-color-first">FİYAT: <span class="stock-price-color"><%out.print(request.getParameter("productPrice"));%></span> TL</p>
                            <p class="stock-price-color-first">STOK: <span class="stock-price-color"><%out.print(request.getParameter("productStock"));%></span></p>
                        </div>
                        <button class="product-buy">Sepete Ekle</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
