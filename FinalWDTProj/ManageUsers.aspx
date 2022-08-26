<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="FinalWDTProj.ManageUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1 class="d-flex justify-content-center mt-5">Manage Users</h1>
            <br />
            <br />
            <div class="row container d-flex justify-content-center align-items-center text-center">

                <div class="col-12 mb-2">
                     <div class="row">
                         <asp:Button ID="btn_create_cat" CssClass="btn btn-success col-2 mx-3" runat="server" Text="Create new user" OnClick="btn_create_cat_Click"  />
                     </div>
                </div>


     

                
                <asp:GridView ID="GVusers" runat="server" PageSize="15" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="u_id" class="table table-bordered table-condensed table-responsive table-hover "  OnRowDataBound="GVusers_RowDataBound" OnRowDeleting="GVusers_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="u_id" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="u_id" />
                        <asp:BoundField DataField="u_name" HeaderText="Username" SortExpression="u_name" />
                        <asp:BoundField DataField="u_email" HeaderText="Email" SortExpression="u_email" />
                        <asp:BoundField DataField="u_pass" HeaderText="Password" SortExpression="u_pass" />
                        <asp:BoundField DataField="u_phone" HeaderText="Phone" SortExpression="u_phone" />
                        <asp:BoundField DataField="u_country" HeaderText="Country" SortExpression="u_country" />
                        <asp:BoundField DataField="u_ads" HeaderText="Address" SortExpression="u_ads" />
                        <asp:BoundField DataField="user_group_name" HeaderText="User Group Name" SortExpression="user_group_name" />
                        <asp:HyperLinkField Text="Edit" 
                            DataNavigateUrlFields="u_id" 
                            DataNavigateUrlFormatString="~/UsersEdit.aspx?id={0}" ControlStyle-CssClass="btn btn-outline-primary">
                            <ControlStyle CssClass="btn btn-outline-primary"></ControlStyle>
                        </asp:HyperLinkField>
                        <asp:CommandField ButtonType="Link" ShowDeleteButton="True" ControlStyle-CssClass="btn btn-outline-danger" />
                        
                    </Columns>

                </asp:GridView>


            </div>
            
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>  
</body>
</html>
