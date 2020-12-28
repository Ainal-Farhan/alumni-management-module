<%-- 
    Document   : pagination
    Created on : Dec 28, 2020, 12:27:51 PM
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
        <div class="pagination-container">
            <nav aria-label="...">
                <div class="row">
                    <div class="col">
                        <ul class="pagination">
                            <li class="page-item" v-else>
                                <button class="page-link">First</button>
                            </li>

                            <li class="page-item" v-else>
                                <button class="page-link">Previous</button>
                            </li>
                            
                            <li class="page-item active" aria-current="page">
                                <a class="page-link" href="#"> <% out.print(request.getAttribute("currentPage")); %> <span class="sr-only">(current)</span></a>
                            </li>

                            <li class="page-item" v-if="currentPage != lastPage">
                                <button class="page-link">Next</button>
                            </li>

                            <li class="page-item" v-if="currentPage != lastPage">
                                <button class="page-link">Last</button>
                            </li>
                        </ul>
                    </div>
                    <div class="col">
                        <ul class="pagination justify-content-center">
                            <li class="page-item">
                                <form class="form-inline">
                                    <input class="form-control mr-sm-2" v-model="chosenPage" type="number" placeholder="..." min="1" :max="totalPage"  required>
                                    <input type="submit" class="btn btn-outline-success" value="Go" />
                                </form> 
                            </li>
                        </ul>
                    </div>
                    <div class="col">
                        <ul  class="pagination justify-content-end">
                            <li class="page-item disabled">
                                <button class="page-link">Total Alumni: <% out.print(request.getAttribute("totalAlumni")); %></button>
                            </li>

                            <li class="page-item disabled">
                                <button class="page-link total-info-custom">Total Pages: <% out.print(request.getAttribute("totalPages")); %></button>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </body>
</html>
