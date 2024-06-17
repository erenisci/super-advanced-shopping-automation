<%-- 
    Document   : purchase.jsp
    Created on : 7 Ara 2023, 22:41:03
    Author     : iscie
--%>

<%@page import="java.io.*, java.util.*"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="com.mycompany.web.programming.project.UserBean"%>
<%@page import="com.mycompany.web.programming.project.DBOperations"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>

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
        <div class="logoDivs"><a class="logo" href="index.jsp"><img class="imgLogo" src="logo/f8f8f8.png" alt="Site logosu"/></a></div>
        <div class="div-product">
            <%
                if (request.getParameter("added") != null && request.getParameter("added").equals("true")) {
            %>
                    <div class="child">
                        <div class="turnback">
                            <div class="div-info-if">
                                <div class="text-product-if">
                                    <button id="index"><</button>
                                    <p style="margin-right: 3rem;">Alışverişe devam et</p>
                                </div>
                                <div class="text-product-if">
                                    <p style="margin-left: 3rem;">Sepetime devam et</p>
                                    <button id="cart">></button>
                                </div>
                            </div>
                        </div>
                    </div>
            <%
                } else {
                    String productId = null;
                    String productUserId = null;
                    String pageM = null;
                    String search = null;
                    String category = null;
                    String sort = null;
                    String productName = null;
                    String productUrl = null;
                    String productInfo = null;
                    String productPrice = null;
                    String productStock = null;

                    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                    if (isMultipart) {
                        FileItemFactory factory = new DiskFileItemFactory();
                        ServletFileUpload upload = new ServletFileUpload(factory);

                        try {
                            List<FileItem> items = upload.parseRequest(request);

                            for (FileItem item : items) {
                                if (item.isFormField()) {
                                    String paramName = item.getFieldName();
                                    String paramValue = item.getString("UTF-8");

                                    switch (paramName) {
                                        case "productId":
                                            productId = paramValue;
                                            break;
                                        case "productUserId":
                                            productUserId = paramValue;
                                            break;
                                        case "page":
                                            pageM = paramValue;
                                            break;
                                        case "search":
                                            search = paramValue;
                                            break;
                                        case "category":
                                            category = paramValue;
                                            break;
                                        case "sort":
                                            sort = paramValue;
                                            break;
                                        case "productName":
                                            productName = paramValue;
                                            break;
                                        case "productUrl":
                                            productUrl = paramValue;
                                            break;
                                        case "productPrice":
                                            productPrice = paramValue;
                                            break;
                                        case "productStock":
                                            productStock = paramValue;
                                            break;
                                        case "productInfo":
                                            productInfo = paramValue;
                                            break;
                                    }
                                }
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
            %>
                    <div class="child">
                        <div class="turnback">
                            <a class="turn" href="index.jsp?page=<%out.print(pageM);%>&search=<%out.print(search);%>&category=<%out.print(category);%>&sort=<%out.print(sort);%>">
                                <
                            </a>
                        </div>
                        <div class="div-info">
                            <img class="img-product" src="<%out.print(productUrl);%>" alt="<%out.print(productName);%>"/>
                            <div class="text-product">
                                <p class="product-name color"><%out.print(productName);%></p>
                                <p class="product-info color"><%out.print(productInfo);%></p>
                                <div class="stock-price">
                                    <p class="stock-price-color-first">FİYAT: <span class="stock-price-color"><%out.print(productPrice);%></span> TL</p>
                                    <p class="stock-price-color-first">STOK: <span class="stock-price-color"><%out.print(productStock);%></span></p>
                                </div>
                                <form method="post" action="addCart.jsp" enctype="multipart/form-data">
                                    <input type="hidden" name="kullanici_id" value="<%if (isLoggedIn) out.print(userBean.getUserId()); else out.print(0);%>"/>
                                    <input type="hidden" name="urunId" value="<%out.print(productId);%>"/>
                                    <input type="hidden" name="urunIsim" value="<%out.print(productName);%>"/>
                                    <input type="hidden" name="urunUrl" value="<%out.print(productUrl);%>"/>
                                    <input type="hidden" name="urunFiyat" value="<%out.print(productPrice);%>"/>
                                    <button type="submit" class="product-buy <%if(isLoggedIn && Integer.parseInt(productUserId) == userBean.getUserId()) out.print("padding-disable");%>">
                                        <%if(isLoggedIn && Integer.parseInt(productUserId) == userBean.getUserId()) out.print("<a class='products' href='profile.jsp?link=myProducts'>Ürünlerim</a>"); else out.print("Sepete Ekle");%>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
            <%
                }
            %>
        </div>
        <script>
            function redirectToPage(page) {
                window.location.href = page;
            }

            document.getElementById('index').addEventListener('click', function() {
                redirectToPage('index.jsp');
            });

            document.getElementById('cart').addEventListener('click', function() {
                redirectToPage('cart.jsp');
            });
        </script>
    </body>
</html>