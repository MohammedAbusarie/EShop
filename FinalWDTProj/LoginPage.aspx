<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="FinalWDTProj.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign In</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    
         <!-- Sign in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="images/signin-image.jpg" alt="sing up image"></figure>
                        <a href="SignupPage.aspx" class="signup-image-link">Create an account</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign in</h2>
                        <form runat="server" class="register-form" id="login_form">
                          
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-email"></i></label>
                                <asp:TextBox ID="txt_email" runat="server" placeholder="Your Email"></asp:TextBox>
                                
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <asp:TextBox ID="txt_pass" runat="server" placeholder="Password"></asp:TextBox>
                              
                            </div>
                            <div class="form-group">
                          
                                <div class="container">
                                    <asp:CheckBox name="remember-me" ID="rememberme" class="agree-term" runat="server" />
                                </div>
                                
                            </div>
                            <div class="form-group form-button">
                                <asp:Button ID="btn_lgn" runat="server" Text="Login" class="form-submit" OnClick="btn_lgn_Click"  />
                            </div>
                        </form>
                        <div class="social-login">
                            <span class="social-label">Or login with</span>
                            <ul class="socials">
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>


    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
 
</body>
</html>
