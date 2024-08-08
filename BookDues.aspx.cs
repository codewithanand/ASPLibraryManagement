using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;


namespace LibraryManagementSystem
{
    public partial class BookDues : System.Web.UI.Page
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
                BindBookDuesListView();
            }
        }
        protected void BindBookDuesListView()
        {
            con.Open();
            SqlCommand getCmd = new SqlCommand("SELECT students.s_id AS student_id, students.name AS student_name, issued_books.issuing_date AS issuing_date, issued_books.returning_date AS returning_date FROM [issued_books] INNER JOIN [books] ON books.id=issued_books.book_id INNER JOIN [students] ON issued_books.student_id=students.id WHERE is_returned=0", con);
            SqlDataAdapter adapter = new SqlDataAdapter(getCmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            BookDuesListView.DataSource = ds;
            BookDuesListView.DataBind();
            con.Close();
        }

        protected string CheckDueDate(DateTime returningDate)
        {
            return DateTime.Compare(returningDate, DateTime.Today) < 0 ? "<span class=\"badge bg-danger\">Dues</span>" : string.Empty;
        }
    }

    
}