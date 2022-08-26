<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductEdit.aspx.cs" Inherits="edit_ProdUcT_2021.edit_prod" %>

<!DOCTYPE html>

  <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="edit-prod.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">

        <style>

            html,body{
                height:100%;
                width: 100%;
                font-family: 'Poppins';    
                font-size:14px;
            }
        </style>
    </head>
        <body>
            <div class="container" style=" font-family: 'Poppins', Helvetica, sans-serif;">
               <div class="row" style="margin-top: 20px;">
               <h1 class="d-flex justify-content-center" style="font-family: 'Poppins', sans-serif ; margin-top: 10px; margin-bottom: 20px;">  Product </h1>
             </div>
             <div class="d-flex justify-content-center align-items-center">
                <form class=" needs-validation" novalidate runat="server">
                 <div class="row">
                        <div class="col-7" >
                            <label for="txt_prod_name" class="form-label">  Name </label>
                            <asp:TextBox ID="txt_prod_name" runat="server" required class="form-control"></asp:TextBox>
      
                              <div class="valid-feedback">
                                Thanks!
                              </div>
                              <div class="invalid-feedback">
                                Please provide a valid Name.
                              </div>
                        </div>
                <div class="col-3">
                        <label for="txt_price" class="form-label">Price</label>
                         <asp:TextBox ID="txt_price" runat="server" class="form-control" TextMode="Number" value="" min="1" required></asp:TextBox>
                        
                        <div class="valid-feedback">
                            Thanks!
                          </div>
                        <div class="invalid-feedback">
                            Please provide a valid Price.
                          </div>
                    </div>
                 <div class="col-2">
                        <label for="txt_weight" class="form-label"> Weight</label>
                     <asp:TextBox ID="txt_weight" runat="server" TextMode="Number"  class="form-control" value="" min="1" required></asp:TextBox>
                        <div class="valid-feedback">
                            Thanks!
                          </div>
                        <div class="invalid-feedback">
                            Please provide a valid Weight.
                          </div>
                    </div>
                    
                    
                </div>   
                 <div class="row">
                  <div class="col-4" style="margin-bottom: 20px;">
                    <label for="DropDown_Prod_Cat" class="form-label" aria-label="Default select example"> Category Name </label>
                      <asp:DropDownList ID="DropDown_Prod_Cat" runat="server" class="form-select" AutoPostBack="false"></asp:DropDownList>
                  <div class="valid-feedback">
                      Thanks!
                    </div>
                  <div class="invalid-feedback">
                      Please Select a Category Name.
                    </div>
          </div>
          <div class="col-4">
            <label for="txt_date" class="form-label">Date </label>
              <asp:TextBox ID="txt_date" runat="server" TextMode="Date" class="form-control" value="" required></asp:TextBox>
            <div class="valid-feedback">
                Thanks!
              </div>
            <div class="invalid-feedback">
                Please provide a valid Date.
              </div>
        </div>
                <div class="col-2">
                    <label for="txt_prod_count" class="form-label"> Count </label>
                    <asp:TextBox ID="txt_prod_count" runat="server" min="0" class="form-control" value="" required TextMode="Number"></asp:TextBox>           
                    <div class="valid-feedback">
                        Thanks!
                      </div>
                    <div class="invalid-feedback">
                        Please provide a valid Count.
                      </div>
                </div>
                          
               </div>

<!--startttttttttttt-->


            <div class="row" style="margin-left: 10px;">
              <div class="col-6">
                <label for="img1">  Product Thumbnail </label>
                  <div id="img1" runat="server" class="row" style=" width: 200px; height: 200px; border: 3px rgb(202, 197, 198); border-style:dashed;" >

                  </div>
              </div>
              <div class="col-6">

                <label for="img2" class="col-6">  Product Image </label>
                  <div id="img2" runat="server" class="col-6" style=" width: 200px; height: 200px; border: 3px rgb(202, 197, 198); border-style:dashed;">

                  </div>
               
                 
              </div>
 
            </div>

            <div class="row">

              <div class="col">
                  <asp:FileUpload ID="btn_prod_thumnail" runat="server"  class="form-control w-50"  style="margin-left:8%;" />
              </div>
               
              <div class="col">
                  <asp:FileUpload ID="btn_prod_img" runat="server"  class="form-control w-50" style="margin-left:8%;" required />
              </div>
             

            </div>
<!--stoppppppppp-->





             <div class="row mt-2"> 
              <div class="col-7 ">
                <div class="form-outline">
                  <label for="txt_descrep" class="form-label"> Description</label>
                    <asp:TextBox ID="txt_descrep" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
                 </div>
                  <div class="valid-feedback">
                        Thanks!
                  </div>
                  <div class="invalid-feedback">
                        Please provide a valid Description.
                  </div>
              </div>
              <div class="col-1 d-flex align-items-end">
                  <asp:Button ID="btn_submit" runat="server" Text="Submit" class="btn btn-primary"  style="margin-top: 20px;margin-left: 3px;" OnClick="btn_submit_Click" />
             </div>     
              <div class="col-1 d-flex align-items-end">
                  <asp:Button ID="btn_cancel" runat="server" Text="Cancel" class="btn btn-primary" style="margin-top: 20px; margin-left: 42px;" OnClick="btn_cancel_Click" />
                  
                </div>
            </div>
 
                </form>
            </div>
                
          <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                <script language="javascript" type="text/javascript">
                    $(function () {
                        $("#btn_prod_thumnail").change(function () {
                            $("#img1").html("");
                            var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                            if (regex.test($(this).val().toLowerCase())) {
                                if ($.browser.msie && parseFloat(jQuery.browser.version) <= 9.0) {
                                    $("#img1").show();
                                    $("#img1")[0].filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = $(this).val();
                                }
                                else {
                                    if (typeof (FileReader) != "undefined") {
                                        $("#img1").show();
                                        $("#img1").append("<img />");
                                        var reader = new FileReader();
                                        reader.onload = function (e) {
                                            $("#img1 img").attr("src", e.target.result);
                                            $("#img1 img").css('width', 200);
                                            $("#img1 img").css('height', 200);
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
                        $("#btn_prod_img").change(function () {
                            $("#img2").html("");
                            var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                            if (regex.test($(this).val().toLowerCase())) {
                                if ($.browser.msie && parseFloat(jQuery.browser.version) <= 9.0) {
                                    $("#img2").show();
                                    $("#img2")[0].filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = $(this).val();
                                }
                                else {
                                    if (typeof (FileReader) != "undefined") {
                                        $("#img2").show();
                                        $("#img2").append("<img />");
                                        var reader = new FileReader();
                                        reader.onload = function (e) {
                                            $("#img2 img").attr("src", e.target.result);
                                            $("#img2 img").css('width', 200);
                                            $("#img2 img").css('height', 200);
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