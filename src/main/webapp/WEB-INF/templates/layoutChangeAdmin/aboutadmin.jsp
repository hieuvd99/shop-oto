<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Login</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        
    </style>
</head>
<body>
	<div class="content">
        <div class="row">
            <div class="col-md-4">
                <div class="card card-user">
                    <div class="image">
    
                    </div>
                    <div class="card-body">
                        <div class="author">
                            <a href="#">
                                <img class="avatar border-gray " src="/static/upload/team_05.jpg" alt="...">
                                <h5 class="title text-left">${item.username}</h5>
                            </a>
                        </div>
                    </div>
                    <div class="card-footer">
                        <hr>
                        <div class="button-container">
                            <div class="row">
                                <div class="col-lg-3 col-md-6 col-6 ml-auto">
                                    <h5>12<br><small>Files</small></h5>
                                </div>
                                <div class="col-lg-4 col-md-6 col-6 ml-auto mr-auto">
                                    <h5>2GB<br><small>Used</small></h5>
                                </div>
                                <div class="col-lg-3 mr-auto">
                                    <h5>24,6$<br><small>Spent</small></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card card-user">
                    <div class="card-header">
                        <h5 class="card-title">Edit Profile</h5>
                    </div>
                    <div class="card-body">
                        <form:form action="/account/about/save" modelAttribute="item" method="post">
                            <div class="row">
                                <div class="col-md-5 pr-1">
                                    <div class="form-group">
                                        <label>ID</label>
                                        <form:input type="text" class="form-control" disabled=""  placeholder="${item.id}"  path="id"/>
                                        <form:errors path="id" />
                                    </div>
                                </div>
                                <div class="col-md-5 pr-1">
                                    <div class="form-group">
                                        <label>Username</label>
                                        <form:input type="text" class="form-control"  placeholder="${item.username}"  path="username"/>
                                        <form:errors path="username" />
                                    </div>
                                </div>
                                <div class="col-md-5 pr-1">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <form:input type="text" class="form-control"  placeholder="${item.email}"  path="email"/>
                                        <form:errors path="email" />
                                    </div>
                                </div>
                                <div class="col-md-5 pr-1">
                                    <div class="form-group">
                                        <label>Password</label>
                                        <form:input  type="password" class="form-control" name="Password" placeholder="Password"  path="password"/>
                                        <form:errors path="password" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 pr-1">
                                    <div class="form-group">
                                        <label>FullName</label>
                                        <form:input type="text" class="form-control" placeholder="${item.fullname}" path="fullname" />
                                    </div>
                                </div>
                                <div class="col-md-6 pl-1">
                                    <div class="form-group">
                                        <label>Phone</label>
                                        <form:input type="integer" class="form-control" placeholder="${item.phone}" path="phone" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Address</label>
                                        <form:input type="text" class="form-control" placeholder="${item.address}" path="address"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Photo</label>
                                        <form:input type="text" class="form-control" placeholder="${item.photo}" path="photo"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="update ml-auto mr-auto">
                                    <form:button type="submit" class="btn btn-primary btn-round">Update Profile</form:button>
                                </div>
                                <h6>${message}</h6>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
