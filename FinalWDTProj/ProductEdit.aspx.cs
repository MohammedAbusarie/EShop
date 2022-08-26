using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace edit_ProdUcT_2021
{
    public partial class edit_prod : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["u_id"] == null || Session["usr_grp_id"].ToString() != "3")
                Response.Redirect("LoginPage.aspx");

            if (!Page.IsPostBack)
                loadCategory();

            if (Request.QueryString["id"] != null)
            {
                btn_submit.Text = "Update";
                load_update_info(Convert.ToInt32(Request.QueryString["id"]));
            }

        }
        protected void load_update_info(int id)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ToString();
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand cmd = new SqlCommand(@"select product.prod_id , product.prod_count, product.prod_create_date , product .prod_description , product.prod_name , product.prod_price , product.prod_thumbnail , product.prod_img , category.cat_name , product.prod_weight
                from product
                Inner join category on product.cat_id = category.cat_id where product.prod_id=" + id.ToString(), connection);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                //load data
                txt_prod_name.Text = dt.Rows[0]["prod_name"].ToString();
                txt_prod_count.Text = dt.Rows[0]["prod_count"].ToString();
                DropDown_Prod_Cat.SelectedValue = dt.Rows[0]["cat_name"].ToString();
                txt_date.Text = Convert.ToDateTime(dt.Rows[0]["prod_create_date"]).ToString("MM.dd.yyyy");
                txt_descrep.Text = dt.Rows[0]["prod_description"].ToString();
                txt_weight.Text = dt.Rows[0]["prod_weight"].ToString();
                txt_price.Text = dt.Rows[0]["prod_price"].ToString();

                // Get your image from database, I hope it is stored in binary format, so it would return a byte array
                byte[] imagem = (byte[])(dt.Rows[0]["prod_thumbnail"]);
                string PROFILE_PIC = Convert.ToBase64String(imagem);

                Image temp_img = new Image();
                temp_img.ImageUrl = String.Format("data:image/jpg;base64,{0}", PROFILE_PIC);
                temp_img.Width = 200;
                temp_img.Height = 200;
                img1.Controls.Add(temp_img);


                imagem = (byte[])(dt.Rows[0]["prod_img"]);
                PROFILE_PIC = Convert.ToBase64String(imagem);
                temp_img = new Image();
                temp_img.ImageUrl = String.Format("data:image/jpg;base64,{0}", PROFILE_PIC);
                temp_img.Width = 200;
                temp_img.Height = 200;
                img2.Controls.Add(temp_img);
                connection.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
        protected void loadCategory()
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ToString();
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                string sql = "select * from category";
                SqlCommand cmd = new SqlCommand(sql, connection);


                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    DropDown_Prod_Cat.Items.Insert(0, new ListItem(reader.GetValue(1).ToString(), reader.GetValue(0).ToString()));
                }
                connection.Close();
            }
            catch (Exception ex)
            {

                Response.Write(ex.ToString());
            }

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                string query=null;
                if (Request.QueryString["id"] == null)
                     query = @"INSERT INTO PRODUCT (prod_name,prod_price,prod_weight,prod_description,prod_img,prod_thumbnail,prod_create_date,prod_count,cat_id)  
                                                        VALUES(@name,@price,@weight,@desc,@img,@thumb,@date,@count,@id)";
                else
                    query = @"Update PRODUCT set prod_name=@name,prod_price=@price,prod_weight=@weight,prod_description=@desc,prod_img=@img,prod_thumbnail=@thumb,prod_create_date=@date,prod_count=@count,cat_id=@id  
                                                        where prod_id="+ Request.QueryString["id"].ToString();

                SqlCommand command = new SqlCommand(query, connection);

                //getting length of uploaded file
                
                int length1 = btn_prod_img.PostedFile.ContentLength;
                int length2 = btn_prod_thumnail.PostedFile.ContentLength;

                //create a byte array to store the binary image data
                byte[] imgbyte1 = new byte[length1];
                byte[] imgbyte2 = new byte[length2];

                //store the currently selected file in memeory
                HttpPostedFile img1htm = btn_prod_img.PostedFile;
                HttpPostedFile img2htm = btn_prod_thumnail.PostedFile;

                //set the binary data
                img1htm.InputStream.Read(imgbyte1, 0, length1);
                img2htm.InputStream.Read(imgbyte2, 0, length2);

                command.Parameters.Add("@name", SqlDbType.VarChar).Value = txt_prod_name.Text;
                command.Parameters.Add("@price", SqlDbType.Decimal).Value = Convert.ToDecimal(txt_price.Text);
                command.Parameters.Add("@weight", SqlDbType.Decimal).Value = Convert.ToDecimal(txt_weight.Text);
                command.Parameters.Add("@desc", SqlDbType.VarChar).Value =txt_descrep.Text;
                command.Parameters.Add("@img", SqlDbType.VarBinary).Value = imgbyte1;
                command.Parameters.Add("@thumb", SqlDbType.VarBinary).Value = imgbyte2;
                command.Parameters.Add("@date", SqlDbType.Date).Value = txt_date.Text;
                command.Parameters.Add("@count", SqlDbType.Int).Value = Convert.ToInt32(txt_prod_count.Text);
                command.Parameters.Add("@id", SqlDbType.Int).Value = DropDown_Prod_Cat.SelectedValue.ToString();

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
                Response.Redirect("ManageProduct.aspx");
            }
            catch (SqlException e1)
            {
                Response.Write(e1.ToString());
            }

        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageProduct.aspx");
        }
    }
}