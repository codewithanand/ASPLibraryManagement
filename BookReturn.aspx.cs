using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace LibraryManagementSystem
{
    public partial class BookReturn : System.Web.UI.Page
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
                if (Request.QueryString["studentId"] == null)
                {
                    SearchButton.Enabled = true;
                    BookIdPlaceHolder.Visible = false;
                    StudentPlaceHolder.Visible = false;
                }
                else
                {
                    SearchButton.Enabled = false;
                    BookIdPlaceHolder.Visible = true;
                    StudentPlaceHolder.Visible = true;

                    string studentId = GetStudentId(Request.QueryString["studentId"].ToString());
                    BindStudentInformation(studentId);
                    StudentId.Text = Request.QueryString["studentId"].ToString();
                }
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string studentId = StudentId.Text.ToString();
            Response.Redirect("BookReturn.aspx?studentId=" + studentId);
        }

        protected void RefreshButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookReturn.aspx");
        }

        protected void ReturnButton_Click(object sender, EventArgs e)
        {
            string bookId = GetBookId(BookISBN.Text.ToString());
            string studentId = GetStudentId(Request.QueryString["studentId"].ToString());
            ReturnBook(bookId, studentId);
            Response.Redirect("BookReturn.aspx?studentId=" + Request.QueryString["studentId"].ToString());
        }

        protected void ReturnBook(string bookId, string studentId)
        {
            con.Open();
            SqlCommand updateCmd = new SqlCommand("UPDATE [issued_books] SET returned_date=@returned_date, is_returned=@is_returned, updated_at=@updated_at WHERE book_id=@book_id AND student_id=@student_id", con);
            updateCmd.Parameters.AddWithValue("@book_id", bookId);
            updateCmd.Parameters.AddWithValue("@student_id", studentId);
            updateCmd.Parameters.AddWithValue("@returned_date", DateTime.Now.ToString("yyyy-MM-dd"));
            updateCmd.Parameters.AddWithValue("@is_returned", 1);
            updateCmd.Parameters.AddWithValue("@updated_at", DateTime.Now);
            updateCmd.ExecuteNonQuery();
            con.Close();
        }

        protected void BindStudentInformation(string studentId)
        {
            DataSet ds = GetIssueBooks(studentId);
            if (ds.Tables[0].Rows.Count > 0)
            {
                ReturnButton.Enabled = true;
            }
            else
            {
                ReturnButton.Enabled = false;
            }
            IssuedBooksistView.DataSource = ds;
            IssuedBooksistView.DataBind();
        }

        protected DataSet GetIssueBooks(string studentId)
        {
            con.Open();
            SqlCommand getCmd = new SqlCommand("SELECT * FROM [issued_books] INNER JOIN [books] ON books.id=issued_books.book_id INNER JOIN [students] ON issued_books.student_id=students.id WHERE students.id=@student_id AND is_returned=0", con);
            getCmd.Parameters.AddWithValue("@student_id", studentId);
            SqlDataAdapter adapter = new SqlDataAdapter(getCmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            con.Close();
            return ds;
        }

        protected string GetBookId(string bookIsbn)
        {
            con.Open();
            SqlCommand getCmd = new SqlCommand("SELECT * FROM [books] WHERE isbn=@isbn", con);
            getCmd.Parameters.AddWithValue("@isbn", bookIsbn);
            SqlDataAdapter adapter = new SqlDataAdapter(getCmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            con.Close();
            return ds.Tables[0].Rows[0]["id"].ToString();
        }

        protected string GetStudentId(string studentUID)
        {
            con.Open();
            SqlCommand getCmd = new SqlCommand("SELECT * FROM [students] WHERE s_id=@studentUID", con);
            getCmd.Parameters.AddWithValue("@studentUID", studentUID);
            SqlDataAdapter adapter = new SqlDataAdapter(getCmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            con.Close();
            return ds.Tables[0].Rows[0]["id"].ToString();
        }
    }
}