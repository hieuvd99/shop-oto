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
    <div class="page-heading products-heading header-text">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="text-content">
              <h4>new arrivals</h4>
              <h2>sixteen products</h2>
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
                            <li ><a  href="/Product/add/${cate.id}" >${cate.name}</a></li>
                        </c:forEach>
                        <li><a href="/home/products/sort?field=price" style="color: #f33f3f"> Low to high</a></li>
                        <li><a href="/home/products/sortdesc?field=price" style="color: #f33f3f"> High to low</a></li>
                    </ul>
                    <ul>
                        <li><a href="/product/price/between0_50" style="color: #f33f3f"> 0-50$</a></li>
                        <li><a href="/product/price/between50_100" style="color: #f33f3f"> 50-100$</a></li>
                        <li><a href="/product/price/between100_150" style="color: #f33f3f"> 100-150$</a></li>
                        <li><a href="/product/price/between150_200" style="color: #f33f3f"> 200-250$</a></li>
                        <li><a href="/product/price/between200" style="color: #f33f3f"> 250$ +</a></li>
                    </ul>
                </form>
               </div>
          	</div>
          	
          	<c:forEach var="item" items="${page.content}">
            <div class="col-3">
              <div class="product-item">
                <a href="#"><img src="/static/upload/${item.image}" alt=""></a>
                  <div class="down-content">
                    <a href="#"><h4>${item.name}</h4></a>
                      <a> $${item.price}</a>
                      <br>
                      <h7>Reduced : $${item.price*(100-item.discount)*0.01}</h7>
                      <p>The product from Chelsea Football Club</p>
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
            
	          <div class="col-md-12">
	            <ul class="pages">
	              <li > <a href="/home/products?p=0">1</a></li>
	              <li ><a href="/home/products?p=1">2</a></li>
	              <li><a href="/home/products?p=2">3</a></li>
	              <li><a href="/home/products?p=3">4</a></li>
	              <li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>
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
              		<p>Copyright &copy; 2020 Sixteen Clothing Co., Ltd. - Design: <a rel="nofollow noopener" href="https://templatemo.com" target="_blank">TemplateMo</a></p>
            	</div>
          	</div>
        </div>
      </div>
    </footer>
    
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