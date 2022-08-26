<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="FinalWDTProj.ShoppingCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shopping Cart</title>
          <link rel="stylesheet" href="style/p_details.css" />
         <!-- Bootstrap CSS 
        you are using bootstrap5 he used bootstrap??-->
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
         <link rel="preconnect" href="https://fonts.gstatic.com">
         <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
        <style>
            html,body{
            height:100%;
            width: 100%;            
            }
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
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
                  /*--cart items--*/
                  .cart-page{
                      margin:80px auto;
                  }
                  table{
                      width:100%;
                      border-collapse: collapse;
                  }
                  .cart-info{
                      display: flex;
                      flex-wrap: wrap;
                  }
                  th{
                      text-align: left;
                      padding:  5px;
                      color: rgb(248, 248, 248);
                      background-color: #590ca1;
                      font-weight: normal;
                  }
                  td{
                      padding:10px 5px;
                  }
                  td input{
                      width: 60px;
                      height: 30px;
                      padding: 5px;
                  }
                  td a{
                      color: #8183a3;
                      font-size: 12px;
                  }
                  td img{
                      width: 80px;
                      height: 80px;
                      margin-right: 10px;
                  }
                  .total-price{
                      display: flex;
                      justify-content: flex-end;
                  }
                  .total-price table{
                      border-top: 3px solid #590ca1;
                      width: 100%;
                      max-width: 400px;
                  }
                  td:last-child{
                      text-align: right;
                  }
                  th:last-child{text-align: right;

                }
                /* media jquery*/
                @media only screen and (max-width:600px){
                .row{
                    text-align: center;
                }
                .col-2, col-3, col-4{
                    flex-basis: 100%;
                }
                .single-product .row{
                    text-align: left;
                }
                .single-product h1{
                    font-size: 26px;
                    line-height: 32px;
                }
                .cart-info p{
                    display: none;
                }
                }
                .boldText {text-weight: bold}
                .smallText {
                    font-size: smaller;
                }

       </style>
       <meta charset="utf-8">
       <meta name="viewport" content="width=device-width, initial-scale=1">
       <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css">
</head>
<body>
    <form id="form1" runat="server">
            <div class="row">
            <div class=" col">
                <header>
                    <div class="brand-logo">
                        <a><h1 style="color: #fff;margin-top: 15px;"><strong style="font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;"> MIOM </strong> </h1></a>
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
           <!-- Cart items details -->
           <div class="container cart-page">

               <div  id="cart_container" runat="server">
                  
               </div>
           
           <div class="total-price">
               <table>
                   <tr>
                       <td> Subtotal </td>
                       <td>£E&nbsp;<asp:Label ID="lbl_subtotal" runat="server" Text="null"></asp:Label>  </td>
                   </tr>
                   <tr>
                    <td> Tax </td>
                    <td>£E&nbsp;<asp:Label ID="lbl_tax" runat="server" Text="null"></asp:Label>  </td>
                </tr>
                <tr>
                    <td> Total</td>
                    <td>£E&nbsp;<asp:Label ID="lbl_total" runat="server" Text="null"></asp:Label>   </td>
                </tr>
               </table>
               
           </div>
               <div class="row container">
                   <div class="d-flex justify-content-end container mt-2">
                        <asp:LinkButton data-bs-toggle="modal" data-bs-target="#exampleModal" ID="btn_proceed_sale" runat="server" Text="Proceed Sale" CssClass="btn btn-primary w-25 " />
                   </div>
               </div>

           </div>
           
                 <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Alert</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                         Are you sure that you want to order all of the items in the cart?
                      </div>
                      <div class="modal-footer">
                         <asp:Button ID="btn_cancel" runat="server" Text="Cancel" class="btn btn-secondary"  />
                          <asp:Button ID="btn_confirm" runat="server" Text="Confirm" class="btn btn-primary" OnClick="btn_confirm_Click" />
                      </div>
                    </div>
                  </div>
                </div>
             
           
                       
         <script src="Scripts/jquery-3.6.0.min.js">
            
         </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>    
       
    </form>
</body>
</html>
