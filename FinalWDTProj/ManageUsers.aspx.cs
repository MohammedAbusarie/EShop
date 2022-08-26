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
    public partial class ManageUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["u_id"] == null || Session["usr_grp_id"].ToString() != "3")
                Response.Redirect("LoginPage.aspx");

            if (!this.IsPostBack)
            {
                this.RefreshGrid();
            }
        }
        public void RefreshGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(@"SELECT userss.u_id,userss.u_name,userss.u_email,
userss.u_pass, userss.u_phone, userss.u_country, userss.u_ads, user_group.user_group_name
FROM userss
INNER JOIN user_group ON userss.usr_grp_id = user_group.usr_grp_id; ", conn))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    GVusers.DataSource = dt;
                    GVusers.DataBind();
                }
            }
        }
        protected void GVusers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GVusers.EditIndex)
            {
                (e.Row.Cells[9].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void GVusers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int u_id = Convert.ToInt32(GVusers.DataKeys[e.RowIndex].Values[0]);
            string constr = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM userss WHERE u_id = @u_id"))
                {
                    cmd.Parameters.AddWithValue("@u_id", u_id);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

            }
            RefreshGrid();

        }

        protected void btn_create_cat_Click(object sender, EventArgs e)
        {
            Response.Redirect("UsersEdit.aspx");
        }

        protected void GVusers_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}