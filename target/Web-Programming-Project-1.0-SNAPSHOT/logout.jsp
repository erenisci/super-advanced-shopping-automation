<%-- 
    Document   : logout.jsp
    Created on : 10 Ara 2023, 04:09:49
    Author     : iscie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>