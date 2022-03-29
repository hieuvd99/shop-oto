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
    
        <title>KING OTO - ADMIN PROFILE</title>
    
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
                  <a class="nav-link active" href="/admin/account/about/${user.id}">Profile
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

    <!-- Banner Ends Here -->
    <div class="latest-products mt-5">
        <div class="container">

            <div class="content">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card card-user">
                            <div class="image">
                            </div>
                            <div class="card-body">
                                <div class="author">
                                    <a href="#">
                                        <img class="avatar border-gray" src="/statics/assets/images/${user.photo}" style="width: 150px ; height: 150px;">
                                        <h5 class="title">${user.username}</h5>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card card-user">
                            <div class="card-header">
                                <h5 class="card-title">Edit Account</h5>
                            </div>
                            <div class="card-body">
                                <form>
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label>Id</label>
                                                <input type="text" disabled="true" class="form-control" value="${user.id}" path="id"/>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label>Username</label>
                                                <input type="text" class="form-control" name="username"  value="${user.username}" path="username"/>

                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label>Fullname</label>
                                                <input type="text" class="form-control"  value="${user.fullname}" path="fullname"/>

                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label>Email</label>
                                                <input type="text" class="form-control"  value="${user.email}" path="email"/>

                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label>Address</label>
                                                <input type="text" class="form-control"  value="${user.address}" path="address"/>

                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-group">
                                                <label>Phone</label>
                                                <input type="text" class="form-control"  value="${user.phone}" path="phone"/>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="create ml-auto mr-auto">                                                      
                                                <button type="submit" class="btn btn-primary btn-round ml-4" formaction="/admin/account/about/save" >Save</button>
                                            </div>
                                            
                                        </div>
                                        
                                    </div>
                                </form>    
                                <a>${message}</a>
                            </div>
                        </div>

                        <div class="card card-user">
                            <div class="card-header">
                                <h5 class="card-title">Change Password</h5>
                            </div>
                            <div class="card-body">
                                <form:form action="/admin/account/change/password" modelAttribute="item" method="post">
                                    <div class="col-10">
                                        <div class="form-group">
                                            <label>Old password</label>
                                            <input type="search" class="form-control" value="${old}" id="old" name="old" placeholder="Name Product" aria-label="Recipient's username" aria-describedby="button-addon2" >
                                        </div>
                                    </div>
                                    <div class="col-10">
                                        <div class="form-group">
                                            <label>New password</label>
                                            <input type="search" class="form-control" value="${newp}" id="newp" name="newp" placeholder="Name Product" aria-label="Recipient's username" aria-describedby="button-addon2" >
                                        </div>
                                    </div>
                                    
                                    
                                    <div class="col-10">
                                        <div class="form-group">
                                            <label>Confirm password</label>
                                            <input type="password" class="form-control" placeholder="New password" value="${confirm}" name="confirm"/>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="create ml-auto mr-auto">
                                            <form:button type="submit" class="btn btn-primary btn-round ml-4" >Update</form:button>
                                            <form:button type="reset" class="btn btn-primary">Cancel</form:button>
                                        </div>
                                    </div> 
                                </form:form>
                            </div>
                            <b><i>${message}</i></b>
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