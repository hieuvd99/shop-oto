<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    
        <title>KING OTO - CART</title>
    
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
                <li class="nav-item ">
                  <a class="nav-link" href="/">Home
                    <span class="sr-only">(current)</span>
                  </a>
                </li> 
                <li class="nav-item">
                  <a class="nav-link active" href="/home/products">Our Products</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/home/about">About Us</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/home/contact">Contact Us</a>
                </li>
                
                <c:if test="${user==null}">
                  <li class="nav-item">
                    <a class="nav-link" href="/account/login">Login </a>
                  </li>
                </c:if>
                <li class="nav-item ml-1">
                  <div class="dropdown">
                     <a class="nav-link" href="" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" > ${user.username} </a>
					            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                       <a class="dropdown-item" href="/admin/home">Manager</a>
                       <a class="dropdown-item" href="/account/logout">Log out</a>
                     </div>
                   </div>
                 </li>
                 <li class="nav-item">
                    <a style="padding-left: 10px;" class="nav-icon position-relative text-decoration-none" href="/shoppingcart/index"> 
                    	<i class="fa fa-fw fa-cart-arrow-down text-white mr-1 mt-3"></i> 
                    </a>
                 </li>
                 
              </ul>
            </div>
          </div>
        </nav>
    </header>
    <!-- End Header-->
    
    <!-- Page Content -->
    <div class="page-heading about-heading header-text">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="text-content">
                        <h4>about us</h4>
                        <h2>our company</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
   <div class="container mb-4">
        <div class="row">
            <div class="col-12">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col"> </th>
                            <th scope="col">Product</th>
                            <th scope="col">Photo</th>
                            <th scope="col" class="text-center">Quantity</th>
                            <th scope="col"></th>
                            <th scope="col">Price</th>
                            <th scope="col" >Total</th>
                            <th> </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="no" value="1"></c:set>
                        <c:forEach var="item" items="${items}">
                        <form action="/shoppingcart/update" method="post">
                        <tr>
                            <td>${no}</td>
                            <td><a href="/user/add/${item.id}">${item.name}</a></td>
                            <td><img style="width: 100px;height: 60px" src="/static/upload/${item.image} "></td>
                            <td><input type="hidden" name="id" value="${item.id}">
                                <input type="number" value="${item.quantity}" name="quantity" onblur="this.form.submit()"></td>
                            </td>
                            <td></td>
                            <td>${item.price}</td>
                            <td class="text-right"><a class="fa fa-trash" href="/remove/${item.id}"></a>  </td>
                        </tr>
                        </form>
                            <c:set var="no" value="${no + 1}"></c:set>
                        </c:forEach>

                        </tbody>

                    </table>
                </div>
                <h5>$ ${total}</h5>
            </div>

            <div class="col mb-2">
                <div class="row">


                    <div class="col-sm-12  col-md-6">
                        <a class="btn btn-block btn-light" href="/home/views">Continue Shopping</a>
                    </div>
                    <div class="col-sm-12 col-md-6 text-right">
                        <a class="btn btn-lg btn-block btn-success text-uppercase" href="/shoppingcart/save">Checkout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <footer>
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="inner-content">
                <p>Copyright &copy; 2022 KING OTO
              
              - Design: <a rel="nofollow noopener" href="https://www.facebook.com/hieuvd99" target="_blank">hieuvd99</a></p>
              </div>
            </div>
          </div>
        </div>
      </footer>
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