<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<!DOCTYPE html>
<html>
<head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    
        <title>KING OTO - ADMIN CATEGORY</title>
    
        <!-- Bootstrap core CSS -->
        <link href="/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!--
    
        TemplateMo 546 Sixteen Clothing
    
        https://templatemo.com/tm-546-sixteen-clothing
    
        -->
    
        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="/static/assets/css/fontawesome.css">
        <link rel="stylesheet" href="/static/assets/css/templatemo-sixteen.css">
        <link rel="stylesheet" href="/static/assets/css/owl.css">
    
</head>
<body>
    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->

    <!-- Header -->
    <header class="">
        <nav class="navbar navbar-expand-lg">
          <div class="container">
            <a class="navbar-brand" href="/"><h2>KING <em>OTO</em></h2></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link " href="/admin/home">All user</a>
                  </li>
                <li class="nav-item ">
                  <a class="nav-link" href="/admin/account/about/${user.id}">Profile
                    <span class="sr-only">(current)</span>
                  </a>
                </li> 
                <li class="nav-item">
                  <a class="nav-link" href="/admin/revenue">Revenue - Orders</a>
                </li>
                <li class="nav-item ml-1">
                    <div class="dropdown">
                        <a class="nav-link" href="" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" > Products </a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <a class="dropdown-item" href="/admin/homeproducts">All Products</a>
                            <a class="dropdown-item" href="/admin/homeproducts/add">Add Product</a>
                       </div>
                    </div>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" href="/admin/category">Category</a>
                </li>
                <li class="nav-item ml-1">
                  <div class="dropdown">
                     <a class="nav-link" href="" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" > ${user.username} </a>
					            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                       <a class="dropdown-item" href="/admin/home">Manager</a>
                       <a class="dropdown-item" href="/account/logout">Log out</a>
                     </div>
                   </div>
                 </li>

              </ul>
            </div>
          </div>
        </nav>
    </header>
    <!-- End Header-->
    <div class="banner header-text">
        
    </div>
    <!-- Banner Ends Here -->

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <ul class="nav nav-pills mb-1 mt-2 ml-2" id="pills-tab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">CATEGORY LIST</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="pills-add-tab" data-toggle="pill" href="#pills-add" role="tab" aria-controls="pills-add" aria-selected="false">Add - Edit Category</a>
                        </li>

                    </ul>
                    
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab"><div class="card-body">
                            <h4 class="card-title">CATEGORY LIST</h4>
                            <form action="/admin/category/search-and-page" method="post">
                                <input class="col-3 form-control" name="keywords" value="${keywords}"/>
                                <button class="btn btn-primary">Search</button>
                            </form>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    
                                    <thead class=" text-primary">
                                        <th> ID </th>
                                        <th> Name </th>
                                    </thead>
                                    <c:forEach var="item" items="${page.content}">
                                        <tbody>
                                        <tr>
                                            <td> ${item.id} </td>
                                            <td> ${item.name} </td>
                                            <td><a href="/admin/category/edit/${item.id}">Edit</a></td>
                                            <td> <a href="/admin/category/remove/${item.id}">Delete</a></td>
                                        </tr>
                                        </tbody>
                                    </c:forEach>
                                    <h6>${param.message}</h6>
                                </table>

                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
                                        <!-- First -->
                                        <li  class="page-item text-primary">
                                            <a href="/admin/category?p=0" class="page-link" style="font-size: 14px;"> First </a>
                                        </li>
                                        <!-- Previous -->
                                        <li ng-click="prev()" class="page-item text-primary">
                                            <a href="/admin/category?p=${page.number-1}" class="page-link" style="font-size: 14px;"> Previous </a>
                                         </li>
                                        <!-- Next -->
                                        <li ng-click="next()" class="page-item text-primary">
                                            <a href="/admin/category?p=${page.number+1}" class="page-link" style="font-size: 14px;"> Next </a>
                                        </li>
                                        <!-- Last -->
                                        <li ng-click="last()" class="page-item text-primary">
                                            <a href="/admin/category?p=${page.totalPages-1}" class="page-link" style="font-size: 14px;"> Last </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>

                        </div>
                    </div>
                        <div class="tab-pane fade" id="pills-add" role="tabpanel" aria-labelledby="pills-add-tab">
                            <div class="card card-user">
                                <div class="card-header">
                                    <h5 class="card-title">Add - Edit Category</h5>
                                </div>
                                <div class="card-body">
                                    <form:form action="/admin/category/add" modelAttribute="item" >
                                    	<div class="form-group">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>ID Category</label>
                                                    <form:input type="text" class="form-control" placeholder="Id" value="" path="id"/>
                                                    <form:errors path="id"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>Name Category</label>
                                                    <form:input type="text" class="form-control" placeholder="Username" value="" path="name"/>
                                                    <form:errors path="name"/>
                                                </div>
                                            </div>
                                        </div>
                                        <form:button type="submit" class="btn btn-primary btn-round">Save</form:button>
                                        <form:button type="reset" class="btn btn-primary">Cancel</form:button>
                                        <h6>${message}</h6>
                                    </form:form>
                                </div>
                            </div>
                         
                        </div>
                         
                        </div>

                </div>
            </div>
        </div>
    </div>

        <!-- Bootstrap core JavaScript -->
        <script src="/static/vendor/jquery/jquery.min.js"></script>
        <script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        
        <!-- Additional Scripts -->
        <script src="/static/assets/js/custom.js"></script>
        <script src="/static/assets/js/owl.js"></script>
        <script src="/static/assets/js/slick.js"></script>
        <script src="/static/assets/js/isotope.js"></script>
        <script src="/static/assets/js/accordions.js"></script>
    
    
        <script language = "text/Javascript"> 
          cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
          function clearField(t){                   //declaring the array outside of the
          if(! cleared[t.id]){                      // function makes it static and global
              cleared[t.id] = 1;  // you could use true and false, but that's more typing
              t.value='';         // with more chance of typos
              t.style.color='#fff';
              }
          }
        </script>
</body>
</html>
