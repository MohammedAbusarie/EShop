<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="FinalWDTProj.AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="bootstrap-5.0.1-dist\css\bootstrap.min.css">
    <style>
        html,body{
            height:100%;
        }
        .pad{
            margin-right:27px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" >
            <div class="row text-center mt-4 mb-4">
                <h1>Admin Panel</h1>
            </div>
            <div class="container px-4 d-flex justify-content-center align-items-center">
            
            <div  class="row gy-5">
                    <div class="pad card col-4" style="width: 18rem;">
                      <img src="assets\prod.png" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title">Manage Products</h5>
                        <p class="card-text">Perform CRUD Operations on the products table.</p>
                        <a href="ManageProduct.aspx" class="btn btn-primary">View Page</a>
                      </div>
                    </div>
                <div class="pad card col-4" style="width: 18rem;">
                      <img src="assets\user.png" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title">Manage Users</h5>
                        <p class="card-text">Perform CRUD Operations on the users table.</p>
                        <a href="ManageUsers.aspx" class="btn btn-primary">View Page</a>
                      </div>
                    </div>
                <div class="pad card col-4" style="width: 18rem;">
                      <img src="assets\category.png" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title">Manage Categories</h5>
                        <p class="card-text">Perform CRUD Operations on the caetgories table.</p>
                        <a href="ManageCategory.aspx" class="btn btn-primary">View Page</a>
                      </div>
                    </div>
             
            </div>

            </div>

    </form>
</body>
</html>
