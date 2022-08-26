<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeProducts.aspx.cs" Inherits="FinalWDTProj.HomeProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&amp;display=swap" rel="stylesheet">
    <style>
        html,body{
            height:100%;
            width: 100%;            
        }
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        header {
            height: 93%;
            width: 100%;
            float: left;
            background: #590ca1;
            padding: 0 20px;
            color: #fff;
        }
        .brand-logo {
            max-width: 75px;
            float: left;
            padding: 14px 0px;
        }
        .brand-logo img {
            max-width: 100%;
        }
        .navigation {
            margin: 0px;
            float: right;
        }
        .navigation li {
            list-style: none;
            float: left;
        }
        .navigation li a {
            color: #fff;
            padding: 28px 15px;
            text-transform: uppercase;
            text-align: center;
            display: block;
            text-decoration: none;
        }
        .navigation li a i {
            width: 100%;
            font-size: 20px;
            margin-bottom: 7px;
        }
        .show-menu-btn,
        .hide-menu-btn {
            transition: 0.4s;
            font-size: 30px;
            cursor: pointer;
            display: none;
        }
        .show-menu-btn {
            margin: 0px;
            float: right;
        }
        .show-menu-btn i {
            line-height: 100px;
        }
        .navigation a:hover,
        .show-menu-btn:hover,
        .hide-menu-btn:hover {
            color: #d3d4eb;
        }
        #toggle-btn {
            position: absolute;
            visibility: hidden;
            z-index: -1111;
        }

        /*-- Responsive CSS --*/
        @media screen and (max-width:767px) {
        .show-menu-btn,
        .hide-menu-btn {
            display: block;
        }
        .navigation {
            position: fixed;
            width: 100%;
            height: 100vh;
            background: #590ca1;
            top: -100%;
            left: 0;
            padding: 50px 0px;
            transition: 1s;
        }
        .navigation li {
            width: 100%;
        }
        .navigation li a {
            padding: 15px 15px;
            text-align: left;
        }
        .navigation li a i {
            width: auto;
            font-size: 20px;
        }
        .hide-menu-btn {
            position: absolute;
            top: 15px;
            right: 20px;
        }
        #toggle-btn:checked ~ nav .navigation {
            top: 0px;
        }
        }

        /* ---- Card ---- */
        .card {
            width: 250px;
        }
        body {
            background: #eee;
            height:100%;
        }
        a{
            text-decoration:none;
            color: inherit;
        }
        a:hover{
            color: inherit;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btn_search" >
         <div class="row">
            <div class=" col">
                <header>
                    <div class="brand-logo">
                        <a><h1 style="color: #fff;margin-top: 15px; padding-left:17px;"><strong style="font-family:'Poppins', sans-serif;"> MIOM </strong> </h1></a>
                    </div>
            
                    <input type="checkbox" id="toggle-btn">
                    <label for="toggle-btn" class="show-menu-btn"><i class="fas fa-bars"></i></label>
            
                    <nav>
                        <ul class="navigation">
                            <li><a href="HomeProducts.aspx"><i class="fas fa-house-damage"></i> Home</a></li>
                            <li><a href="#"><i class="fab fa-blogger-b"></i> About</a></li>
                            <li><a href="#"><i class="fas fa-question"></i> Support</a></li>
                            <li><a href="#"><i class="fas fa-phone-alt"></i> Contact Us</a></li>
                             <li><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><i class="fas fa-sign-out-alt"></i>Logout</asp:LinkButton></li>
                            <li><a href="ShoppingCart.aspx"><i class="bi bi-cart4" style="font-size: 2rem;"></i><span id="cart_count" runat="server" class="badge rounded-pill bg-light text-dark">0</span> </a></li>
                            
                            <label for="toggle-btn" class="hide-menu-btn"><i class="fas fa-times"></i></label>

                        </ul>
                    </nav>
                </header>
            </div>
            </div>


             <div class="container">
                 <div class="row d-flex justify-content-center align-items-center;" style="margin-top: 20px;">
                    <div class="col-6">
                        <div class="input-group mb-3">
                            <asp:TextBox ID="txt_search" class="form-control" type="search" placeholder="Search" aria-label="Search" runat="server"></asp:TextBox>
                            <asp:LinkButton class="btn btn-outline-secondary" ID="btn_search" runat="server" Text="" OnClick="btn_search_Click" >
                                <i class="bi bi-search"></i>
                            </asp:LinkButton>
                          </div>
                    </div>
               </div>
                <div class="row container" id="mom" runat="server">

                </div>
                 
             </div>
    </form>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">
    </script>
</body>
</html>
