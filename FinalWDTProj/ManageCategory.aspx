<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageCategory.aspx.cs" Inherits="FinalWDTProj.CategoryTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btn_search">
        <div class="container">
            <h1 class="d-flex justify-content-center mt-5">Manage Category</h1>
            <br />
            <br />
            <div class="row container d-flex justify-content-center align-items-center text-center">

                <div class="col-12 mb-2">
                     <div class="row">
                         <div class="input-group mb-3">
                         <asp:Button ID="btn_create_cat" CssClass="btn btn-success col-2 mx-3" runat="server" Text="Create New Category" OnClick="btn_create_cat_Click" />
                         <button class="btn btn-secondary mx-2"><a href="AdminPage.aspx" style="text-decoration:none;color:white;">Back</a></button>
                            <asp:TextBox  ID="txt_search" class="form-control" type="search" placeholder="Search" aria-label="Search" runat="server"></asp:TextBox>
                            <asp:LinkButton class="btn btn-outline-secondary" ID="btn_search" runat="server" Text="" OnClick="btn_search_Click"  >
                                <i class="bi bi-search"></i>
                            </asp:LinkButton>
                          </div>
                     </div>
                </div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ecommConnectionString2 %>" 
                ></asp:SqlDataSource>

                <asp:GridView ID="GridView1" runat="server" class="table table-bordered table-condensed table-responsive table-hover "  AutoGenerateColumns="False" DataKeyNames="cat_id" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" PageSize="5" AllowPaging="True" >
                <Columns>
                    <asp:BoundField DataField="cat_name" HeaderText="Category Name" SortExpression="cat_name" />
                    <asp:BoundField DataField="cat_description" HeaderText="Category Description" SortExpression="cat_description" />
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" Width="200px" Height="200px" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:HyperLinkField Text="Edit" 
    DataNavigateUrlFields="cat_id" 
    DataNavigateUrlFormatString="~/CategoryEdit.aspx?id={0}" ControlStyle-CssClass="btn btn-outline-primary">
<ControlStyle CssClass="btn btn-outline-primary"></ControlStyle>
                    </asp:HyperLinkField>
                    <asp:CommandField ButtonType="Link" ShowDeleteButton="True" ControlStyle-CssClass="btn btn-outline-danger" >
<ControlStyle CssClass="btn btn-outline-danger"></ControlStyle>
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
            </div>
            
        </div>
    </form>
</body>
</html>
