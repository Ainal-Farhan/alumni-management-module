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
                <h1 class="display-4">Edit Profile Page</h1>
                <form action="AlumniServlet?requestType=updateAlumniProfilePicture" method="POST" enctype="multipart/form-data" onSubmit="return checkEitherImageIsSelected()">
                    <img id="profilePicture" src="http://alumni-module.herokuapp.com/assets/img/profile/alumni/<%= request.getAttribute("profilePicture") %>" class="mx-auto d-block custom-shadow" width="350" height="350" style="margin-top:10px;margin-bottom:10px;border-radius: 50%;">
                    <span id="fileSelected"> Selected Image: None</span>

                    <input type="file" name="selectedImage" class="form-control-file" accept="image/*" id="fileName" accept=".jpg,.jpeg,.png" onchange="validateFileType(event)" style="display:none;">
                    <label for="fileName" class="btn btn-primary">Browse</label>

                    <input type="submit" class="btn btn-primary" value="Upload" style="margin-bottom: 8px;">
                    <%  if(!((String)request.getAttribute("profilePicture")).equalsIgnoreCase("default.png")) { %>
                    <input type="submit" class="btn btn-primary" value="Remove" name="remove-btn" style="margin-bottom: 8px;" onClick="toDefault()">
                    <%  } %>
                </form>

                <script type="text/javascript">
                    var statusUpload = false;

                    function validateFileType(event){
                        var fileName = document.getElementById("fileName").value;
                        fileName = fileName.replace(/.*[\/\\]/, '');
                        var idxDot = fileName.lastIndexOf(".") + 1;
                        var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
                        if (extFile=="jpg" || extFile=="jpeg" || extFile=="png"){
                            document.getElementById('fileSelected').innerHTML = " Selected Image: " + fileName;

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

                    function toDefault() {
                        statusUpload = true;
                    }

                    function checkEitherImageIsSelected() {
                        if(document.getElementById('fileName').value !== "") {
                            return true;
                        }
                        if(statusUpload) {
                            return true;
                        }
                        else {
                            alert("No image was selected.");
                        }
                        return false;
                    }
                </script>

                <form action="AlumniServlet" method="POST">   
                    <div class="form-group row">
                        <div class="col">
                            <div class="form-group custom-shadow">
                                <jsp:include page="../components/alumniPersonalInformation.jsp" />
                            </div>

                            <div class="form-group custom-shadow">
                                <jsp:include page="../components/alumniProfessionalInformation.jsp" />
                            </div>
                        </div>
                        <div class="col center">
                            <div class="form-group custom-shadow table-custom">
                                <jsp:include page="../components/alumniMailingAddress.jsp" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group custom-shadow">
                        <jsp:include page="../components/alumniEducationalInformation.jsp" />
                    </div>

                    <div class="form-group custom-shadow">
                        <jsp:include page="../components/alumniEmploymentInformation.jsp" />
                    </div>
                    
                    <hr class="my-4">
                    
                    <div class="form-group center">
                        <input type="hidden" name="requestType" value="updateAlumniInfo">
                        <input type="submit" style="width:100px;" name="save-btn" class="btn btn-success custom-shadow" value="Save">
                    </div>
                </form>
                <form action="AlumniServlet" method="POST">
                    <div class="form-group center">
                        <input type="hidden" name="requestType" value="updateAlumniInfo">
                        <input type="submit" style="width:100px;" name="cancel-btn" class="btn btn-primary custom-shadow" value="Cancel">
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
