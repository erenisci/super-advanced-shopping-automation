<%-- 
    Document   : purchase.jsp
    Created on : 7 Ara 2023, 22:41:03
    Author     : iscie
--%>

<%@page import="com.mycompany.web.programming.project.DBOperations"%>
<%@page import="com.mycompany.web.programming.project.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    UserBean userBean = (UserBean) session.getAttribute("userBean");
    String sessionIdFromCookie = "";

    if(userBean == null) {
        UserBean userBeanTemp = new UserBean();
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("userSessId".equals(cookie.getName())) {
                    sessionIdFromCookie = cookie.getValue();

                    userBeanTemp.setUserId(DBOperations.getUserIdFromSess(sessionIdFromCookie));
                    userBeanTemp.setUserNick(DBOperations.getUserNickFromSess(sessionIdFromCookie));

                    session.setAttribute("userBean", userBeanTemp);
                    break;
                }
            }
        }
    }

    userBean = (UserBean) session.getAttribute("userBean");
    boolean isLoggedIn = (userBean != null && userBean.getUserId() != 0) || !sessionIdFromCookie.equals("");
%>

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
                        <p class="product-info color"><%out.print(request.getParameter("productInfo"));%></p>
                        <div class="stock-price">
                            <p class="stock-price-color-first">FİYAT: <span class="stock-price-color"><%out.print(request.getParameter("productPrice"));%></span> TL</p>
                            <p class="stock-price-color-first">STOK: <span class="stock-price-color"><%out.print(request.getParameter("productStock"));%></span></p>
                        </div>
                        <form method="post" action="addCart.jsp">
                            <input type="hidden" name="productId" value="<%out.print(request.getParameter("productId"));%>"/>
                            <button type="submit" class="product-buy <%if(isLoggedIn && Integer.parseInt(request.getParameter("productUserId")) == userBean.getUserId()) out.print("padding-disable");%>">
                                <%if(isLoggedIn && Integer.parseInt(request.getParameter("productUserId")) == userBean.getUserId()) out.print("<a class='products' href='profile.jsp?link=myProducts'>Ürünlerim</a>"); else out.print("Sepete Ekle");%>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>