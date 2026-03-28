using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MajorProject
{
    public partial class ProfilePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("LoginForm.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Display user information
                lblUserName.Text = Session["UserName"]?.ToString();
                lblName.Text = Session["UserName"]?.ToString();
                lblEmail.Text = Session["UserEmail"]?.ToString();
            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageProfile.aspx");
        }
    }
}