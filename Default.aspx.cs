using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MajorProject
{
    public partial class Default : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMovies();
            }
        }
        private void LoadMovies()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("SELECT MovieID, Title, Genre, Duration, Rating, ImageUrl, TrailerUrl FROM Movies WHERE IsActive = 1", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    con.Open();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        rptMovies.DataSource = dt;
                        rptMovies.DataBind();
                    }
                    else
                    {
                        lblMessage.Text = "No movies available at the moment.";
                        lblMessage.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading movies: " + ex.Message;
                lblMessage.Visible = true;
            }
        }
        protected void btnTrailer_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "WatchTrailer")
            {
                string trailerUrl = e.CommandArgument.ToString();
                if (!string.IsNullOrEmpty(trailerUrl))
                {
                    // Open trailer in a new tab
                    ClientScript.RegisterStartupScript(this.GetType(), "openTrailer",
                        $"window.open('{trailerUrl}', '_blank');", true);
                }
            }
        }

        protected void btnBook_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "BookTickets")
            {
                int movieId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"BookSeats.aspx?movieId={movieId}");
            }
        }
        protected string GetStars(double rating)
        {
            // Convert 10-scale rating to 5-star rating
            int starCount = (int)Math.Round(rating / 2);
            string stars = "";

            // Add filled stars
            for (int i = 0; i < starCount; i++)
            {
                stars += "★";
            }

            // Add empty stars to complete 5 stars
            for (int i = starCount; i < 5; i++)
            {
                stars += "☆";
            }

            return stars;
        }
    }
}