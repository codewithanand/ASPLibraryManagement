using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace LibraryManagementSystem
{
    public partial class StudentAdd : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ToString());
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

        protected void CreateStudentButton_Click(object sender, EventArgs e)
        {
            string studentId = GenerateStudentId(AdmissionYear.Text.ToString());
            con.Open();
            SqlCommand insertCmd = new SqlCommand("INSERT INTO [students] (s_id, name, fathers_name, mothers_name, date_of_birth, class, roll, section, admission_year, created_at, updated_at) VALUES (@s_id, @name, @fathers_name, @mothers_name, @date_of_birth, @class, @roll, @section, @admission_year, @created_at, @updated_at)", con);
            insertCmd.Parameters.AddWithValue("@s_id", studentId);
            insertCmd.Parameters.AddWithValue("@name", StudentName.Text.ToString());
            insertCmd.Parameters.AddWithValue("@fathers_name", FathersName.Text.ToString());
            insertCmd.Parameters.AddWithValue("@mothers_name", MothersName.Text.ToString());
            insertCmd.Parameters.AddWithValue("@date_of_birth", DateOfBirth.Text);
            insertCmd.Parameters.AddWithValue("@class", ClassNum.Text.ToString());
            insertCmd.Parameters.AddWithValue("@roll", ClassRoll.Text.ToString());
            insertCmd.Parameters.AddWithValue("@section", ClassSection.Text.ToString());
            insertCmd.Parameters.AddWithValue("@admission_year", AdmissionYear.Text.ToString());
            insertCmd.Parameters.AddWithValue("@created_at", DateTime.Now);
            insertCmd.Parameters.AddWithValue("@updated_at", DateTime.Now);
            insertCmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Students.aspx");
        }

        protected string GenerateStudentId(string admissionYear)
        {
            string newStudentId = string.Empty;
            con.Open();
            SqlCommand getCmd = new SqlCommand("SELECT TOP 1 * FROM [students] ORDER BY id DESC", con);
            SqlDataAdapter adapter = new SqlDataAdapter(getCmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                string currStudentCount = ds.Tables[0].Rows[0]["s_id"].ToString();
                int studentNumber = int.Parse(currStudentCount.Substring(7));
                studentNumber++;
                newStudentId = $"STU{admissionYear}{studentNumber.ToString("0000")}";
                return newStudentId;
            }
            else
            {
                newStudentId = $"STU{admissionYear}0001";
                return newStudentId;
            }
        }
    }
}