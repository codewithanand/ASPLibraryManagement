using System;
using System.Configuration;
using System.Data.SqlClient;

namespace LibraryManagementSystem
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void ContactButton_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand insertCmd = new SqlCommand("INSERT INTO [enquiries] (name, email, subject, message, created_at, updated_at) VALUES (@name, @email, @subject, @message, @created_at, @updated_at)", con);
            insertCmd.Parameters.AddWithValue("@name", Name.Text.ToString());
            insertCmd.Parameters.AddWithValue("@email", Email.Text.ToString());
            insertCmd.Parameters.AddWithValue("@subject", Subject.Text.ToString());
            insertCmd.Parameters.AddWithValue("@message", Message.Text.ToString());
            insertCmd.Parameters.AddWithValue("@created_at", DateTime.Now);
            insertCmd.Parameters.AddWithValue("@updated_at", DateTime.Now);
            insertCmd.ExecuteNonQuery();
            con.Close();
        }

    }
}