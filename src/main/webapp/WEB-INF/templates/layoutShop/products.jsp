
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    
        <title>KING OTO - PRODUCTS</title>
    
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
    <div class="page-heading products-heading header-text">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="text-content">
              <h4>king oto</h4>
              <h2>top brands - products</h2>
            </div>
          </div>
        </div>
      </div>
    </div>

    
    <div class="products">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="filters">
               <form action="/product/search" method="post">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" value="${keywords}"name="keywords" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2" >
                    <div class="input-group-append">
                      <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Button</button>
                    </div>
                </div>
                </form>

                <form class="form-inline my-2 my-lg-0 "  action="/product/search" method="post">
                    <input type="search" class="form-control" value="${keywords}"name="keywords" placeholder="Name Product" aria-label="Recipient's username" aria-describedby="button-addon2" >
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Seach</button>
                    </div>
                    <ul>
                        <c:forEach var="cate" items="${categories}">
                            <li ><a  href="/product/category/${cate.id}" >${cate.name}</a></li>
                        </c:forEach>
                        <li><a href="/home/products/sort?field=price" style="color: #f33f3f"> Low to high</a></li>
                        <li><a href="/home/products/sortdesc?field=price" style="color: #f33f3f"> High to low</a></li>
                    </ul>
                    <ul>
                        <li><a href="/product/price/between0_50k" style="color: #f33f3f"> 0-50k$</a></li>
                        <li><a href="/product/price/between50k_300k" style="color: #f33f3f"> 50k-300k$</a></li>
                        <li><a href="/product/price/between300k_800k" style="color: #f33f3f"> 300k-800k$</a></li>
                        <li><a href="/product/price/between800k" style="color: #f33f3f"> 800k$ +</a></li>
                    </ul>
                </form>
            </div>
          </div>

          <c:forEach var="item" items="${page.content}">
            <div class="col-3">
              <div class="product-item">
                <a href="#"><img src="/static/upload/${item.image}"  alt=""></a>
                  <div class="down-content">
                    <a href="#"><h4>${item.name}</h4></a>
                      <a>Initial Price: $${item.price}</a>
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

            <!-- <a href="/home/products?p=0">First</a>
            <a href="/home/products?p=${page.number-1}">Previous</a>
            <a href="/home/products?p=${page.number+1}">1</a>
            <a href="/home/products?p=${page.totalPages-1}">Last</a> -->

            <!-- <ul>
                <li>S??? th???c th??? hi???n t???i: ${page.numberOfElements}</li>
                <li>Trang s???: ${page.number}</li>
                <li>K??ch th?????c trang: ${page.size}</li>
                <li>T???ng s??? th???c th???: ${page.totalElements}</li>
                <li>T???ng s??? trang: ${page.totalPages}</li>
            </ul> -->
            
          <div class="col-md-12">
            <ul class="pages">
              <li ><a href="/home/products?p=0">First</a></li>
              <li ><a href="/home/products?p=${page.number-1}"><</a></li>
              <li><a href="/home/products?p=${page.number+1}">></a></li>
              <li><a href="/home/products?p=${page.totalPages-1}">Last</a></li>
            </ul>
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