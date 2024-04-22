using System;
using System.Configuration;
using System.Data.SqlClient;


namespace LibraryManagementSystem
{
    public partial class StudentDelete : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                string studentId = Request.QueryString["studentId"];
                DeleteStudent(studentId);
            }
        }

        protected void DeleteStudent(string studentId)
        {
            con.Open();
            SqlCommand deleteCmd = new SqlCommand("DELETE FROM [students] WHERE id=@id", con);
            deleteCmd.Parameters.AddWithValue("@id", studentId);
            deleteCmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Students.aspx");
        }
    }
}