using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MajorProject
{
    public partial class ManageProfile : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("LoginForm.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadUserProfile();
            }
        }
        private void LoadUserProfile()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT Name, Email FROM Users WHERE Email = @Email";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());
                        conn.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                txtName.Text = reader["Name"].ToString();
                                lblEmail.Text = reader["Email"].ToString();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading profile: " + ex.Message;
                lblMessage.CssClass = "error-message";
            }
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            try
            {
                // Verify current password first
                bool isPasswordValid = false;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string verifyQuery = "SELECT COUNT(*) FROM Users WHERE Email = @Email AND Password = @Password";
                    using (SqlCommand cmd = new SqlCommand(verifyQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());
                        cmd.Parameters.AddWithValue("@Password", txtCurrentPassword.Text);
                        conn.Open();
                        isPasswordValid = (int)cmd.ExecuteScalar() > 0;
                    }

                    if (!isPasswordValid)
                    {
                        lblMessage.Text = "Current password is incorrect";
                        lblMessage.CssClass = "error-message";
                        return;
                    }

                    // Update profile
                    string updateQuery = "UPDATE Users SET Name = @Name";
                    if (!string.IsNullOrEmpty(txtNewPassword.Text))
                    {
                        updateQuery += ", Password = @NewPassword";
                    }
                    updateQuery += " WHERE Email = @Email";

                    using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Name", txtName.Text);
                        cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());
                        if (!string.IsNullOrEmpty(txtNewPassword.Text))
                        {
                            cmd.Parameters.AddWithValue("@NewPassword", txtNewPassword.Text);
                        }

                        cmd.ExecuteNonQuery();
                    }
                }

                // Update session
                Session["UserName"] = txtName.Text;

                lblMessage.Text = "Profile updated successfully!";
                lblMessage.CssClass = "success-message";

                // Clear password fields
                txtCurrentPassword.Text = "";
                txtNewPassword.Text = "";
                txtConfirmPassword.Text = "";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error updating profile: " + ex.Message;
                lblMessage.CssClass = "error-message";
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProfilePage.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            // Redirect to login page
            Response.Redirect("Home.aspx");

        }
    }
}
