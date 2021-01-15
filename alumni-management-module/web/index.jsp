<%-- 
    Document   : index
    Created on : Dec 27, 2020, 8:29:34 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  if(session.getAttribute("currentUserType") == null || ((String)session.getAttribute("currentUserType")).equals("")) { %>
<%      session.setAttribute("currentUserType", "admin"); %>
<%  } %>
<%  //session.setAttribute("currentUserType", "staff"); %>
<%  //session.setAttribute("currentUserType", "alumni"); %>
<%  //session.setAttribute("currentAlumniID", "4"); %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
    </head>
    <body>
        <%@include file="/WEB-INF/alumni/jsp/components/navigationBar.jsp" %>
        <h1>This is <%= (String)session.getAttribute("currentUserType") %> perspective</h1>
        
        <form action="TempServlet" method="POST">
            <select name="userType" id="userType" onchange="myFunction()">
                <option value="admin">Admin</option>
                <option value="staff">Staff</option>
                <option value="alumni">Alumni</option>
            </select>
            
            <input type="number" min="1" name="alumniID" placeholder="alumni ID" id="inputAlumniID" style="display:none;">
            
            <input type="submit" value="Change">
        </form>
        
        <script>
            function myFunction() {
                var x = document.getElementById("userType").value;
                
                if(x === "alumni") {
                    document.getElementById("inputAlumniID").required = true;
                    document.getElementById("inputAlumniID").style.display = "block";
                }
                else {
                    document.getElementById("inputAlumniID").required = false;
                    document.getElementById("inputAlumniID").style.display = "none";
                }
            }
        </script>
    </body>
</html>
