<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageProduct.aspx.cs" Inherits="FinalWDTProj.ManageProduct" %>

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
       
            <h1 class="d-flex justify-content-center mt-5">Manage Product</h1>
            <br />
            <br />
            <div class="row container d-flex justify-content-center align-items-center text-center">

                <div class="col-12 mb-2">
                     <div class="row">
                         <asp:Button ID="btn_create_product" CssClass="btn btn-success col-3 mx-3" runat="server" Text="Create new Product" OnClick="btn_create_product_Click" />
                     </div>
                </div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ecommConnectionString2 %>" SelectCommand="SELECT * from product"
                 DeleteCommand="DELETE FROM student WHERE p_id = @p_id">
                    <DeleteParameters>
                        <asp:Parameter Name="p_id" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
     

                
                <asp:GridView ID="GridView1" runat="server" PageSize="10" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="prod_id" class="table table-bordered table-condensed table-responsive table-hover" style="font-size:14px;" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging" >
                    <Columns>
                        <asp:BoundField DataField="prod_id" HeaderText="Product ID" />
                        <asp:BoundField DataField="prod_name" HeaderText="Name" />
                        <asp:BoundField DataField="prod_count" HeaderText="Count" />
                        <asp:BoundField DataField="prod_description" HeaderText="Description" />
                        <asp:BoundField DataField="prod_price" HeaderText="Price" />
                        <asp:BoundField DataField="prod_create_date" HeaderText="Create Date" />
                        <asp:BoundField DataField="cat_name" HeaderText="Category Name" />
                        <asp:BoundField DataField="prod_weight" HeaderText="Weight" />
                        <asp:TemplateField HeaderText="Thumbnail">
                            <ItemTemplate>
                                <asp:Image ID="Image1" Width="200px" Height="200px" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="Image2" Width="200px" Height="200px" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField Text="Edit" 
    DataNavigateUrlFields="prod_id" 
    DataNavigateUrlFormatString="~/ProductEdit.aspx?id={0}" ControlStyle-CssClass="btn btn-outline-primary">
<ControlStyle CssClass="btn btn-outline-primary"></ControlStyle>
                    </asp:HyperLinkField>
                    <asp:CommandField ButtonType="Link" ShowDeleteButton="True" ControlStyle-CssClass="btn btn-outline-danger" >
<ControlStyle CssClass="btn btn-outline-danger"></ControlStyle>
                    </asp:CommandField>

                    </Columns>
                    
                </asp:GridView>


            </div>
            
       
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>  
    </form>
</body>
</html>
