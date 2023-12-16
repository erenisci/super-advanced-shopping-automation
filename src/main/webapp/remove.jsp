<%-- 
    Document   : remove.jsp
    Created on : 16 Ara 2023, 06:32:30
    Author     : iscie
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.mycompany.web.programming.project.DBOperations"%>
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
    
    if (isLoggedIn) {
        String productIdToRemove = request.getParameter("productId");

        if (productIdToRemove != null && !productIdToRemove.isEmpty()) {
            List<int[]> cart = (List<int[]>) session.getAttribute("cart");

            if (cart != null && !cart.isEmpty()) {
                int productIdToRemoveInt = Integer.parseInt(productIdToRemove);

                Iterator<int[]> iterator = cart.iterator();
                while (iterator.hasNext()) {
                    int[] product = iterator.next();
                    int productId = product[0];

                    if (productId == productIdToRemoveInt) {
                        iterator.remove();
                        break;
                    }
                }
                
                session.setAttribute("cart", cart);
            }
        }

        response.sendRedirect("cart.jsp?deleted=true");
    } else {
%>
<%@include file="goToLogin.jsp"%>
<%
    }
%>
