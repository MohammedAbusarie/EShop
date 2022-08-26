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
    public partial class SignupPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_signup_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            string query;
            query = "INSERT INTO userss (u_email,u_pass,u_name,u_phone,u_ads,usr_grp_id) VALUES(@email,@pass,@name,@phone,@ads,@usrgrpid)";

            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.Add("@name", SqlDbType.VarChar).Value = txt_name.Text;
            command.Parameters.Add("@email", SqlDbType.VarChar).Value = txt_email.Text;
            command.Parameters.Add("@pass", SqlDbType.VarChar).Value = txt_pass.Text;
            command.Parameters.Add("@phone", SqlDbType.VarChar).Value = txt_phone.Text;
            command.Parameters.Add("@ads", SqlDbType.VarChar).Value = txt_ads.Text;
            command.Parameters.Add("@usrgrpid", SqlDbType.Int).Value = 4;

            try
            {
                connection.Open();
                command.ExecuteNonQuery();
            }
            catch (SqlException e1)
            {
                string x = "Error Generated. Details: " + e1.ToString();
                Label1.Text = x;
            }
            finally
            {
                Session["u_email"] = txt_email.Text;
                Session["u_pass"] = txt_pass.Text;
                connection.Close();
                //Page.Response.Redirect(Page.Request.Url.ToString(), true);
                Response.Redirect("LoginPage.aspx");
            }
        }
    }
}