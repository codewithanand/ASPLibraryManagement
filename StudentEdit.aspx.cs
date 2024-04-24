using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace LibraryManagementSystem
{
    public partial class StudentEdit : System.Web.UI.Page
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
                BindStudents(studentId);
            }
        }

        protected void BindStudents(string studentId)
        {
            con.Open();
            SqlCommand getCmd = new SqlCommand("SELECT * FROM [students] WHERE id=@id", con);
            getCmd.Parameters.AddWithValue("@id", studentId);
            SqlDataAdapter adapter = new SqlDataAdapter(getCmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            con.Close();
            StudentId.Text = ds.Tables[0].Rows[0]["s_id"].ToString();
            StudentName.Text = ds.Tables[0].Rows[0]["name"].ToString();
            DateOfBirth.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["date_of_birth"]).ToString("yyyy-MM-dd");
            FathersName.Text = ds.Tables[0].Rows[0]["fathers_name"].ToString();
            MothersName.Text = ds.Tables[0].Rows[0]["mothers_name"].ToString();
            ClassNum.Text = ds.Tables[0].Rows[0]["class"].ToString();
            ClassRoll.Text = ds.Tables[0].Rows[0]["roll"].ToString();
            ClassSection.Text = ds.Tables[0].Rows[0]["section"].ToString();
            AdmissionYear.Text = ds.Tables[0].Rows[0]["admission_year"].ToString();
        }

        protected void UpdateStudentButton_Click(object sender, EventArgs e)
        {
            string studentId = Request.QueryString["studentId"];
            con.Open();
            SqlCommand updateCmd = new SqlCommand("UPDATE [students] SET s_id=@s_id, name=@name, fathers_name=@fathers_name, mothers_name=@mothers_name, date_of_birth=@date_of_birth, class=@class, roll=@roll, section=@section, admission_year=@admission_year, updated_at=@updated_at WHERE id=@id", con);
            updateCmd.Parameters.AddWithValue("@id", studentId);
            updateCmd.Parameters.AddWithValue("@s_id", StudentId.Text.ToString());
            updateCmd.Parameters.AddWithValue("@name", StudentName.Text.ToString());
            updateCmd.Parameters.AddWithValue("@fathers_name", FathersName.Text.ToString());
            updateCmd.Parameters.AddWithValue("@mothers_name", MothersName.Text.ToString());
            updateCmd.Parameters.AddWithValue("@date_of_birth", DateOfBirth.Text);
            updateCmd.Parameters.AddWithValue("@class", ClassNum.Text.ToString());
            updateCmd.Parameters.AddWithValue("@roll", ClassRoll.Text.ToString());
            updateCmd.Parameters.AddWithValue("@section", ClassSection.Text.ToString());
            updateCmd.Parameters.AddWithValue("@admission_year", AdmissionYear.Text.ToString());
            updateCmd.Parameters.AddWithValue("@updated_at", DateTime.Now);
            updateCmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Students.aspx");
        }
    }
}