using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace LibraryManagementSystem
{
    public partial class BookEdit : System.Web.UI.Page
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
                BindBookDetails(bookId);
            }
        }

        protected void BindBookDetails(string bookId)
        {
            con.Open();
            SqlCommand getCmd = new SqlCommand("SELECT * FROM [books] WHERE id=@id", con);
            getCmd.Parameters.AddWithValue("@id", bookId);
            SqlDataAdapter adapter = new SqlDataAdapter(getCmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            con.Close();

            BookTitle.Text = ds.Tables[0].Rows[0]["title"].ToString();
            Author.Text = ds.Tables[0].Rows[0]["author"].ToString();
            IsbnNumber.Text = ds.Tables[0].Rows[0]["isbn"].ToString();
            Genre.Text = ds.Tables[0].Rows[0]["genre"].ToString();
            PublicationYear.Text = ds.Tables[0].Rows[0]["publication_year"].ToString();
            Pages.Text = ds.Tables[0].Rows[0]["pages"].ToString();
            ShelfLocation.Text = ds.Tables[0].Rows[0]["shelf_location"].ToString();
        }

        protected void BookUpdateButton_Click(object sender, EventArgs e)
        {
            string bookId = Request.QueryString["bookId"].ToString();
            con.Open();
            SqlCommand updateCmd = new SqlCommand("UPDATE [books] SET title=@title, author=@author, isbn=@isbn, genre=@genre, publication_year=@publication_year, pages=@pages, shelf_location=@shelf_location, updated_at=@updated_at WHERE id=@id", con);
            updateCmd.Parameters.AddWithValue("@id", bookId);
            updateCmd.Parameters.AddWithValue("@title", BookTitle.Text.ToString());
            updateCmd.Parameters.AddWithValue("@author", Author.Text.ToString());
            updateCmd.Parameters.AddWithValue("@isbn", IsbnNumber.Text.ToString());
            updateCmd.Parameters.AddWithValue("@genre", Genre.Text.ToString());
            updateCmd.Parameters.AddWithValue("@publication_year", PublicationYear.Text.ToString());
            updateCmd.Parameters.AddWithValue("@pages", Pages.Text.ToString());
            updateCmd.Parameters.AddWithValue("@shelf_location", ShelfLocation.Text.ToString());
            updateCmd.Parameters.AddWithValue("@updated_at", DateTime.Now);
            updateCmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Books.aspx");
        }
    }
}