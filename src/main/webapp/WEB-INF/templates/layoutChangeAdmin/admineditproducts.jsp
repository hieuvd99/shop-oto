 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    
        <title>KING OTO - PRODUCT EDIT</title>
    
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
                        <a class="nav-link active" href="" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" > Products </a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <a class="dropdown-item" href="/admin/homeproducts">All Products</a>
                            <a class="dropdown-item" href="/admin/homeproducts/add">Add Product</a>
                       </div>
                    </div>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/admin/category">Category</a>
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

    <!-- Edit Product -->
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card card-user">
                        <div class="image">

                        </div>
                        <div class="card-body">
                            <div class="author">
                                <a href="home/products/about/${item.id}">
                                    <img class="avatar border-gray" src="/static/upload/${item.image}" alt="...">
                                    <h5 class="title">${item.name}</h5>
                                </a>
                                <p class="description"> ${item.about}</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="card card-user">
                        <div class="card-header">
                            <h5 class="card-title">Edit Product</h5>    
                        </div>
                        <div class="card-body">
                            <form:form action="/admin/homeproducts/save" modelAttribute="item" method="post" enctype="multipart/form-data" >
                                <div class="form-group">
                                    <label>ID</label>
                                    <form:input type="text" class="form-control" path="id" placeholder="ID" />

                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <form:input type="name" class="form-control" path="name" placeholder="Name" />
                                    <form:errors path="name" />

                                </div>
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <form:input type="text" class="form-control" path="quantity" placeholder="Quantity" />
                                    <form:errors path="quantity" />
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <form:input type="number" class="form-control" path="price" placeholder="Price" />
                                    <form:errors path="price" />
                                </div>
                                <div class="form-group">
                                    <label>About</label>
                                    <form:input type="text" class="form-control" path="about" placeholder="About" />
                                    <form:errors path="about" />
                                </div>
                                <div class="form-group">
                                    <label>Discount</label>
                                    <form:input type="number" class="form-control" path="discount" placeholder="Discount" />
                                    <form:errors path="discount" />
                                </div>
                                <div class="form-group">
                                    <label>Create Date</label>
                                    <form:input type="text" class="form-control" path="createDate" placeholder="Create Date" />
                                    <form:errors path="createDate" />
                                </div>

                                <label>Image</label>
                                <input type="file" class="form-control" name="photo" accept="image/png,image/jpeg" />

                                <div class="form-group">
                                    <label>Category </label>
                                    <form:input type="text" class="form-control" path="category.id"/>
                                    <form:errors path="category.id" />
                                </div>
                                <h6>${message}</h6>

                                <form:button type="submit" class="btn btn-primary">Submit</form:button>
                                <form:button onclick="location.href='/admin/homeproducts'" type="reset" class="btn btn-primary">Cancel</form:button>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    <!--  End Edit Product -->
    
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
