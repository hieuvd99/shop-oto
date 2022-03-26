
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    
        <title>KING OTO</title>
    
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
                <li class="nav-item active">
                  <a class="nav-link" href="/">Home
                    <span class="sr-only">(current)</span>
                  </a>
                </li> 
                <li class="nav-item">
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

    <div class="banner header-text">
        <div class="owl-banner owl-carousel">
            <div class="banner-item-01">
                <div class="text-content">
                    <h2>50 years of the 116 series</h2>
                    <h4>Mercedes</h4>
                </div>
            </div>
            <div class="banner-item-02">
                <div class="text-content">
                    <h2>Vorsprung durch Technik</h2>
                    <h4>Audi</h4>
                </div>
            </div>
            <div class="banner-item-03">
                <div class="text-content">
                    <h2>Don't be driven by technology drive it</h2>
                    <h4>bmw</h4>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner Ends Here -->

    <div class="latest-products">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-heading">
                        <h2>TOP 10 </h2>
                        <a href="">view all products <i class="fa fa-angle-right"></i></a>
                    </div>
                </div>
                <c:forEach var="item" items="${page.content}">
                    <div class="col-md-3">
                        <div class="product-item">
                            <a href="#"><img src="/static/upload/${item.image}" alt=""></a>
                            <div class="down-content">
                                <a href="#"><h4>${item.name}</h4></a>
                                <a> $${item.price}</a>
                                <br>
                                <h7>Reduced : $${item.price*(100-item.discount)*0.01}</h7>
                                <ul class="stars">
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                </ul>
                                </br>
                                <a class="filled-button" href="/home/products/about/${item.id}">Buy</a>
                            </div>

                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    
	<div class="best-features">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="section-heading">
                <h2>ABOUT KING OTO</h2>
              </div>
            </div>
            <div class="col-md-6">
              <div class="left-content">
                <h4>Bringing you the top automotive products.</h4>
                <ul class="featured-list">
                  <li>- Limited products only at King oto</li>
                  <li>- Special price only at King oto</li>
                  <li>- Classy gifts only at King oto</li>
                </ul>
                <a href="home/products" class="filled-button">Products</a>
              </div>
            </div>
            <div class="col-md-6">
              <div class="right-image">
                <img src="/static/assets/images/feature-image.jpg" alt="">
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