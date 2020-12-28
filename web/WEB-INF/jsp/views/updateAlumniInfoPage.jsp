<%-- 
    Document   : updateAlumniInfoPage
    Created on : Dec 27, 2020, 8:30:37 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Alumni</title>
    </head>
    <body>
        <%@include file="../components/navigationBar.jsp" %>
        
        <div style="width:90%;display:block;margin-right:auto;margin-left:auto;margin-top: 10px;margin-bottom: 10px;">
            <form action="AlumniServlet" method="POST">                
                <div class="form-group row">
                    <div class="col">
                        <div class="form-group">
                            <img id="profilePicture" src="/alumni-management-module/assets/img/profile/alumni/<% out.print(request.getAttribute("profilePicture")); %>" class="mx-auto d-block" width="350" height="350" style="margin-top:10px;margin-bottom:10px;border-radius: 50%;">
                            <label for="fileName" class="btn btn-primary">Upload Image</label><span id="fileSelected"> Selected Image: None</span>
                            <input name="image" class="form-control-file" type="file" accept="image/*" id="fileName" accept=".jpg,.jpeg,.png" onchange="validateFileType(event)" style="display:none;"/>
                            <input type="hidden" id="profilePictureName" name="updatedPictureName" value="<% out.print(request.getAttribute("profilePicture")); %>">
                            <script type="text/javascript">
                                function validateFileType(event){
                                    var fileName = document.getElementById("fileName").value;
                                    fileName = fileName.replace(/.*[\/\\]/, '');
                                    var idxDot = fileName.lastIndexOf(".") + 1;
                                    var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
                                    if (extFile=="jpg" || extFile=="jpeg" || extFile=="png"){
                                        document.getElementById('fileSelected').innerHTML = " Selected Image: " + fileName;
                                        document.getElementById('profilePictureName').value = "<% out.print(request.getAttribute("id")); %>_" + fileName;
                                        
                                        var reader = new FileReader();
                                        reader.onload = function(){
                                          var output = document.getElementById('profilePicture');
                                          output.src = reader.result;
                                        };
                                        reader.readAsDataURL(event.target.files[0]);
                                    }else{
                                        document.getElementById('fileSelected').innerHTML = " Selected Image: None";
                                        alert("Only jpg/jpeg and png files are allowed!");
                                    }   
                                }
                            </script>
                        </div>
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
                                        <input type="text" name="updatedAlumniName" class="form-control" value="<% out.print(request.getAttribute("name")); %>">
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label>Phone Number</label>
                                    </th>
                                    <td>
                                        <input type="text" name="updatedAlumniPhoneNumber" class="form-control" value="<% out.print(request.getAttribute("phoneNumber")); %>">
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label>Professional Status</label>
                                    </th>
                                    <td>
                                        <input type="text" name="updatedAlumniProfStatus" class="form-control" value="<% out.print(request.getAttribute("profStatus")); %>">
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label>Professional Status Gained (Year)</label>
                                    </th>
                                    <td>
                                        <input type="number" min="1999" max="2999" name="updatedAlumniProfStatusGainedYear" class="form-control" value="<% out.print(request.getAttribute("profStatusYearGained")); %>">
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
                                    <input type="text" class="form-control" name="updatedAlumniAddress1" value="<% out.print(request.getAttribute("alumniAddress1")); %>">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>Address Line 2</label>
                                </th>
                                <td>
                                    <input type="text" class="form-control" name="updatedAlumniAddress2" value="<% out.print(request.getAttribute("alumniAddress2")); %>">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>City</label>
                                </th>
                                <td>
                                    <input type="text" class="form-control" name="updatedAlumniAddressCity" value="<% out.print(request.getAttribute("alumniAddressCity")); %>">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>Post Code</label>
                                </th>
                                <td>
                                    <input type="text" class="form-control" name="updatedAlumniAddressPostCode" value="<% out.print(request.getAttribute("alumniAddressPostCode")); %>">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>State</label>
                                </th>
                                <td>
                                    <input type="text" class="form-control" name="updatedAlumniAddressState" value="<% out.print(request.getAttribute("alumniAddressState")); %>">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>Country</label>
                                </th>
                                <td>
                                    <input type="text" class="form-control" name="updatedAlumniAddressCountry" value="<% out.print(request.getAttribute("alumniAddressCountry")); %>">
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
                                <th>
                                    <label>Specialization</label>
                                </th>
                                <td>
                                    <input type="text" name="updatedAlumniFieldOfSpecialization" class="form-control" value="<% out.print(request.getAttribute("fieldOfSpecialization")); %>">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>Degree</label>
                                </th>
                                <td>
                                    <input type="text" name="updatedAlumniDegree" class="form-control" value="<% out.print(request.getAttribute("degree")); %>">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>Batch</label>
                                </th>
                                <td>
                                    <input type="number" min="1" name="updatedAlumniBatch" class="form-control" value="<% out.print(request.getAttribute("batch")); %>">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>Graduate in (Year)</label>
                                </th>
                                <td>
                                    <input type="number" min="1999" max="2999" name="updatedAlumniGraduateYear" class="form-control" value="<% out.print(request.getAttribute("graduateYear")); %>">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>Email</label>
                                </th>
                                <td>
                                    <input type="email" class="form-control" name="updatedAlumniEmail" value="<% out.print(request.getAttribute("email")); %>">
                                </td>
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
                                    <input type="text" class="form-control" name="updatedAlumniCurJob" value="<% out.print(request.getAttribute("curJob")); %>">
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="updatedAlumniPrevJob" value="<% out.print(request.getAttribute("prevJob")); %>">
                                </td>
                            </tr>
                            <tr>    
                                <th>
                                    <label>Employer</label>
                                </th>
                                <td>
                                    <input type="text" class="form-control" name="updatedAlumniCurEmployer" value="<% out.print(request.getAttribute("curEmployer")); %>">
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="updatedAlumniPrevEmployer" value="<% out.print(request.getAttribute("prevEmployer")); %>">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>Salary (RM)</label>
                                </th>
                                <td>
                                    <input type="number" class="form-control" name="updatedAlumniCurSalary" value="<% out.print(String.format("%.2f", (Double)request.getAttribute("curSalary"))); %>">
                                </td>
                                <td>
                                    <input type="number" class="form-control" name="updatedAlumniPrevSalary" value="<% out.print(String.format("%.2f", (Double)request.getAttribute("prevSalary"))); %>">
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
                                    <input type="text" class="form-control" name="updatedEmployerAddress1" value="<% out.print(request.getAttribute("employerAddress1")); %>">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>Address Line 2</label>
                                </th>
                                <td colspan="2">
                                    <input type="text" class="form-control" name="updatedEmployerAddress2" value="<% out.print(request.getAttribute("employerAddress2")); %>">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>City</label>
                                </th>
                                <td colspan="2">
                                    <input type="text" class="form-control" name="updatedEmployerAddressCity" value="<% out.print(request.getAttribute("employerAddressCity")); %>">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>Post Code</label>
                                </th>
                                <td colspan="2">
                                    <input type="text" class="form-control" name="updatedEmployerAddressPostCode" value="<% out.print(request.getAttribute("employerAddressPostCode")); %>">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>State</label>
                                </th>
                                <td colspan="2">
                                    <input type="text" class="form-control" name="updatedEmployerAddressState" value="<% out.print(request.getAttribute("employerAddressState")); %>">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label>Country</label>
                                </th>
                                <td colspan="2">
                                    <input type="text" class="form-control" name="updatedEmployerAddressCountry" value="<% out.print(request.getAttribute("employerAddressCountry")); %>">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                                
                <div class="form-group" style="width:200px;display:block;margin-right:auto;margin-left:auto;margin-top: 10px;margin-bottom: 10px;">
                    <input type="hidden" name="requestType" value="updateAlumniInfo">
                    <input type="submit" style="width:100px;" name="save-btn" class="btn btn-success" value="Save">
                </div>
            </form>
            <form action="AlumniServlet" method="POST">
                <div class="form-group" style="width:200px;display:block;margin-right:auto;margin-left:auto;margin-top: 10px;margin-bottom: 10px;">
                    <input type="hidden" name="requestType" value="updateAlumniInfo">
                    <input type="submit" style="width:100px;" name="cancel-btn" class="btn btn-primary" value="Cancel">
                </div>
            </form>
        </div>
    </body>
</html>
