<%-- 
    Document   : viewAlumniListInfoPage
    Created on : Dec 27, 2020, 8:32:04 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alumni List</title>
    </head>
    <body>
        <div>
            <%@include file="../components/navigationBar.jsp" %>
        </div>
        <div style="width: 98%;display: block;margin-left: auto;margin-right: auto; margin-top: 10px; margin-bottom: 10px;">
            <%@include file="../components/search.jsp" %>
        </div>
        <div style="width: 98%;display: block;margin-left: auto;margin-right: auto; margin-top: 10px; margin-bottom: 10px;">
            <%@include file="../components/filter.jsp" %>
        </div>
        <div style="width: 98%;display: block;margin-left: auto;margin-right: auto; margin-top: 10px; margin-bottom: 10px;">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">No</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Location (State)</th>
                        <th scope="col">Graduation Year</th>
                        <th scope="col">Batch</th>
                        <th scope="col">Professional Status</th>
                        <th scope="col">Current Job</th>
                        <%  if(currentUserType.equalsIgnoreCase("admin") || currentUserType.equalsIgnoreCase("staff")) { %>
                        <th scope="col">Manage</th>
                        <%  } %>
                    </tr>
                </thead>
                <tbody>
                    <%  String[] alumniID = (String[])request.getAttribute("alumniIDArray"); %>
                    <%  String[] alumniName = (String[])request.getAttribute("alumniNameArray"); %>
                    <%  String[] alumniEmail = (String[])request.getAttribute("alumniEmailArray"); %>
                    <%  String[] alumniState = (String[])request.getAttribute("alumniStateArray"); %>
                    <%  String[] alumniGraduationYear = (String[])request.getAttribute("alumniGraduationYearArray"); %>
                    <%  String[] alumniBatch = (String[])request.getAttribute("alumniBatchArray"); %>
                    <%  String[] alumniProfStatus = (String[])request.getAttribute("alumniProfStatusArray"); %>
                    <%  String[] alumniCurJob = (String[])request.getAttribute("alumniCurJobArray"); %>

                    <% for(int i = 0; i < (Integer)request.getAttribute("totalAlumni"); i++) { %>
                    <tr>
                        <th scope="row"><% out.print(i+1); %></th>
                        <td><% out.print(alumniName[i]); %></td>
                        <td><% out.print(alumniEmail[i]); %></td>
                        <td><% out.print(alumniState[i]); %></td>
                        <td><% out.print(alumniGraduationYear[i]); %></td>
                        <td><% out.print(alumniBatch[i]); %></td>
                        <td><% out.print(alumniProfStatus[i]); %></td>
                        <td><% out.print(alumniCurJob[i]); %></td>
                        <%  if(currentUserType.equalsIgnoreCase("admin") || currentUserType.equalsIgnoreCase("staff")) { %>
                        <td>
                            <form action="AlumniServlet" method="POST">
                                <input type="hidden" name="selectedAlumniID" value="<% out.print(alumniID[i]); %>">
                                <input type="hidden" name="requestType" value="manageSelectedAlumniInfo">
                                <input type="submit" class="btn btn-primary" value="More Info">
                            </form>
                        </td>
                        <%  } %>
                    </tr>
                    <%  } %>
                </tbody>
            </table>
        </div>
                
        <div style="width: 98%;display: block;margin-left: auto;margin-right: auto; margin-top: 10px; margin-bottom: 10px;">
            <%@include file="../components/pagination.jsp" %>
        </div>
    </body>
</html>
