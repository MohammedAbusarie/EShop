using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalWDTProj
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["u_id"] == null || Session["usr_grp_id"].ToString() !="3")
                Response.Redirect("LoginPage.aspx");

            if (Request.QueryString["id"]!=null && !Page.IsPostBack)
            {
                btn_submit.Text = "Update";
                load_update_info( Convert.ToInt32(Request.QueryString["id"]));
            }
            

        }
        public void load_update_info(int id)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from category where cat_id=" + id.ToString(), connection);
            //SqlDataReader reader = cmd.ExecuteReader();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            //load data
            txt_cat_name.Text = dt.Rows[0]["cat_name"].ToString();
            txt_cat_description.Text = dt.Rows[0]["cat_description"].ToString();
            // Get your image from database, I hope it is stored in binary format, so it would return a byte array
            byte[] imagem = (byte[])(dt.Rows[0]["cat_thumbnail"]);
            string PROFILE_PIC = Convert.ToBase64String(imagem);

            Image temp_img = new Image();
            temp_img.ImageUrl= String.Format("data:image/jpg;base64,{0}", PROFILE_PIC);
            temp_img.Width = 200;
            temp_img.Height = 200;
            img_cat.Controls.Add(temp_img);
            connection.Close();
        }

        public byte[] ImageToByteArray(System.Drawing.Image imageIn)
        {
            using (var ms = new MemoryStream())
            {
                imageIn.Save(ms, imageIn.RawFormat);
                return ms.ToArray();
            }
        }
        protected void B_submit_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);
            //getting length of uploaded file
            int length = btn_upload_cat_img.PostedFile.ContentLength;

            //create a byte array to store the binary image data
            byte[] imgbyte = new byte[length];

            //store the currently selected file in memeory
            HttpPostedFile img = btn_upload_cat_img.PostedFile;

            //set the binary data
            img.InputStream.Read(imgbyte, 0, length);

            string query;
            if (btn_submit.Text != "Update")
                query = "INSERT INTO category (cat_name,cat_description,cat_thumbnail) VALUES(@name,@des,@thumb)";
            else
                query = "Update category set cat_name= @name ,cat_description = @des ,cat_thumbnail=@thumb where cat_id="+ Request.QueryString["id"].ToString();
            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.Add("@name", SqlDbType.VarChar).Value = txt_cat_name.Text;
            command.Parameters.Add("@des", SqlDbType.VarChar).Value = txt_cat_description.Text;
            command.Parameters.Add("@thumb", SqlDbType.VarBinary).Value = imgbyte;

          
            try
            {
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
                Response.Redirect("ManageCategory.aspx");
            }
            catch (SqlException e1)
            {
                string x = "Error Generated. Details: " + e1.ToString();
            }

            //Label1.Text = System.Text.Encoding.Default.GetString(imgbyte); ;
        }

       

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageCategory.aspx");
        }
    }
}