using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace LibraryManagementSystem
{
    public partial class Books : System.Web.UI.Page
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
                BindBookListView();
            }
        }

        protected void BindBookListView()
        {
            con.Open();
            SqlCommand getCmd = new SqlCommand("SELECT * FROM [books]", con);
            SqlDataAdapter adapter = new SqlDataAdapter(getCmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            BookListView.DataSource = ds;
            BookListView.DataBind();
            con.Close();
        }
    }
}