<%-- 
    Document   : index
    Created on : Dec 27, 2020, 8:29:34 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  session.setAttribute("currentUserType", "admin"); %>
<%  //session.setAttribute("currentUserType", "staff"); %>
<%  //session.setAttribute("currentUserType", "alumni"); %>
<%  //session.setAttribute("currentAlumniID", "A18CS0921"); %>

// This is some changes...


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
    </head>
    <body>
        <%@include file="/WEB-INF/jsp/components/navigationBar.jsp" %>
        <h1>This is in index.jsp file</h1> 
    </body>
</html>
