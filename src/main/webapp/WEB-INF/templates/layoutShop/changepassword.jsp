<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    <div class="banner header-text">
        <div class="owl-banner owl-carousel">
            <div class="banner-item-01">
                <div class="text-content">
                    <h4>XIN CHAO</h4>
                        <h2>${user.username}</h2>
                </div>
            </div>
        </div>
    </div>

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
                                        <img class="avatar border-gray" src="/static/assets/images/${user.photo}" style="width: 150px ; height: 150px;">
                                        <h5 class="title">${user.username}</h5>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="card card-user">
                            <div class="card-header">
                                <h5 class="card-title">Edit Product</h5>
                            </div>
                            <div class="card-body">
                                <form:form action="/home/account/change/password" modelAttribute="item" method="post">
                                    

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
                                                <button type="submit" class="btn btn-primary btn-round " formaction="/home/account/change/save">Update </button>
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
        
    </div>

</body>
</html>
