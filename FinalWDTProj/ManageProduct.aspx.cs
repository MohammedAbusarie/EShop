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
    public partial class ManageProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["u_id"] == null || Session["usr_grp_id"].ToString() != "3")
                Response.Redirect("LoginPage.aspx");

            if (!Page.IsPostBack)
                RefreshGrid();
        }
        public void RefreshGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(
                @"select product.prod_id , product.prod_count, product.prod_create_date , product .prod_description , product.prod_name , product.prod_price ,product.prod_weight, product.prod_thumbnail , product.prod_img , category.cat_name
                from product
                Inner join category on product.cat_id = category.cat_id;", conn))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["prod_thumbnail"]);
                (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;

                string imageUrl2 = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["prod_img"]);
                (e.Row.FindControl("Image2") as Image).ImageUrl = imageUrl2;
            }
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                (e.Row.Cells[11].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void btn_create_product_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductEdit.aspx");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int prod_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string constr = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("  delete order_details where prod_id= @prod_id  DELETE FROM product WHERE prod_id = @prod_id "))
                {
                    cmd.Parameters.AddWithValue("@prod_id", prod_id);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            RefreshGrid();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
    }
}