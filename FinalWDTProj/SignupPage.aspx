<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignupPage.aspx.cs" Inherits="FinalWDTProj.SignupPage" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

         <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form  class="register-form" id="register_form" runat="server">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <asp:TextBox ID="txt_name" runat="server" name="name" placeholder="Your Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Enter your name" ControlToValidate="txt_name" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <asp:TextBox ID="txt_email" runat="server" name="email" placeholder="Your Email" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Enter your Email" ControlToValidate="txt_email" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="phone"><i class="zmdi zmdi-phone"></i></label>
                                <asp:TextBox ID="txt_phone" runat="server" name="phone" placeholder="Enter your phone number" TextMode="Phone"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Enter your Phone" ControlToValidate="txt_phone" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="ads"><i class="zmdi zmdi-format-list-bulleted"></i></label>
                                <asp:TextBox ID="txt_ads" runat="server" name="ads" placeholder="Enter your address"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Enter your Address" ControlToValidate="txt_ads" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <asp:TextBox ID="txt_pass" runat="server" name="pass" placeholder="Password" ControlToValidate="txt_pass" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Enter your password" ControlToValidate="txt_pass" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </div>
                            

                            <div class="form-group form-button">
                                <asp:Button ID="btn_signup" runat="server" name="signup" class="form-submit" Text="Register" OnClick="btn_signup_Click"></asp:Button>
                            </div>
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="LoginPage.aspx" class="signup-image-link">I am already member>
                    </div>

</body>
</html>
