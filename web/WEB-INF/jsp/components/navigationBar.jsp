<%-- 
    Document   : navigationBar
    Created on : Dec 27, 2020, 8:36:51 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="<% out.println("/AlumniManagementModule/index.jsp"); %>">Alumni</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <%  String currentUserType = (String)session.getAttribute("currentUserType"); %>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <form action="AlumniServlet" method="POST">
                            <input type="hidden" name="requestType" value="viewAlumniList">
                            <input type="submit" class="btn btn-primary" value="Alumni List">
                        </form>
                    </li>
                    <%  if(currentUserType.equals("alumni")) { %>
                    <li class="nav-item">
                        <form action="AlumniServlet" method="POST">
                            <input type="hidden" name="requestType" value="manageAlumnusAlumnaInfo">
                            <input type="submit" class="btn btn-primary" value="Alumni Info">
                        </form>
                    </li>
                    <%  } %>
                </ul>
            </div>
        </nav>
    </body>
</html>
