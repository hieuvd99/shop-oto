<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

  <title>Sixteen Clothing Products</title>
  <link href="/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--
    TemplateMo 546 Sixteen Clothing
    https://templatemo.com/tm-546-sixteen-clothing
    -->
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="/static/assets/css/fontawesome.css">
    <link rel="stylesheet" href="/static/assets/css/templatemo-sixteen.css">
    <link rel="stylesheet" href="/static/assets/css/owl.css">
    <link rel="stylesheet" href="/static/assets/css/flex-slider.css">

    <!-- Bootstrap core JavaScript -->
    <script src="/static/vendor/jquery/jquery.min.js"></script>
    <script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <style>

    </style>
</head>
<body>
	<!-- Page Content -->
    <div class="page-heading about-heading header-text">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="text-content">
                        <h4>About product</h4>

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
                        <h2>Our Product</h2>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="right-image">
                        <img src="/static/upload/${item.image}" alt="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="left-content">
                        <h4>${item.name}</h4>
                        <p>${item.about}</p>
                        <p>Price : $${item.price}</p>
                        <p>Discount :${item.discount}%</p>
                        <p>Reduced : $${item.price*(100-item.discount)*0.01}</p>
                        <ul class="social-icons">
                            <li><a href="/shoppingcart/add/${item.id}"><i class="fa buy"> BUY </i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-behance"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<div class="team-members">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-heading">
                        <h2>Same category as</h2>
                    </div>
                </div>
                
                <script>
                document.getElementById("start").innerHTML = Math.random();
                document.getElementById("end").innerHTML = Math.random()+5;
                </script>
                
                <c:forEach var="pro" begin = "<%= (int) Math.random() %>" end = "<%= (int) (Math.random() + 5) %>" items="${procate}">
                <div class="col-md-4">
                    <div class="team-member">
                        <div class="thumb-container">
                            <img src="/static/upload/${pro.image}" alt="" >
                            <div class="hover-effect">
                                <div class="hover-content" >
                                    <ul class="social-icons">
                                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                        <li><a href="/home/products/about/${pro.id}"><i class="fa buy"> </i>BUY</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="down-content">
                            <h4>${pro.name}</h4>
                            <span>${pro.category.name}</span>
                            <p>${pro.about}</p>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>

	<div class="services">
	    <div class="container">
	        <div class="row">
	            <div class="col-md-4">
	                <div class="service-item">
	                    <div class="icon">
	                        <i class="fa fa-gear"></i>
	                    </div>
	                    <div class="down-content">
	                        <h4>Product Management</h4>
	                        <p>Lorem ipsum dolor sit amet, consectetur an adipisicing elit. Itaque, corporis nulla at quia quaerat.</p>
	                        <a href="#" class="filled-button">Read More</a>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-4">
	                <div class="service-item">
	                    <div class="icon">
	                        <i class="fa fa-gear"></i>
	                    </div>
	                    <div class="down-content">
	                        <h4>Customer Relations</h4>
	                        <p>Lorem ipsum dolor sit amet, consectetur an adipisicing elit. Itaque, corporis nulla at quia quaerat.</p>
	                        <a href="#" class="filled-button">Details</a>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-4">
	                <div class="service-item">
	                    <div class="icon">
	                        <i class="fa fa-gear"></i>
	                    </div>
	                    <div class="down-content">
	                        <h4>Global Collection</h4>
	                        <p>Lorem ipsum dolor sit amet, consectetur an adipisicing elit. Itaque, corporis nulla at quia quaerat.</p>
	                        <a href="#" class="filled-button">Read More</a>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>

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