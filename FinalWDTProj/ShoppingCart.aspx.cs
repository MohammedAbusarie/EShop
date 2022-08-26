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
    public partial class ShoppingCart : System.Web.UI.Page
    {
        List<int> list_pids ;
        List<int> list_pcount ;
        List<decimal> list_pprice = new List<decimal>();
        List<int> list_pmax_count = new List<int>();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Session["u_id"].ToString());
             Response.Write(getCustomerAds());

            if (Session["u_id"] == null || Session["usr_grp_id"].ToString() != "4")
                Response.Redirect("LoginPage.aspx");
            populate_shopping_cart();
        }

        void populate_shopping_cart()
        {

            //feed_lists
            list_pids = (List<int>)Session["list_pids"];
            list_pcount = (List<int>)Session["list_pcount"];

            
         // list_pids = new List<int>() { 5, 6 };
          //list_pcount = new List<int>() { 4, 5 };
            
            //generating the rows from session data

            //CREATE THE SKELETON
            var table = new HtmlGenericControl("table");
            var first_row = new HtmlGenericControl("tr");
            var th1 = new HtmlGenericControl("th") { InnerText = "Product" };
            var th2 = new HtmlGenericControl("th") { InnerText = "Quantity" };
            var th3 = new HtmlGenericControl("th") { InnerText = "Subtotal" };

            table.Controls.Add(first_row);
            first_row.Controls.Add(th1);
            first_row.Controls.Add(th2);
            first_row.Controls.Add(th3);
            cart_container.Controls.Add(table);

            //inject data to the skeleton
            if (list_pids != null)
            {
                cart_count.InnerText = list_pids.Count.ToString();
                for (int i = 0; i < list_pids.Count; i++)
                {
                    var tr = new HtmlGenericControl("tr");
                    var td = new HtmlGenericControl("td");
                    var div = new HtmlGenericControl("div");
                    div.Attributes["class"] = "cart-info";
                    Image img = new Image();
                    var div2 = new HtmlGenericControl("div");

                    Label lbl_prod_name = new Label();
                    lbl_prod_name.CssClass = "boldText";
                    Label lbl_prod_price = new Label();
                    lbl_prod_price.CssClass = "smallText";

                    LinkButton link = new LinkButton();
                    link.Text = "Remove";

                    var td2 = new HtmlGenericControl("td");
                    TextBox txt_prod_count = new TextBox();
                    txt_prod_count.TextMode = TextBoxMode.Number;

                    //txt_prod_count.AutoPostBack = true;
                    //txt_prod_count.TextChanged += new EventHandler(prod_count_changed);

                    Label lbl_prod_mul_price = new Label();
                    var td3 = new HtmlGenericControl("td");

                    //Connect skeleton
                    tr.Controls.Add(td);
                    tr.Controls.Add(td2);
                    tr.Controls.Add(td3);
                    td.Controls.Add(div);
                    div.Controls.Add(img);
                    div.Controls.Add(div2);
                    div2.Controls.Add(lbl_prod_name);
                    div2.Controls.Add(new LiteralControl("<br />"));
                    div2.Controls.Add(lbl_prod_price);
                    div2.Controls.Add(new LiteralControl("<br />"));
                    div2.Controls.Add(link);
                    td2.Controls.Add(txt_prod_count);
                    td3.Controls.Add(lbl_prod_mul_price);

                    string sql = "select * from product where prod_id=" + list_pids[i].ToString();
                    string connectionString = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ToString();
                    SqlConnection conn = new SqlConnection(connectionString);

                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    { }

                    int prod_id = Convert.ToInt32(reader["prod_id"]);
                    Decimal price = Convert.ToDecimal(reader["prod_price"]);
                    string prod_name = Convert.ToString(reader["prod_name"]);
                    int max_prod_count = Convert.ToInt32(reader["prod_count"]);

                    if (max_prod_count <= 0)
                        break;

                    list_pprice.Add(price * list_pcount[i]);
                    list_pmax_count.Add(max_prod_count);

                    byte[] imagem = (byte[])(reader["prod_img"]);
                    string PROFILE_PIC = Convert.ToBase64String(imagem);
                    img.ImageUrl = String.Format("data:image/jpg;base64,{0}", PROFILE_PIC);
                    img.Width = 80;
                    img.Height = 80;

                    txt_prod_count.Attributes["min"] = "0";
                    txt_prod_count.Attributes["max"] = max_prod_count.ToString();


                    txt_prod_count.Text = list_pcount[i].ToString();
                    link.ID = prod_id.ToString();
                    link.Click += new EventHandler(remove_clicked);
                    lbl_prod_name.Text = prod_name;
                    lbl_prod_price.Text = "Price: £E " + price.ToString();
                    lbl_prod_mul_price.Text = "£E " + (price * list_pcount[i]).ToString();

                    conn.Close();

                    table.Controls.Add(tr); //very important
                }
            }
               
            lbl_subtotal.Text = list_pprice.Sum().ToString();
            lbl_tax.Text = (Convert.ToDouble(list_pprice.Sum()) * (0.13)).ToString();
            lbl_total.Text = (list_pprice.Sum() + Convert.ToDecimal((Convert.ToDouble(list_pprice.Sum()) * (0.13)))).ToString();


        }

        private void remove_clicked(object sender, EventArgs e)
        {
            LinkButton link = (LinkButton)sender;
            int id = Convert.ToInt32(link.ID);

            list_pids = (List<int>)Session["list_pids"];
            list_pcount = (List<int>)Session["list_pcount"];

            int index = list_pids.IndexOf(id);
            list_pcount.RemoveAt(index);
            list_pids.RemoveAt(index);

            Session["list_pids"] = list_pids;
            Session["list_pcount"] = list_pcount;

            Response.Redirect("ShoppingCart.aspx");

        }
        private string getCustomerAds()
        {
            //get customers address
            string connectionString = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(connectionString);
            string sql = "select u_ads from userss where u_id=" + Session["u_id"].ToString() ;
            conn.Open();

            SqlCommand cmd = new SqlCommand(sql, conn);
            string val = Convert.ToString( cmd.ExecuteScalar() );

            conn.Close();

            return val;
        }

        private int getLastOrderId()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(connectionString); 
            string sql = " SELECT TOP 1 order_id FROM orders ORDER BY order_id DESC";

            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            int val = Convert.ToInt32( cmd.ExecuteScalar() );
            conn.Close();

            return val;
        }
        private void insertOrder()
        {
            SqlCommand cmd;
            string sql;
            string connectionString = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            //insert a new order
            sql = "insert into orders (u_id,total_price,order_shipping_ads,order_date,order_status) values (@u_id,@total_price,@order_shipping_ads,@order_date,@order_status)";
            cmd = new SqlCommand(sql, conn);
            int x = Convert.ToInt32(Session["u_id"]);
            cmd.Parameters.Add("@u_id", SqlDbType.Int).Value = x.ToString();
            cmd.Parameters.Add("@total_price", SqlDbType.Decimal).Value = list_pprice.Sum();
            cmd.Parameters.Add("@order_shipping_ads", SqlDbType.VarChar).Value = getCustomerAds();
            cmd.Parameters.Add("@order_date", SqlDbType.DateTime).Value = DateTime.Now;
            cmd.Parameters.Add("@order_status", SqlDbType.VarChar).Value = "Not Delivered";
            cmd.ExecuteNonQuery();

            conn.Close();
        }

        private void deductProducts()
        {
            SqlCommand cmd;
            string sql;
            string connectionString = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            for (int i = 0; i < list_pids.Count; i++)
            {
                sql = "update product set prod_count=" + (list_pmax_count[i] - list_pcount[i]).ToString() + " where prod_id=" + list_pids[i].ToString();
                cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
            }
            conn.Close();
        }

        private void insertOrderDetails(int order_id)
        {
            SqlCommand cmd;
            string sql;
            string connectionString = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ToString();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            for (int i = 0; i < list_pids.Count; i++)
            {
                sql = @"insert into order_details (order_id,prod_id,od_price,od_qty) values
                                                  (@order_id,@prod_id,@od_price,@od_qty)";
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add("@order_id", SqlDbType.Int).Value = order_id;
                cmd.Parameters.Add("@prod_id", SqlDbType.Int).Value = list_pids[i];
                cmd.Parameters.Add("@od_price", SqlDbType.Decimal).Value = list_pprice[i];
                cmd.Parameters.Add("@od_qty", SqlDbType.Int).Value = list_pcount[i];
                cmd.ExecuteNonQuery();
            }
            conn.Close();
        }

        protected void btn_confirm_Click(object sender, EventArgs e)
        {
            //insert order
            //update product then insert into order_details

            try
            {
                insertOrder();
                deductProducts();
                int id =getLastOrderId();
                insertOrderDetails(id);

                Response.Redirect("hope.aspx");
            }
            catch(Exception ex)
            {
                Response.Write(ex.ToString());
            }


        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LoginPage.aspx");
        }
    }
}