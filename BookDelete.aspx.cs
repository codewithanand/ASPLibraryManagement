using System;
using System.Configuration;
using System.Data.SqlClient;

namespace LibraryManagementSystem
{
    public partial class BookDelete : System.Web.UI.Page
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
                string bookId = Request.QueryString["bookId"];
                DeleteBook(bookId);
            }
        }

        protected void DeleteBook(string bookId)
        {
            con.Open();
            SqlCommand deleteCmd = new SqlCommand("DELETE FROM [books] WHERE id=@id", con);
            deleteCmd.Parameters.AddWithValue("@id", bookId);
            deleteCmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Books.aspx");
        }
    }
}