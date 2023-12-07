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
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <img src="<%out.print(request.getParameter("productUrl"));%>" alt="<%out.print(request.getParameter("productName"));%>"/>
            <div>
                <p>Stok: <%out.print(request.getParameter("productStock"));%></p>
                <p>Isim: <%out.print(request.getParameter("productName"));%></p>
                <p>Fiyat: <%out.print(request.getParameter("productPrice"));%></p>
            </div>
        </div>
    </body>
</html>
