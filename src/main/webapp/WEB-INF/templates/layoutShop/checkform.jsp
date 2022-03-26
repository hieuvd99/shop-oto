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
    
        <title>KING OTO - Checkout</title>
    
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
                <li class="nav-item active">
                  <a class="nav-link" href="/home/products">Our Products</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/home/about">About Us</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/home/contact">Contact Us</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
    </header>
    <!-- End Header-->


    <div class="container">
        <div class="py-5 text-center">
        </div>
        <div class="py-5 text-center">
        </div>
        <div class="row">
            <div class="col-md-4 order-md-2 mb-4">

                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-muted">Your cart</span>
                </h4>
                <div class="py-5 text-center">
                </div>
                <ul class="list-group mb-3">
                    <c:forEach var="item" items="${items}">
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">${item.name}</h6>
                            <small class="text-muted">SL : ${item.quantity}</small>
                        </div>
                        <span class="text-muted">${item.price}</span>
                    </li>

                    <li class="list-group-item d-flex justify-content-between bg-light">
                        <div class="text-success">
                            <h6 class="my-0">Promo code</h6>
                            <small>EXAMPLE CODE</small>
                        </div>
                        <span class="text-success">-${item.discount}%</span>
                    </li>
                    </c:forEach>
                    <li class="list-group-item d-flex justify-content-between">
                        <span>Total (USD)</span>
                        <strong>$ ${total}</strong>
                    </li>
                </ul>

                <form class="card p-2">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Promo code">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-secondary">Redeem</button>
                        </div>
                    </div>
                </form>
            </div>

            <div class="col-md-8 order-md-1">
                <h4 class="mb-3">Billing address</h4>
                <form:form  action="/shoppingcart/save/order"  modelAttribute="item">
                    <div class="row">
                        <div class="col-md-12 mb-6">
                            <label >Full name</label>
                            <input type="text" class="form-control" id="fullname" placeholder="" value="${user.fullname}" />
                            <div class="invalid-feedback">
                                Valid first name is required.
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label >Address </label>
                        <form:input type="text" class="form-control"   value="${user.address}" path="address"/>
                        <div class="invalid-feedback">
                            Please enter a address
                        </div>
                    </div>
                    <div class="mb-3">
                        <label >Username </label>
                        <form:input type="text" class="form-control"   value="${user.username}" path="username"/>
                        <div class="invalid-feedback">
                            Please enter a user name
                        </div>
                    </div>
                    <div class="mb-3">
                        <label >Phone </label>
                        <form:input type="text" class="form-control"   value="${user.phone}" path="phone"/>
                        <div class="invalid-feedback">
                            Please enter a valid phone
                        </div>
                    </div>
                    <div class="mb-3">
                        <label >Date</label>
                        <form:input type="text"  placeholder="Date" class="form-control" path="createDate" />
                    </div>

                    <h4>${message}</h4>
                    <hr class="mb-4">
                    <button class="btn btn-primary btn-lg btn-block" type="submit"> Checkout</button>
                </form:form>
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