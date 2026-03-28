using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
namespace MajorProject
{
    public partial class LoginForm : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Clear textboxes on first load
                txtEmail.Text = string.Empty;
                txtPassword.Text = string.Empty;

                // Store the referring URL in ViewState if it exists
                if (Request.UrlReferrer != null && !Request.UrlReferrer.AbsolutePath.ToLower().Contains("login"))
                {
                    ViewState["ReturnUrl"] = Request.UrlReferrer.AbsoluteUri;
                }

                // Check if a ReturnUrl was passed in the query string
                if (!string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                {
                    ViewState["ReturnUrl"] = Request.QueryString["ReturnUrl"];
                }

                // Check if ReturnUrl was stored in Session by BookSeats page
                if (Session["ReturnUrl"] != null)
                {
                    ViewState["ReturnUrl"] = Session["ReturnUrl"].ToString();
                }
            }
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {
                // Basic validation
                if (string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtPassword.Text))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                        "alert('Please enter both email and password');", true);
                    return;
                }

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Output all users and passwords for debugging
                    string debugQuery = "SELECT Email, Password FROM Users";
                    using (SqlCommand debugCmd = new SqlCommand(debugQuery, conn))
                    {
                        using (SqlDataReader debugReader = debugCmd.ExecuteReader())
                        {
                            string userList = "";
                            while (debugReader.Read())
                            {
                                userList += debugReader["Email"] + ": " + debugReader["Password"] + "<br/>";
                            }

                            // Store this for your reference (don't display in production!)
                            // You can check this in the console or a debug panel
                            System.Diagnostics.Debug.WriteLine(userList);
                        }
                    }

                    // Now try direct match
                    string query = "SELECT UserID, Name FROM Users WHERE Email = @Email AND Password = @Password";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text); // Try with plain text password

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Login successful
                                string userName = reader["Name"].ToString();
                                int userId = Convert.ToInt32(reader["UserID"]);

                                // Store user information in session
                                Session["UserID"] = userId;
                                Session["UserEmail"] = txtEmail.Text.Trim();
                                Session["UserName"] = userName;

                                string redirectUrl = "Default.aspx";

                                // Check session for ReturnUrl from BookSeats page first
                                if (Session["ReturnUrl"] != null)
                                {
                                    redirectUrl = Session["ReturnUrl"].ToString();
                                    Session["ReturnUrl"] = null; // Clear after use
                                }
                                // Then check ViewState
                                else if (ViewState["ReturnUrl"] != null)
                                {
                                    redirectUrl = ViewState["ReturnUrl"].ToString();
                                }

                                ScriptManager.RegisterStartupScript(this, GetType(), "successAlert", @"
                                    alert('Login successful! Welcome ' + '" + userName + @"');
                                    window.location.href = '" + redirectUrl + "';", true);
                            }
                            else
                            {
                                // Login failed
                                ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                                    "alert('Invalid email or password');", true);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                    $"alert('Error: {ex.Message}');", true);
            }
        }
    }
}