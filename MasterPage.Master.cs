using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace LibraryManagementSystem
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] == null)
                {
                    LoginPlaceHolder.Visible = false;
                    LogoutPlaceHolder.Visible = true;
                }
                else
                {
                    LoginPlaceHolder.Visible = true;
                    LogoutPlaceHolder.Visible = false;
                    string userId = Session["user_id"].ToString();
                    BindLoggedInUser(userId);
                }
            }
        }

        protected void BindLoggedInUser(string userId)
        {
            con.Open();
            SqlCommand getCmd = new SqlCommand("SELECT name, email FROM [users] WHERE id=@id", con);
            getCmd.Parameters.AddWithValue("@id", userId);
            SqlDataAdapter adapter = new SqlDataAdapter(getCmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            con.Close();
            NavbarUserName.Text = ds.Tables[0].Rows[0]["name"].ToString();
        }
    }
}