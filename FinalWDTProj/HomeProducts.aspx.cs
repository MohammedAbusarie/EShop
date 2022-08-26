using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace FinalWDTProj
{
    public partial class HomeProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cart_count.InnerText = getProdCount().ToString();
            if (Session["usr_grp_id"].ToString() != "4")
                Response.Redirect("LoginPage.aspx");

            if (!Page.IsPostBack)
            {
                load_products(null);
            }

        }
        int getProdCount()
        {
            if (Session["list_pids"] != null)
            {
                List<int> list_pids = (List<int>)Session["list_pids"];
                return list_pids.Count;
            }
            else
            {
                return 0;
            }
        }

        void load_products(string x)
        {
            mom.Controls.Clear();
            int i = 0;
            string conn_str = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(conn_str);
            string sql;
            if (x==null || x=="")
            sql = "select prod_id, prod_name, prod_price, prod_thumbnail from product";
            else
            sql= "SELECT prod_id, prod_name, prod_price, prod_thumbnail FROM product WHERE prod_name LIKE '%" + x+"%'";
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //img_div.Controls.Add(temp_img);

                //Creating the skeleton
                Panel pnl_container = new Panel();
                pnl_container.CssClass = "d-flex justify-content-center container mt-5 col-3";

                Panel card = new Panel();
                card.CssClass = "card p-3 bg-white";
                HyperLink link = new HyperLink();
                link.ID = i.ToString();
                i++;
                card.Controls.Add(link);

                Panel about_product = new Panel();
                about_product.CssClass = "about-product text-center mt-2";

                Panel img_container = new Panel();
                img_container.CssClass = "mb-2";
                img_container.Width = 200;

                byte[] imagem = (byte[])(reader.GetValue(3));
                string PROFILE_PIC = Convert.ToBase64String(imagem);

                Image temp_img = new Image();
                temp_img.ImageUrl = String.Format("data:image/jpg;base64,{0}", PROFILE_PIC);
                temp_img.Width = 200;
                temp_img.Height = 200;
                img_container.Controls.Add(temp_img);

                Panel container_under_image = new Panel();
                var h4 = new HtmlGenericControl("h4");
                var h6 = new HtmlGenericControl("h6");
                h6.Attributes["class"] = "mt-0 text-black-50";
                container_under_image.Controls.Add(h4);
                container_under_image.Controls.Add(h6);

                Panel pnl_price = new Panel();
                pnl_price.CssClass = "d-flex justify-content-between total font-weight-bold mt-4";
                Label lbl_price = new Label();
                Label lbl_priceeee = new Label();
                lbl_priceeee.Text = "Price";
                pnl_price.Controls.Add(lbl_priceeee);
                pnl_price.Controls.Add(lbl_price);

                //Feed the data
                link.NavigateUrl = "ProductDetails.aspx?id=" + reader.GetValue(0).ToString();
                h4.InnerText = reader.GetValue(1).ToString();
                lbl_price.Text = reader.GetValue(2).ToString();


                //Connect all
                about_product.Controls.Add(img_container);
                about_product.Controls.Add(container_under_image);
                link.Controls.Add(about_product);
                card.Controls.Add(pnl_price);

                pnl_container.Controls.Add(card);
                mom.Controls.Add(pnl_container);

            }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            load_products(txt_search.Text.Trim());
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LoginPage.aspx");
        }
    }

    
}