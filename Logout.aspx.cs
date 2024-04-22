using System;

namespace LibraryManagementSystem
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Abandon();
                Session.Clear();
                Response.Redirect("Login.aspx");
            }
        }
    }
}