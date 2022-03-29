
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    
        <title>KING OTO - ABOUTS</title>
    
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
                  <a class="nav-link" href="/home/products">Our Products</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" href="/home/about">About Us</a>
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


    <div class="best-features about-features">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section-heading">
              <h2>Information</h2>
            </div>
          </div>
          <div class="col-md-3">
            <div class="team-member">
              <div class="thumb-container">
                <img src="/static/assets/images/avatar-admin.jpg" alt="">
                <div class="hover-effect">
                  <div class="hover-content">
                    <ul class="social-icons">
                      <li><a href="https://www.facebook.com/hieuvd99"><i class="fa fa-facebook"></i></a></li>
                      <li><a href="https://github.com/hieuvd99"><i class="fa fa-git"></i></a></li>
                      <li><a href="https://soundcloud.com/hieuvd99"><i class="fa fa-soundcloud"></i></a></li>
                      <li><a href="https://zalo.me/0582370277"><i class="fa fa-envelope"></i></a></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="down-content">
                <h4>VUONG DINH HIEU</h4>
                <span>Developer</span>
                <p>Constantly learning to develop yourself</p>
              </div>
            </div>
          </div>

          <div class="col-md-8">
            <div class="left-content">
              <h4>Vuong Dinh Hieu</h4>
              <ul>
                <li><i class="fa fa-calendar"> 18/04/1999</i> </li>
                <li><i class="fa fa-user"> Male</i></li>
                <li><a href="tel:0582370277" style="color: black;"><i class="fa fa-phone"> (+84) 58 237 0277</i></a></li>
                <li><a href="mailto:vuongdinhhieu@outlook.com" style="color: black;"><i class="fa fa-envelope"> vuongdinhhieu@outlook.com</i></a></li>
                <li><i class="fa  fa-map-marker"> No.5, 136/64/2 alley, Van Tri 4, Cau Dien street, Minh Khai ward, Bac Tu Liem district, Ha Noi.</i></li>
                <li><i class="fa fa-graduation-cap"> Posts and Telecommunications Institute of Technology</i></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>


    <div class="services">
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <div class="service-item">
              <div class="icon">
                <img src="/static/assets/images/mercedes.jpg">
              </div>
              <div class="down-content">
                <h4>MERCEDES</h4>
                <a href="https://www.mercedes-benz.com/" class="filled-button">Read More</a>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="service-item">
              <div class="icon">
                <img src="/static/assets/images/porsche.JPG">
              </div>
              <div class="down-content">
                <h4>PORSCHE</h4>
                <a href="https://www.porsche.com/" class="filled-button">Read More</a>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="service-item">
              <div class="icon">
                <img src="/static/assets/images/lexus.JPG">
              </div>
              <div class="down-content">
                <h4>LEXUS</h4>
                <a href="https://www.lexus.com/" class="filled-button">Read More</a>
              </div>
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
