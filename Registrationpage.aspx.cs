using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Web.Helpers;
using System.Configuration;

namespace MajorProject
{
    public partial class Registrationpage : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Clear all textboxes on first load
                TextBox1.Text = string.Empty;
                TextBox2.Text = string.Empty;
                TextBox3.Text = string.Empty;
                TextBox4.Text = string.Empty;
            }
        }

        

        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {
                // Basic validation
                if (string.IsNullOrEmpty(TextBox1.Text) ||
                    string.IsNullOrEmpty(TextBox2.Text) ||
                    string.IsNullOrEmpty(TextBox3.Text) ||
                    string.IsNullOrEmpty(TextBox4.Text))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                        "alert('Please fill all fields');", true);
                    return;
                }

                // Password match validation
                if (TextBox3.Text != TextBox4.Text)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                        "alert('Passwords do not match');", true);
                    return;
                }

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    // Check if email already exists
                    string checkEmail = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
                    using (SqlCommand cmd = new SqlCommand(checkEmail, conn))
                    {
                        conn.Open();
                        cmd.Parameters.AddWithValue("@Email", TextBox2.Text);
                        int count = (int)cmd.ExecuteScalar();
                        if (count > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                                "alert('Email already registered');", true);
                            return;
                        }
                    }

                    // Insert new user
                    string insertQuery = @"INSERT INTO Users (Name, Email, Password) 
                                         VALUES (@Name, @Email, @Password)";

                    using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Name", TextBox1.Text);
                        cmd.Parameters.AddWithValue("@Email", TextBox2.Text);
                        cmd.Parameters.AddWithValue("@Password", TextBox3.Text); // Note: In production, hash this password!

                        cmd.ExecuteNonQuery();
                    }
                }

                ScriptManager.RegisterStartupScript(this, GetType(), "successAlert", @"
                alert('Registration successful!');
                setTimeout(function() {
                    window.location.href = 'LoginForm.aspx';
                }, 500);", true);
                            return;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                    $"alert('Error: {ex.Message}');", true);
            }
        }

    }
}

