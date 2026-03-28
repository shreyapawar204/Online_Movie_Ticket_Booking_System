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
    public partial class Contact_Us : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        string insertQuery = @"INSERT INTO Contact 
                                           (FullName, Email, Subject, Message, CreatedAt) 
                                           VALUES 
                                           (@FullName, @Email, @Subject, @Message, @CreatedAt)";

                        using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                        {
                            // Get values from ASP.NET controls
                            cmd.Parameters.AddWithValue("@FullName", txtName.Text.Trim());
                            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                            cmd.Parameters.AddWithValue("@Subject", ddlSubject.SelectedValue);
                            cmd.Parameters.AddWithValue("@Message", txtMessage.Text.Trim());
                            cmd.Parameters.AddWithValue("@CreatedAt", DateTime.Now);

                            cmd.ExecuteNonQuery();

                            // Clear the form
                            txtName.Text = "";
                            txtEmail.Text = "";
                            ddlSubject.SelectedIndex = 0;
                            txtMessage.Text = "";

                            // Show success message
                            ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                                "alert('Message sent successfully!');", true);
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Show error message
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                        $"alert('An error occurred: {ex.Message}');", true);

                    // Log the error
                    System.Diagnostics.Debug.WriteLine($"Error in Button3_Click: {ex.Message}");
                }
            }
        }
    }
}