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
    public partial class Personal_info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["u_id"] == null || Session["usr_grp_id"].ToString() != "3")
                Response.Redirect("LoginPage.aspx");

            if (!Page.IsPostBack)
            {
                loadUserGroup();
                if (Request.QueryString["id"] != null)
                {
                    btn_pers_submit.Text = "Update";
                    load_update_info(Convert.ToInt32(Request.QueryString["id"]));
                    
                }
                
            }
            
                


        }
        protected void load_update_info(int id)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ToString();
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand cmd = new SqlCommand("select * from userss where u_id=" + id.ToString(), connection);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                //load data
                txt_person_name.Text = dt.Rows[0]["u_name"].ToString();
                txt_person_email.Text = dt.Rows[0]["u_email"].ToString();
                lst_person_country.SelectedValue= dt.Rows[0]["u_country"].ToString();
                txt_person_phone.Text= dt.Rows[0]["u_phone"].ToString();
                txt_address.Text= dt.Rows[0]["u_ads"].ToString();
                txt_person_pass.Text= dt.Rows[0]["u_pass"].ToString();
                cmd = new SqlCommand(@"SELECT user_group.user_group_name
                FROM userss
                INNER JOIN user_group ON userss.usr_grp_id = user_group.usr_grp_id WHERE u_id="+id.ToString()
                 , connection);
                string res = cmd.ExecuteScalar().ToString();
                lst_usrgroup.SelectedIndex= lst_usrgroup.Items.IndexOf(lst_usrgroup.Items.FindByValue(res));
                lst_usrgroup.DataBind();
            }
            catch(Exception ex)
            {
                txt_address.Text = ex.ToString();
            }
        }
        protected void loadUserGroup()
        {
            lst_usrgroup.Items.Clear();
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ToString();
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                string sql = "select * from user_group";
                SqlCommand cmd = new SqlCommand(sql, connection);

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    lst_usrgroup.Items.Insert(0, new ListItem(reader.GetValue(1).ToString(), reader.GetValue(0).ToString()));
                }
                connection.Close();
            }
            catch (Exception ex)
            {
                //btn_pers_cancel.Text = "Error in ExecuteReader " + ex.ToString();
            }
        }


        protected void btn_pers_submit_Click(object sender, EventArgs e)
        {
            
                string connectionString = ConfigurationManager.ConnectionStrings["ecommConnectionString"].ToString();
                SqlConnection connection = new SqlConnection(connectionString);
                try
                {
                string query=null;
                if (Request.QueryString["id"] == null)
                   query = "INSERT INTO userss (u_email,u_pass,u_name,u_country,u_phone,u_ads,usr_grp_id) VALUES(@u_email,@u_pass,@u_name,@u_country,@u_phone,@u_ads,@u_usr_grp_id)";
                else
                    query = "Update userss set u_email=@u_email , u_pass=@u_pass,u_name=@u_name,u_country=@u_country,u_phone=@u_phone,u_ads=@u_ads,usr_grp_id=@u_usr_grp_id where u_id=" + Request.QueryString["id"].ToString();
                SqlCommand command = new SqlCommand(query, connection);

                    command.Parameters.Add("@u_email", SqlDbType.VarChar).Value = txt_person_email.Text;
                    command.Parameters.Add("@u_pass", SqlDbType.VarChar).Value = txt_person_pass.Text;
                    command.Parameters.Add("@u_name", SqlDbType.VarChar).Value = txt_person_name.Text;
                    command.Parameters.Add("@u_phone", SqlDbType.VarChar).Value = txt_person_phone.Text;
                    command.Parameters.Add("@u_ads", SqlDbType.VarChar).Value = txt_address.Text;
                    command.Parameters.Add("@u_country", SqlDbType.VarChar).Value = lst_person_country.SelectedValue.ToString();
                    command.Parameters.Add("@u_usr_grp_id", SqlDbType.Int).Value = lst_usrgroup.SelectedValue.ToString();


                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                    Response.Redirect("ManageUsers.aspx");
            }
                catch (SqlException e1)
                {
                    string x = "Error Generated. Details: " + e1.ToString();
                Response.Write(e1.ToString());
                   // Response.Write("<script>alert('" + x + "');</script>");
                }
                //Label1.Text = System.Text.Encoding.Default.GetString(imgbyte); ;
                
        }

        protected void btn_pers_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageUsers.aspx");
        }

        protected void lst_usrgroup_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
    }
}