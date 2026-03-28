using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MajorProject
{
    public partial class UpcomingMovies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUpcomingMovies();
            }
        }

        private void LoadUpcomingMovies()
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Update query to include TrailerUrl
                    SqlCommand command = new SqlCommand("SELECT UMovieID, Title, Description, ReleaseDate, ImageUrl, TrailerUrl FROM UMovies ORDER BY ReleaseDate", connection);

                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dtUMovies = new DataTable();
                    adapter.Fill(dtUMovies);

                    // Process and fix trailer URLs if needed
                    foreach (DataRow row in dtUMovies.Rows)

                    {
                        string imageUrl = row["ImageUrl"].ToString();

                        // Remove tilde if present
                        if (imageUrl.StartsWith("~/"))
                        {
                            imageUrl = imageUrl.Substring(2); // Remove the ~/ prefix
                        }

                        // Set the correct path
                        row["ImageUrl"] = imageUrl;
                        if (row["TrailerUrl"] == DBNull.Value || string.IsNullOrEmpty(row["TrailerUrl"].ToString()))
                        {
                            // Set default trailer URL if none exists
                            row["TrailerUrl"] = "#";
                        }
                    }

                    lblNoMovies.Text = "Records found: " + dtUMovies.Rows.Count;
                    lblNoMovies.Visible = true;

                    if (dtUMovies.Rows.Count > 0)
                    {
                        rptUpcomingMovies.DataSource = dtUMovies;
                        rptUpcomingMovies.DataBind();
                    }
                    else
                    {
                        rptUpcomingMovies.Visible = false;
                        lblNoMovies.Text = "No movies found in database.";
                        lblNoMovies.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                lblNoMovies.Text = "Error: " + ex.Message;
                lblNoMovies.Visible = true;
                rptUpcomingMovies.Visible = false;
            }
        }
    }
}