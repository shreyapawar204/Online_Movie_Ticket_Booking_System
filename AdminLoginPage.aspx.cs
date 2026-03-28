using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MajorProject
{
    public partial class AdminLoginPage : System.Web.UI.Page
    {
        private const string ADMIN_USERNAME = "admin";
        private const string ADMIN_PASSWORD = "Film123@";
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text == ADMIN_USERNAME && txtPassword.Text == ADMIN_PASSWORD)
            {
                Session["AdminLoggedIn"] = true;
                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid username or password";
            }
        }
    }
}