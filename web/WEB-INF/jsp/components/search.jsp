<%-- 
    Document   : search
    Created on : Dec 28, 2020, 12:28:33 PM
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
        <div class="search-container">
            <form class="form-inline">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" required>
                <input type="submit" class="btn btn-outline-success my-2 my-sm-0" value="Search" />
                <input type="button" class="btn btn-outline-success my-2 my-sm-0" value="Reset" />
                <div class="form-check form-check-inline" style="margin-left: 10px;">
                    <input class="form-check-input" type="radio" name="searchReq" id="searchByName" value="name" checked>
                    <label class="form-check-label" for="searchByName">Name</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="searchReq" id="searchByBatch" value="batch">
                    <label class="form-check-label" for="searchByBatch">Batch</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="searchReq" id="searchByLocationInState" value="locationInState">
                    <label class="form-check-label" for="searchByLocationInState">Location (State)</label>
                </div>
            </form> 
        </div>
    </body>
</html>
