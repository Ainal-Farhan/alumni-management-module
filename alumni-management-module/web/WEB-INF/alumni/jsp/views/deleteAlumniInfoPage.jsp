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
    </head>
    <body>
        <%@include file="../components/navigationBar.jsp" %>
        
        <div style="width:90%;display:block;margin-right:auto;margin-left:auto;margin-top: 10px;margin-bottom: 10px;">
            <form action="AlumniServlet" method="POST">                
                <div class="form-group row">
                    <div class="col">
                        <img src="http://alumni-module.herokuapp.com/assets/img/profile/alumni/<%= request.getAttribute("profilePicture") %>" class="mx-auto d-block" width="350" height="350" style="margin-top:10px;margin-bottom:10px;border-radius: 50%;">
                    </div>
                    <div class="col">
                        <table class="table table-striped">
                            <thead class="thead-dark">
                                <tr>
                                    <th colspan="2" style="text-align: center;">
                                        Personal Information
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th>
                                        <label>Alumni ID</label>
                                    </th>
                                    <td>
                                        <input type="text" class="form-control-plaintext" value="<% out.print(request.getAttribute("id")); %>" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label>Name</label>
                                    </th>
                                    <td>
                                        <input type="text" class="form-control-plaintext" id="name" value="<% out.print(request.getAttribute("name")); %>" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label>Phone Number</label>
                                    </th>
                                    <td>
                                        <input type="text" class="form-control-plaintext" id="phone-number" value="<% out.print(request.getAttribute("phoneNumber")); %>" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label>Email</label>
                                    </th>
                                    <td>
                                        <input type="email" class="form-control-plaintext" value="<% out.print(request.getAttribute("email")); %>" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label>Professional Status</label>
                                    </th>
                                    <td>
                                        <input type="text" class="form-control-plaintext" id="username" value="<% out.print(request.getAttribute("profStatus")); %>" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label>Professional Status Gained (Year)</label>
                                    </th>
                                    <td>
                                        <input type="number" min="1999" max="2999" class="form-control-plaintext" id="username" value="<% out.print(request.getAttribute("profStatusYearGained")); %>" readonly>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                                    
                <div class="form-group">
                    <table class="table table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th colspan="2" style="text-align: center;">
                                    Mailing Address
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th>
                                    <label>Address Line 1</label>
                                </th>
                                <td>
                                    <input type="text" class="form-control-plaintext" id="alumniAddress1" value="<% out.print(request.getAttribute("alumniAddress1")); %>" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>Address Line 2</label>
                                </th>
                                <td>
                                    <input type="text" class="form-control-plaintext" id="alumniAddress2" value="<% out.print(request.getAttribute("alumniAddress2")); %>" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>City</label>
                                </th>
                                <td>
                                    <input type="text" class="form-control-plaintext" id="alumniAddressCity" value="<% out.print(request.getAttribute("alumniAddressCity")); %>" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>Post Code</label>
                                </th>
                                <td>
                                    <input type="text" class="form-control-plaintext" id="alumniAddressPostCode" value="<% out.print(request.getAttribute("alumniAddressPostCode")); %>" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>State</label>
                                </th>
                                <td>
                                    <input type="text" class="form-control-plaintext" id="alumniAddressState" value="<% out.print(request.getAttribute("alumniAddressState")); %>" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>Country</label>
                                </th>
                                <td>
                                    <input type="text" class="form-control-plaintext" id="alumniAddressCountry" value="<% out.print(request.getAttribute("alumniAddressCountry")); %>" readonly>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="form-group">
                    <table class="table table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th colspan="2" style="text-align: center;">
                                    Educational Information
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th><label>Specialization</label></th>
                                <td><input type="text" class="form-control-plaintext" value="<% out.print(request.getAttribute("fieldOfSpecializationDiploma")); %>" readonly></td>
                                <td><input type="text" class="form-control-plaintext" value="<% out.print(request.getAttribute("fieldOfSpecializationBachelor")); %>" readonly></td>
                                <td><input type="text" class="form-control-plaintext" value="<% out.print(request.getAttribute("fieldOfSpecializationMaster")); %>" readonly></td>
                            </tr>
                            <tr>
                                <th><label>Batch</label></th>
                                <td><input type="number" min="1" class="form-control-plaintext" value="<% out.print(request.getAttribute("batchDiploma")); %>" readonly></td>
                                <td><input type="number" min="1" class="form-control-plaintext" value="<% out.print(request.getAttribute("batchBachelor")); %>" readonly></td>
                                <td><input type="number" min="1" class="form-control-plaintext" value="<% out.print(request.getAttribute("batchMaster")); %>" readonly></td>
                            </tr>
                            <tr>
                                <th><label>Start in (Year)</label></th>
                                <td><input type="number" min="1999" max="2999" class="form-control-plaintext" value="<% out.print(request.getAttribute("startStudyYearDiploma")); %>" readonly></td>
                                <td><input type="number" min="1999" max="2999" class="form-control-plaintext" value="<% out.print(request.getAttribute("startStudyYearBachelor")); %>" readonly></td>
                                <td><input type="number" min="1999" max="2999" class="form-control-plaintext" value="<% out.print(request.getAttribute("startStudyYearMaster")); %>" readonly></td>
                            </tr>
                            <tr>
                                <th><label>Graduate in (Year)</label></th>
                                <td><input type="number" min="1999" max="2999" class="form-control-plaintext" value="<% out.print(request.getAttribute("graduateYearDiploma")); %>" readonly></td>
                                <td><input type="number" min="1999" max="2999" class="form-control-plaintext" value="<% out.print(request.getAttribute("graduateYearBachelor")); %>" readonly></td>
                                <td><input type="number" min="1999" max="2999" class="form-control-plaintext" value="<% out.print(request.getAttribute("graduateYearMaster")); %>" readonly></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                                
                <div class="form-group">
                    <table class="table table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th colspan="4" style="text-align: center;">
                                    Employment Information
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th></th>
                                <th>
                                    <label>Current</label>
                                </th>
                                <th>
                                    <label>Previous</label>
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    <label>Job</label>
                                </th>
                                <td>
                                    <input type="text" class="form-control-plaintext" value="<% out.print(request.getAttribute("curJob")); %>" readonly>
                                </td>
                                <td>
                                    <input type="text" class="form-control-plaintext" value="<% out.print(request.getAttribute("prevJob")); %>" readonly>
                                </td>
                            </tr>
                            <tr>    
                                <th>
                                    <label>Employer</label>
                                </th>
                                <td>
                                    <input type="text" class="form-control-plaintext" value="<% out.print(request.getAttribute("curEmployer")); %>" readonly>
                                </td>
                                <td>
                                    <input type="text" class="form-control-plaintext" value="<% out.print(request.getAttribute("prevEmployer")); %>" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>Salary</label>
                                </th>
                                <td>
                                    <input type="number" class="form-control-plaintext" value="<% out.print(String.format("%.2f", (Double)request.getAttribute("curSalary"))); %>" readonly>
                                </td>
                                <td>
                                    <input type="number" class="form-control-plaintext" value="<% out.print(String.format("%.2f", (Double)request.getAttribute("prevSalary"))); %>" readonly>
                                </td>
                            </tr>
                            <tr class="table-primary">
                                <th colspan="3" style="text-align: center;">
                                    <label>Current Employer Address</label>
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    <label>Address Line 1</label>
                                </th>
                                <td colspan="2">
                                    <input type="text" class="form-control-plaintext" id="alumniAddress1" value="<% out.print(request.getAttribute("employerAddress1")); %>" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>Address Line 2</label>
                                </th>
                                <td colspan="2">
                                    <input type="text" class="form-control-plaintext" id="alumniAddress2" value="<% out.print(request.getAttribute("employerAddress2")); %>" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>City</label>
                                </th>
                                <td colspan="2">
                                    <input type="text" class="form-control-plaintext" id="alumniAddressCity" value="<% out.print(request.getAttribute("employerAddressCity")); %>" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>Post Code</label>
                                </th>
                                <td colspan="2">
                                    <input type="text" class="form-control-plaintext" id="alumniAddressPostCode" value="<% out.print(request.getAttribute("employerAddressPostCode")); %>" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>State</label>
                                </th>
                                <td colspan="2">
                                    <input type="text" class="form-control-plaintext" id="alumniAddressState" value="<% out.print(request.getAttribute("employerAddressState")); %>" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>Country</label>
                                </th>
                                <td colspan="2">
                                    <input type="text" class="form-control-plaintext" id="alumniAddressCountry" value="<% out.print(request.getAttribute("employerAddressCountry")); %>" readonly>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                                
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
    </body>
</html>
