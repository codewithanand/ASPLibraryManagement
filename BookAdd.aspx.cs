using System;
using System.Configuration;
using System.Data.SqlClient;

namespace LibraryManagementSystem
{
    public partial class BookAdd : System.Web.UI.Page
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
            }
        }

        protected void BookAddButton_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand insertCmd = new SqlCommand("INSERT INTO [books] (title, author, isbn, genre, publication_year, pages, quantity, shelf_location, created_at, updated_at) VALUES (@title, @author, @isbn, @genre, @publication_year, @pages, @quantity, @shelf_location, @created_at, @updated_at)", con);
            insertCmd.Parameters.AddWithValue("@title", BookTitle.Text.ToString());
            insertCmd.Parameters.AddWithValue("@author", Author.Text.ToString());
            insertCmd.Parameters.AddWithValue("@isbn", IsbnNumber.Text.ToString());
            insertCmd.Parameters.AddWithValue("@genre", Genre.Text.ToString());
            insertCmd.Parameters.AddWithValue("@publication_year", PublicationYear.Text.ToString());
            insertCmd.Parameters.AddWithValue("@pages", Pages.Text.ToString());
            insertCmd.Parameters.AddWithValue("@quantity", Quantity.Text.ToString());
            insertCmd.Parameters.AddWithValue("@shelf_location", ShelfLocation.Text.ToString());
            insertCmd.Parameters.AddWithValue("@created_at", DateTime.Now);
            insertCmd.Parameters.AddWithValue("@updated_at", DateTime.Now);
            insertCmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Books.aspx");
        }
    }
}