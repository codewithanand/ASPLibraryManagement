using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace LibraryManagementSystem
{
    public partial class BookIssue : System.Web.UI.Page
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
            Response.Redirect("BookIssue.aspx?studentId=" + studentId);
        }

        protected void RefreshButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookIssue.aspx");
        }

        protected void IssueButton_Click(object sender, EventArgs e)
        {
            string bookId = GetBookId(BookISBN.Text.ToString());
            string studentId = GetStudentId(Request.QueryString["studentId"].ToString());
            IssueBook(bookId, studentId);
            Response.Redirect("BookIssue.aspx?studentId=" + Request.QueryString["studentId"].ToString());
        }

        protected void BindStudentInformation(string studentId)
        {
            DataSet ds = GetIssueBooks(studentId);
            if (ds.Tables[0].Rows.Count > 1)
            {
                IssueButton.Enabled = false;
            }
            else
            {
                IssueButton.Enabled = true;
            }
            IssuedBooksistView.DataSource = ds;
            IssuedBooksistView.DataBind();
        }

        protected void IssueBook(string bookId, string studentId)
        {
            con.Open();
            SqlCommand insertCmd = new SqlCommand("INSERT INTO [issued_books] (book_id, student_id, issue_date, return_date, created_at, updated_at) VALUES (@book_id, @student_id, @issue_date, @return_date, @created_at, @updated_at)", con);
            insertCmd.Parameters.AddWithValue("@book_id", bookId);
            insertCmd.Parameters.AddWithValue("@student_id", studentId);
            insertCmd.Parameters.AddWithValue("@issue_date", DateTime.Now.ToString("yyyy-MM-dd"));
            insertCmd.Parameters.AddWithValue("@return_date", DateTime.Now.AddDays(7).ToString("yyyy-MM-dd"));
            insertCmd.Parameters.AddWithValue("@created_at", DateTime.Now);
            insertCmd.Parameters.AddWithValue("@updated_at", DateTime.Now);
            insertCmd.ExecuteNonQuery();
            con.Close();
        }

        protected DataSet GetIssueBooks(string studentId)
        {
            con.Open();
            SqlCommand getCmd = new SqlCommand("SELECT * FROM [issued_books] INNER JOIN [students] ON issued_books.student_id=students.id WHERE students.id=@student_id AND is_returned=0", con);
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