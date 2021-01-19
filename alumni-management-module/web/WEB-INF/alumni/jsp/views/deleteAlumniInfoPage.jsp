<%-- 
    Document   : manageInfoPage
    Created on : Dec 27, 2020, 8:30:37 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Alumni</title>
        <style>
            .custom-shadow {
                box-shadow: 
                    rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, 
                    rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, 
                    rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
            }
            .center {
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .table-custom {
                width: 100%;
            }
        </style>
    </head>
    <body>
        <%@include file="../components/navigationBar.jsp" %>
        
        <div style="width:90%;display:block;margin-right:auto;margin-left:auto;margin-top: 10px;margin-bottom: 10px;">
            <div class="jumbotron">
                <h1 class="display-4">Delete Profile Page</h1>
                
                <form action="AlumniServlet" method="POST">                
                    <div class="form-group row">
                        <div class="col center">
                            <img src="http://alumni-module.herokuapp.com/assets/img/profile/alumni/<%= request.getAttribute("profilePicture") %>" alt="<% out.print(request.getAttribute("profilePicture")); %>" class="mx-auto d-block" width="350" height="350" style="margin-top:10px;margin-bottom:10px;border-radius: 50%;">
                        </div>
                        <div class="col">
                            <div class="custom-shadow">
                                <jsp:include page="../components/alumniPersonalInformation.jsp" />
                            </div>
                            <div class="custom-shadow">
                                <jsp:include page="../components/alumniProfessionalInformation.jsp" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group custom-shadow">
                        <jsp:include page="../components/alumniMailingAddress.jsp" />
                    </div>

                    <div class="form-group custom-shadow">
                        <jsp:include page="../components/alumniEducationalInformation.jsp" />
                    </div>

                    <div class="form-group custom-shadow">
                        <jsp:include page="../components/alumniEmploymentInformation.jsp" />
                    </div>
                    
                    <hr class="my-4">
                                
                    <div class="form-group" style="width:300px;display:block;margin-right:auto;margin-left:auto;margin-top: 10px;margin-bottom: 10px;">
                        <input type="hidden" name="requestType" value="confirmDeleteAlumniInfo">
                        <%  if(currentUserType.equalsIgnoreCase("staff") || currentUserType.equalsIgnoreCase("admin")) { %>
                        <span>Confirm Delete?</span>
                        <input type="submit" name="yes-btn" class="btn btn-danger" value="Yes">
                        <input type="submit" name="no-btn" class="btn btn-success" value="No">
                        <%  } %>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
