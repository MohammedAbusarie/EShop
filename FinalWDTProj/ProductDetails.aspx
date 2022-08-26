<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="FinalWDTProj.ProductDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <link rel="stylesheet" href="style/p_details.css" />
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
         <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">

         <!-- Bootstrap CSS 
        you are using bootstrap5 he used bootstrap??-->
        <style>
              html,body{
                height:100%;
                width: 100%;            
            }
            * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins';
}
header {
    height: 100%;
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

        </style>

    </head>
<body>
    <form id="form1" runat="server">
        
        <div class="row">
                <div class=" col">
                    <header>
                        <div class="brand-logo">
                            <a><h1 style="color: #fff;margin-top: 15px;"><strong style="font-family:'Poppins', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;"> MIOM </strong> </h1></a>
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
                                <li><a href="ShoppingCart.aspx"><i class="bi bi-cart4" style="font-size: 2rem;"></i><span id="cart_count" runat="server" class="badge rounded-pill bg-light text-dark shopping-cart">0</span> </a></li>
                                
                                <label for="toggle-btn" class="hide-menu-btn"><i class="fas fa-times"></i></label>
                            </ul>
                        </nav>
                    </header>
                </div>
              </div>
        <br />
        <br />
        <br />
                <div class="container">
                <div class="row d-flex justify-content-center align-items-center" style="margin-top: 30px;">
                    <div class="col-4">
                        <div id="img1" runat="server" style=" width: 250px; height: 300px; border: 3px rgb(202, 197, 198); border-style:dashed;margin-right: 10px;" >
                        </div>
                    </div>
                    
                    <div class="col-4">
                        <div class="row">
                        <span><strong>Name</strong>  <asp:Label ID="lbl_prod_name" runat="server" Text="null"></asp:Label>  </span>
                        </div>
                        <div class="row">
                        <span><strong>Price</strong><span> <asp:Label ID="lbl_prod_price" runat="server" Text="null"></asp:Label> EGP</span></span>
                        </div>
                        <div class="row">
                        <span><strong>Weight</strong> <span> <asp:Label ID="lbl_prod_weight" runat="server" Text="null"></asp:Label> Kg</span></span>
                        </div>
                        <div class="row">
                        <span><strong>InStock</strong> <span> <asp:Label ID="lbl_prod_count" runat="server" Text="null"></asp:Label> PCS</span></span>
                        </div>

                        <div class="row" style="margin-top: 89px;">
                            <div class="col">
                                <hr style="border: 1px solid #a09d9d;">
                            </div>
                            </div> 
                            <div>
                                <h6> <strong> Product Description </strong> </h6>
                                <h6>
                                      <asp:Label ID="lbl_prod_description" runat="server" Text="null"></asp:Label>
                                </h6>
                            </div> 

                     </div>

                    
                    <div class="col-4">
                        <asp:LinkButton ID="btn_add_to_cart" OnClick="btn_add_to_cart_Click" class="btn btn-success add-to-cart" style="margin-bottom: 121px; margin-left: 150px;" runat="server">
                            <strong>ADD TO CART</strong>
                        </asp:LinkButton>
 
                            <div class="col">
                                <hr style="border: 1px solid #a09d9d;">
                            </div>
                            <h6 style=" margin-left: 150px;"> <strong> Condition: </strong> New </h6>
                            <h6 style=" font-family: 'Poppins', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; margin-left: 150px;"> <strong> Sold By: </strong > MIOM </h6>
                    </div>
                    </div>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    <asp:DropDownList ID="pi" runat="server"></asp:DropDownList>
                    <asp:DropDownList ID="pc" runat="server"></asp:DropDownList>

                     </div>  


                      
                       
         <script src="Scripts/jquery-3.6.0.min.js">
            
         </script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>      
        <script>
 
        </script>
    </form>
</body>
</html>
