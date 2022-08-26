using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalWDTProj
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cart_count.InnerText = getProdCount().ToString();

            if (Session["usr_grp_id"].ToString() != "4")
                Response.Redirect("LoginPage.aspx");


            if (Request.QueryString["id"] != null)
            {
                load_details(Convert.ToInt32(Request.QueryString["id"]));
            }
            else
            {
                btn_add_to_cart.Visible = false;   
            }

        }

        void load_details(int id)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ToString();
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand cmd = new SqlCommand(@"select product.prod_count , product .prod_description , product.prod_name , product.prod_price , product.prod_thumbnail , product.prod_img , product.prod_weight
                from product
                where product.prod_id=" + id.ToString(), connection);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                //load data
                lbl_prod_name.Text = dt.Rows[0]["prod_name"].ToString();
                lbl_prod_count.Text = dt.Rows[0]["prod_count"].ToString();
                lbl_prod_price.Text = dt.Rows[0]["prod_price"].ToString();
                lbl_prod_description.Text = dt.Rows[0]["prod_description"].ToString();
                lbl_prod_weight.Text = dt.Rows[0]["prod_weight"].ToString();

                // Get your image from database, I hope it is stored in binary format, so it would return a byte array
                byte[] imagem = (byte[])(dt.Rows[0]["prod_img"]);
                string PROFILE_PIC = Convert.ToBase64String(imagem);

                Image temp_img = new Image();
                temp_img.ImageUrl = String.Format("data:image/jpg;base64,{0}", PROFILE_PIC);
                temp_img.Width = 250;
                temp_img.Height = 300;
                img1.Controls.Add(temp_img);

                connection.Close();

            }
            catch(Exception ex)
            {
                lbl_prod_name.Text = ex.ToString();
            }

        }

        bool can_add(int pid,int curr_count)
        {
            string sql = "select prod_count from product where prod_id="+pid.ToString();
            string connectionString = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            int max_count = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();

            if( curr_count < max_count )
            {
                return true;
            }
            else 
            { 
                return false; 
            }

        }

        int getProdCount()
        {
            if(Session["list_pids"]!=null)
            {
                List<int> list_pids = (List<int>)Session["list_pids"];
                return list_pids.Count;
            }
            else
            {
                return 0;
            }
        }

        protected void btn_add_to_cart_Click(object sender, EventArgs e)
        {
            cart_count.InnerText = getProdCount().ToString();
            List<int> list_pids = new List<int>();
            List<int> list_pcount = new List<int>();

            int prod_id = Convert.ToInt32(Request.QueryString["id"]);
            if (Session["list_pids"] != null)
            {
                list_pids = (List<int>)Session["list_pids"];
                list_pcount = (List<int>)Session["list_pcount"];
            }

            int prod_index = list_pids.FindIndex(x=> x==prod_id);
            if (prod_index == -1)
            {
                list_pids.Add(prod_id);
                list_pcount.Add(1);
            }
            else if(can_add(prod_id, list_pcount[prod_index]))
            {
                list_pcount[prod_index] +=1;

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Max limit reached can't add more of this item!')", true);
            }

            pi.DataSource = list_pids;
            pc.DataSource = list_pcount;

            pi.DataBind();
            pc.DataBind();


            Session["list_pids"]= list_pids;
            Session["list_pcount"]= list_pcount;

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LoginPage.aspx");
        }
    }
}