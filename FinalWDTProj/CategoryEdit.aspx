<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategoryEdit.aspx.cs" Inherits="FinalWDTProj.Category" %>


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
    </head>
        <body>
            <div class="container" >
                <div class="row" style="margin-top: 20px;">
                <h1 class="d-flex justify-content-center" style=" margin-top: 50px; margin-bottom: 50px;">Product Category</h1>
              </div>
              <div class="d-flex justify-content-center align-items-center">
              <form class=" needs-validation " runat="server" novalidate>
                <div class="row">
                    <div class="col-6" >
                        <div class="row ">
                            <label for="validationCustom01" class="form-label">  Name </label>
                            <asp:TextBox ID="txt_cat_name" runat="server" class="form-control" required></asp:TextBox>
                     
                          <div class="valid-feedback">
                              Thanks!
                          </div>
                          <div class="invalid-feedback">
                              Please provide a valid Name.
                          </div>
                        </div>

                        <div class="row mt-3">
                         
                            <div class="form-outline">
                              <label for="validationCustom04" class="form-label"> Description</label>
                                <asp:TextBox ID="txt_cat_description" class="form-control w-100" runat="server" TextMode="MultiLine" rows="4" cols="10"></asp:TextBox>
                                
                             </div>
                              <div class="valid-feedback">
                                    Thanks!
                              </div>
                              <div class="invalid-feedback">
                                    Please provide a valid Description.
                              </div>
                           
                        </div>
                     </div>
                       <div class="col-6 justify-content-center"   >
                        <div class="row justify-content-center">
                          <label for="img_cat" class="justify-content-center" style="margin-left: 70%;;">  Product Thumbnail </label>
                            <div id="img_cat" runat="server" class="row" style=" width: 200px; height:200px; border: 3px rgb(202, 197, 198); border-style:dashed;margin-left: 100px;" >

                            </div>         
                        </div>
                        <div class="row">
                           <asp:FileUpload ID="btn_upload_cat_img" runat="server" style="margin-left: 40%;" class="form-control w-50"/>
                        </div>
                      </div> 
                </div>
                       
                <div class="row d-flex justify-content-center align-items-center">
                    <div class="col">
                        <asp:Button ID="btn_submit" runat="server" Text="Submit" class="btn btn-primary"  style="margin-top: 20px; margin-left: 2px;" OnClick="B_submit_Click" />
                        <asp:Button ID="btn_cancel" runat="server"  type="reset" Text="Cancel" class="btn btn-primary"  style="margin-top: 20px; margin-left: 10px;" OnClick="btn_cancel_Click" />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ecommConnectionString %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
                    </div>
                  </div>  
              </form>
            </div>
            </div>


                  
            <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                <script language="javascript" type="text/javascript">
                $(function () {
                    $("#btn_upload_cat_img").change(function () {
                        $("#img_cat").html("");
                        var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                        if (regex.test($(this).val().toLowerCase())) {
                            if ($.browser.msie && parseFloat(jQuery.browser.version) <= 9.0) {
                                $("#img_cat").show();
                                $("#img_cat")[0].filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = $(this).val();
                            }
                            else {
                                if (typeof (FileReader) != "undefined") {
                                    $("#img_cat").show();
                                    $("#img_cat").append("<img />");
                                    var reader = new FileReader();
                                    reader.onload = function (e) {
                                        $("#img_cat img").attr("src", e.target.result);
                                        $("#img_cat img").css('width', 200);
                                        $("#img_cat img").css('height', 200);
                                    }
                                    reader.readAsDataURL($(this)[0].files[0]);
                                } else {
                                    alert("This browser does not support FileReader.");
                                }
                            }
                        } else {
                            alert("Please upload a valid image file.");
                        }
                    });
                });
                </script>
              <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>      
        </body>
</html>