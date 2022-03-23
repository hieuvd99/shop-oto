<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
	<title>Tables</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <ul class="nav nav-pills mb-1 mt-2 ml-2" id="pills-tab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Home</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Profile</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                            <div class="card-header">
                                <h4 class="card-title">PRODUCTS LIST</h4>
                                <form action="/product/search-and-page" method="post">
                                    <input class="col-3 form-control" name="keywords" value="${keywords}"/>
                                    <button class="btn btn-primary">Search</button>
                                </form>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead class=" text-primary">
                                            <th> ID </th>
                                            <th> Name </th>
                                            <th> Image </th>
                                            <th> CreateDate </th>
                                            <th> Quantity </th>
                                            <th> Discount </th>
                                            <th> CategoryId </th>
                                            <th> Price </th>
                                            <th class="text-right"> Edit </th>
                                        </thead>
                                        <c:forEach var="item"  items="${page.content}" >
                                            <tbody>
                                                <tr>
                                                    <td> ${item.id} </td>
                                                    <td> ${item.name} </td>
                                                    <td><img  style="width: 70px;height: 40px" src="/static/upload/${item.image}"/></td>
                                                    <td> ${item.createDate} </td>
                                                    <td> ${item.quantity} </td>
                                                    <td> {item.discount} </td>
                                                    <td> ${item.category.id} </td>
                                                    <td> ${item.price} </td>
                                                    <td class="text-right">
                                                        <a href="/admin/tables/edit/${item.id}">Edit</a>
                                                        <i class="fa fa-window-minimize" aria-hidden="true"></i>
                                                        <a href="/admin/tables/remove/${item.id}"> Delete </a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </c:forEach>
                                        <h6>${param.message}</h6>
                                    </table>
                                    
                                    <!-- Page navigation -->
                                    <!-- <a href="/admin/table?p=0">First</a>
                                    <a href="/admin/table?p=${page.number-1}">Previous</a>
                                    <a href="/admin/table?p=${page.number+1}">1</a>
                                    <a href="/admin/table?p=${page.totalPages-1}">Last</a> -->

                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-center">
                                            <!-- First -->
                                            <li  class="page-item text-primary">
                                                <a href="/admin/table?p=0" class="page-link" style="font-size: 14px;"> First </a>
                                            </li>
                                            <!-- Previous -->
                                            <li ng-click="prev()" class="page-item text-primary">
                                                <a href="/admin/table?p=0${page.number-1}" class="page-link" style="font-size: 14px;"> Previous </a>
                                             </li>
                                            <!-- Next -->
                                            <li ng-click="next()" class="page-item text-primary">
                                                <a href="/admin/table?p=0${page.number+1}" class="page-link" style="font-size: 14px;"> Next </a>
                                            </li>
                                            <!-- Last -->
                                            <li ng-click="last()" class="page-item text-primary">
                                                <a href="/admin/table?p=0${page.totalPages-1}" class="page-link" style="font-size: 14px;"> Last </a>
                                            </li>
                                        </ul>
                                    </nav>
                                    
                                    <ul>
                                        <li>Số thực thể hiện tại: ${page.numberOfElements}</li>
                                        <li>Trang số: ${page.number}</li>
                                        <li>Kích thước trang: ${page.size}</li>
                                        <li>Tổng số thực thể: ${page.totalElements}</li>
                                        <li>Tổng số trang: ${page.totalPages}</li>
                                    </ul>
                                	<!-- End Page navigation -->
                                </div>
                            </div>
                        </div>
                        
                        <!-- Edit Product -->
                        <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                            <div class="content">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="card card-user">
                                            <div class="image">

                                            </div>
                                            <div class="card-body">
                                                <div class="author">
                                                    <a href="#">
                                                        <img class="avatar border-gray" src="/static/upload/${item.image}" alt="...">
                                                        <h5 class="title">Chet Faker</h5>
                                                    </a>
                                                    <p class="description">
                                                        @chetfaker
                                                    </p>
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
                                                <form:form action="/admin/table/save" modelAttribute="item" method="post" enctype="multipart/form-data" >
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
                                                        <form:input type="text" class="form-control" path="price" placeholder="Price" />
                                                        <form:errors path="price" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>About</label>
                                                        <form:input type="text" class="form-control" path="about" placeholder="About" />
                                                        <form:errors path="about" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Discount</label>
                                                        <form:input type="text" class="form-control" path="discount" placeholder="Discount" />
                                                        <form:errors path="discount" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Create Date</label>
                                                        <form:input type="text" class="form-control" path="createDate" placeholder="Create Date" />
                                                        <form:errors path="createDate" />
                                                    </div>
        
                                                    <label>Photo</label>
                                                    <input type="file" class="form-control" name="photo" accept="image/png,image/jpeg" />
        
                                                    <div class="form-group">
                                                        <label>Category ID</label>
                                                        <form:input type="text" class="form-control" path="category.id"/>
                                                        <form:errors path="category.id" />
                                                    </div>
                                                    <h6>${message}</h6>

                                                    <form:button type="submit" class="btn btn-primary">Submit</form:button>
                                                    <form:button type="reset" class="btn btn-primary">Cancel</form:button>
                                                </form:form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--  End Edit Product -->
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

