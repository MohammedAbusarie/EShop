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
    public partial class CategoryTable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["u_id"] == null || Session["usr_grp_id"].ToString() != "3")
                Response.Redirect("LoginPage.aspx");

            if (!this.IsPostBack)
            {
                RefreshGrid("SELECT * FROM category");
            }

        }

        public void RefreshGrid(string sql)
        {
            string constr = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(sql, conn))
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
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["cat_thumbnail"]);
                (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
            }
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                (e.Row.Cells[4].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int catid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string constr = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM product WHERE cat_id = @cat_id"))
                {
                    cmd.Parameters.AddWithValue("@cat_id", catid);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                using (SqlCommand cmd = new SqlCommand("DELETE FROM category WHERE cat_id = @cat_id"))
                {
                    cmd.Parameters.AddWithValue("@cat_id", catid);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                
            }
            RefreshGrid("SELECT * FROM category");
        }

        protected void btn_create_cat_Click(object sender, EventArgs e)
        {
            Response.Redirect("CategoryEdit.aspx");
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            RefreshGrid("SELECT* FROM [category] where cat_name LIKE '%" + txt_search.Text.Trim() + "%'");
        }
    }
}