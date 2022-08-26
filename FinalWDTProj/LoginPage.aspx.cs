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
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

                
                if (Session["u_email"] != null)
                    txt_email.Text = Session["u_email"].ToString();
                if (Session["u_pass"] != null)
                    txt_pass.Attributes.Add("value", Session["u_pass"].ToString());
              /*  if (Session["u_email"] != null && Session["u_pass"] != null)
                    rememberme.Checked = true;*/
            

        }

        protected void btn_lgn_Click(object sender, EventArgs e)
        {
            string conn_str = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ToString();
            SqlConnection con = new SqlConnection(conn_str);
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT *
FROM userss
INNER JOIN user_group ON userss.usr_grp_id = user_group.usr_grp_id WHERE u_email= '" + txt_email.Text.Trim() + "' and u_pass='" + txt_pass.Text.Trim() + "'", con);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                Session["u_id"] = reader["u_id"].ToString();
                Session["u_email"] = txt_email.Text.Trim();
                Session["usr_grp_id"] = reader["usr_grp_id"].ToString();
                Session["u_pass"] = reader["u_pass"].ToString();
                reader.Close();
                con.Close();
                Response.Write(Session["usr_grp_id"].ToString());
                
                if(Session["usr_grp_id"].ToString() == "3")
                    Response.Redirect("AdminPage.aspx");
                 if (Session["usr_grp_id"].ToString() == "4")
                         Response.Redirect("HomeProducts.aspx");
            }
            else
            {
                reader.Close();
                con.Close();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid email or password!')", true);
            }
        }
    }
}