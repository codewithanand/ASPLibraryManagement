using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace LibraryManagementSystem
{
    public partial class Students : System.Web.UI.Page
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
                BindStudents();
            }
        }

        protected void BindStudents()
        {
            con.Open();
            SqlCommand getCmd = new SqlCommand("SELECT * FROM [students]", con);
            SqlDataAdapter adapter = new SqlDataAdapter(getCmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            StudentListView.DataSource = ds;
            StudentListView.DataBind();
            con.Close();
        }
    }
}