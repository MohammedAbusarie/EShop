<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersEdit.aspx.cs" Inherits="edit_ProdUcT_2021.Personal_info" %>

<!DOCTYPE html>

  <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&amp;display=swap" rel="stylesheet">
        <style>
         html,body{
                height:100%;
                width: 100%;
                font-family: 'Poppins', sans-serif;
                  }
        </style>
        <body>
            <div class="container" >
                <div class="row" style="margin-top: 20px;">
                <h1 class="d-flex justify-content-center" style=" margin-top: 50px; margin-bottom: 50px;">User Info</h1>
              </div>
              <div class="d-flex justify-content-center align-items-center">
                <form class=" needs-validation " novalidate runat="server">
                    <div class="row p-2">
                    <div class="col-4" >
                        <label for="txt_person_name" class="form-label">  Name </label>
                        <asp:TextBox ID="txt_person_name" runat="server" class="form-control" required></asp:TextBox>
                        <div class="valid-feedback">
                            Thanks!
                          </div>
                        <div class="invalid-feedback">
                            Please provide a valid Name.
                          </div>
                    </div>
                    <div class="col-4" >
                        <label for="txt_person_email" class="form-label">  Email </label>
                        <asp:TextBox ID="txt_person_email" runat="server" TextMode="Email" class="form-control" required></asp:TextBox>
                       <div class="valid-feedback">
                            Thanks!
                          </div>
                        <div class="invalid-feedback">
                            Please provide a valid Name.
                          </div>
                    </div>
                    <div class="col-3" >
                        <label for="txt_person_pass" class="form-label">  Password </label>
                        <asp:TextBox ID="txt_person_pass" runat="server" class="form-control" required></asp:TextBox>
                        <div class="valid-feedback">
                            Thanks!
                          </div>
                        <div class="invalid-feedback">
                            Please provide a valid Name.
                          </div>
                    </div>
                </div>
                <div class="row p-2">
                    <div class="col-4" >
                        <label for="txt_person_phone" class="form-label"> Phone </label>
                        <asp:TextBox ID="txt_person_phone" runat="server" TextMode="Phone" class="form-control" required></asp:TextBox>
                        <div class="valid-feedback">
                            Thanks!
                          </div>
                        <div class="invalid-feedback">
                            Please provide a valid Name.
                          </div>
                    </div>
                    <div class="col-3" >
                        <label for="lst_person_country" class="form-label"> Country </label>
                        <asp:DropDownList ID="lst_person_country" runat="server" class="form-select" required>
                            <asp:ListItem Selected="True">Egypt</asp:ListItem>
                            <asp:ListItem>KSA</asp:ListItem>
                            <asp:ListItem>UAE</asp:ListItem>
                        </asp:DropDownList>
                        
                        <div class="valid-feedback">
                            Thanks!
                          </div>
                        <div class="invalid-feedback">
                            Please provide a valid Name.
                          </div>
                    </div>

                    <div class="col">
                        <label for="lst_usrgroup" class="form-label"> User Group </label>
                        <asp:DropDownList ID="lst_usrgroup" runat="server" class="form-select" required OnSelectedIndexChanged="lst_usrgroup_SelectedIndexChanged" AutoPostBack="True">
                           
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row p-2">
                    <div class="col-6">
                        <div class="form-outline">
                          <label for="txt_address" class="form-label">Address</label>
                            <asp:TextBox ID="txt_address" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                         </div>
                          <div class="valid-feedback">
                                Thanks!
                          </div>
                          <div class="invalid-feedback">
                                Please provide a valid Address.
                          </div>
                        </div>  
                    </div>
                            <div class="row">
                            <div class="col-1">
                                <asp:Button ID="btn_pers_submit" type="reset" runat="server" Text="Submit" class="btn btn-primary" style="margin-top: 20px; margin-left: 10px;" OnClick="btn_pers_submit_Click"  />
                            </div>
                               <div class="col">
                                   <asp:Button ID="btn_pers_cancel" runat="server" Text="Cancel" class="btn btn-primary" style="margin-top: 20px; margin-left: 25px; margin-left: 40px;" OnClick="btn_pers_cancel_Click"/>
                            </div>
                        </div>
                          
                    

                    </form>
                    </div>
                    </div>
                    
              

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>      
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ecommConnectionString %>" SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
        </body>
        </head>
        </html>