using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace LibraryManagementSystem
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                if (Session["user"] != null)
                {
                    Response.Redirect("Home.aspx");
                }
                EmailErrorMsg.Visible = false;
                ErrorMessage.Visible = false;
            }
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            if (UserExists(EmailTextBox.Text.ToString()))
            {
                EmailErrorMsg.Visible = true;
                EmailErrorMsg.Text = "Email already exists";
            }
            else
            {
                try
                {
                    con.Open();
                    string insertQry = "INSERT INTO [users] (name, email, password, created_at, updated_at) VALUES (@name, @email, @password, @created_at, @updated_at)";
                    SqlCommand insertCmd = new SqlCommand(insertQry, con);
                    insertCmd.Parameters.AddWithValue("@name", NameTextBox.Text.ToString());
                    insertCmd.Parameters.AddWithValue("@email", EmailTextBox.Text.ToString());
                    insertCmd.Parameters.AddWithValue("@password", MyEncrypt(PasswordTextBox.Text.ToString()));
                    insertCmd.Parameters.AddWithValue("@created_at", DateTime.Now);
                    insertCmd.Parameters.AddWithValue("@updated_at", DateTime.Now);
                    insertCmd.ExecuteNonQuery();
                    con.Close();

                    Response.Redirect("Login.aspx");
                }
                catch (Exception ex) {
                    ErrorMessage.Visible = true;
                    ErrorMessage.Text = "Something went wrong";
                }
            }
        }

        protected bool UserExists(string email)
        {
            con.Open();
            string getQuery = "SELECT id FROM [users] WHERE email=@email";
            SqlCommand getQueryCmd = new SqlCommand(getQuery, con);
            getQueryCmd.Parameters.AddWithValue("@email", email);
            SqlDataReader getReader = getQueryCmd.ExecuteReader();
            if (getReader.HasRows)
            {
                con.Close();
                return true;
            }
            con.Close();
            return false;
        }

        public static string MyEncrypt(string returnText)
        {
            string EncryptionKey = "E5C2B81A3B2B2";
            byte[] clearBytes = Encoding.Unicode.GetBytes(returnText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    returnText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return returnText;
        }
    }
}