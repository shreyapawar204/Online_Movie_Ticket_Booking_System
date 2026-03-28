using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MajorProject
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        private string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Filmfan.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedIn"] == null || !(bool)Session["AdminLoggedIn"])
            {
                Response.Redirect("AdminLoginPage.aspx");
            }

            if (!IsPostBack)
            {
                // Load dashboard statistics
                LoadDashboardStats();
                LoadRecentLogins();

                // Load grid data
                LoadUsers();
                LoadMovies();
                LoadBookings();

                // Initially hide form panels
                pnlUserForm.Visible = false;
                pnlMovieForm.Visible = false;
            }
        }

        private void LoadDashboardStats()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Get total bookings
                SqlCommand cmdBookings = new SqlCommand("SELECT COUNT(*) FROM BookingDetails", conn);
                lblTotalBookings.Text = cmdBookings.ExecuteScalar().ToString();

                // Get active movies
                SqlCommand cmdMovies = new SqlCommand("SELECT COUNT(*) FROM Movies WHERE IsActive = 1", conn);
                lblActiveMovies.Text = cmdMovies.ExecuteScalar().ToString();

                // Get total revenue
                SqlCommand cmdRevenue = new SqlCommand("SELECT SUM(TotalAmount) FROM Bookings", conn);
                object revenue = cmdRevenue.ExecuteScalar();
                lblTotalRevenue.Text = revenue != DBNull.Value ? "Rs" + Convert.ToDecimal(revenue).ToString() : "Rs0";

                // Get registered users
                SqlCommand cmdUsers = new SqlCommand("SELECT COUNT(*) FROM Users", conn);
                lblRegisteredUsers.Text = cmdUsers.ExecuteScalar().ToString();
            }
        }

        private void LoadRecentLogins()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT TOP 5 Name, CreatedDate FROM Users ORDER BY CreatedDate DESC", conn);
                SqlDataReader reader = cmd.ExecuteReader();

                // Generate the table dynamically
                string tableHtml = "<table><thead><tr><th>Name</th><th>Last Login</th></tr></thead><tbody>";
                while (reader.Read())
                {
                    tableHtml += $"<tr><td>{reader["Name"]}</td><td>{reader["CreatedDate"]}</td></tr>";
                }
                tableHtml += "</tbody></table>";

                // Set the generated HTML into the placeholder
                recentLoginsPlaceholder.Controls.Add(new Literal { Text = tableHtml });
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("AdminLoginPage.aspx");
        }

        #region Tab Navigation
        protected void btnUsersTab_Click(object sender, EventArgs e)
        {
            pnlUsersTab.CssClass = "tab-panel active";
            pnlMoviesTab.CssClass = "tab-panel";
            pnlBookingsTab.CssClass = "tab-panel";

            btnUsersTab.CssClass = "tab-button active";
            btnMoviesTab.CssClass = "tab-button";
            btnBookingsTab.CssClass = "tab-button";
        }

        protected void btnMoviesTab_Click(object sender, EventArgs e)
        {
            pnlUsersTab.CssClass = "tab-panel";
            pnlMoviesTab.CssClass = "tab-panel active";
            pnlBookingsTab.CssClass = "tab-panel";

            btnUsersTab.CssClass = "tab-button";
            btnMoviesTab.CssClass = "tab-button active";
            btnBookingsTab.CssClass = "tab-button";
        }

        protected void btnBookingsTab_Click(object sender, EventArgs e)
        {
            pnlUsersTab.CssClass = "tab-panel";
            pnlMoviesTab.CssClass = "tab-panel";
            pnlBookingsTab.CssClass = "tab-panel active";

            btnUsersTab.CssClass = "tab-button";
            btnMoviesTab.CssClass = "tab-button";
            btnBookingsTab.CssClass = "tab-button active";
        }
        #endregion

        #region User Management
        private void LoadUsers()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT UserID, Name, Email, CreatedDate FROM Users ORDER BY Name", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                gvUsers.DataSource = dt;
                gvUsers.DataBind();
            }
        }

        protected void btnAddNewUser_Click(object sender, EventArgs e)
        {
            // Clear form fields for new user
            txtUserID.Text = "";
            txtName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";

            // Show form
            pnlUserForm.Visible = true;
        }

        protected void btnSaveUser_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                if (string.IsNullOrEmpty(txtUserID.Text)) // Insert new user
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO Users (Name, Email, Password, CreatedDate) VALUES (@Name, @Email, @Password, @CreatedDate)", conn);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                    cmd.ExecuteNonQuery();
                }
                else // Update existing user
                {
                    SqlCommand cmd = new SqlCommand("UPDATE Users SET Name = @Name, Email = @Email, Password = @Password WHERE UserID = @UserID", conn);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(txtUserID.Text));
                    cmd.ExecuteNonQuery();
                }
            }

            // Refresh grid and hide form
            LoadUsers();
            pnlUserForm.Visible = false;
        }

        protected void btnCancelUser_Click(object sender, EventArgs e)
        {
            pnlUserForm.Visible = false;
        }

        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int userID = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditUser")
            {
                // Load user data for editing
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT UserID, Name, Email, Password FROM Users WHERE UserID = @UserID", conn);
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        txtUserID.Text = reader["UserID"].ToString();
                        txtName.Text = reader["Name"].ToString();
                        txtEmail.Text = reader["Email"].ToString();
                        txtPassword.Text = reader["Password"].ToString();

                        pnlUserForm.Visible = true;
                    }
                }
            }
            else if (e.CommandName == "DeleteUser")
            {
                // Delete user
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // First check if user has bookings
                    SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM Bookings WHERE UserID = @UserID", conn);
                    checkCmd.Parameters.AddWithValue("@UserID", userID);
                    int bookingsCount = Convert.ToInt32(checkCmd.ExecuteScalar());

                    if (bookingsCount > 0)
                    {
                        // User has bookings, can't delete
                        ScriptManager.RegisterStartupScript(this, GetType(), "DeleteError",
                            "alert('Cannot delete user because they have bookings associated with their account.');", true);
                    }
                    else
                    {
                        // Safe to delete
                        SqlCommand deleteCmd = new SqlCommand("DELETE FROM Users WHERE UserID = @UserID", conn);
                        deleteCmd.Parameters.AddWithValue("@UserID", userID);
                        deleteCmd.ExecuteNonQuery();

                        // Refresh grid
                        LoadUsers();
                    }
                }
            }
        }
        #endregion

        #region Movie Management
        private void LoadMovies()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT MovieID, Title, Genre, Duration, Rating, IsActive FROM Movies ORDER BY Title", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                gvMovies.DataSource = dt;
                gvMovies.DataBind();
            }
        }

        protected void btnAddNewMovie_Click(object sender, EventArgs e)
        {
            // Clear form fields for new movie
            txtMovieID.Text = "";
            txtTitle.Text = "";
            txtGenre.Text = "";
            txtDuration.Text = "";
            txtRating.Text = "";
            txtImageUrl.Text = "";
            txtTrailerUrl.Text = "";
            chkIsActive.Checked = true;

            // Show form
            pnlMovieForm.Visible = true;
        }

        protected void btnSaveMovie_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                if (string.IsNullOrEmpty(txtMovieID.Text)) // Insert new movie
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO Movies (Title, Genre, Duration, Rating, ImageUrl, TrailerUrl, IsActive) " +
                        "VALUES (@Title, @Genre, @Duration, @Rating, @ImageUrl, @TrailerUrl, @IsActive)", conn);
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@Genre", txtGenre.Text);
                    cmd.Parameters.AddWithValue("@Duration", Convert.ToInt32(txtDuration.Text));
                    cmd.Parameters.AddWithValue("@Rating", txtRating.Text);
                    cmd.Parameters.AddWithValue("@ImageUrl", txtImageUrl.Text);
                    cmd.Parameters.AddWithValue("@TrailerUrl", txtTrailerUrl.Text);
                    cmd.Parameters.AddWithValue("@IsActive", chkIsActive.Checked);
                    cmd.ExecuteNonQuery();
                }
                else // Update existing movie
                {
                    SqlCommand cmd = new SqlCommand("UPDATE Movies SET Title = @Title, Genre = @Genre, Duration = @Duration, " +
                        "Rating = @Rating, ImageUrl = @ImageUrl, TrailerUrl = @TrailerUrl, IsActive = @IsActive " +
                        "WHERE MovieID = @MovieID", conn);
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@Genre", txtGenre.Text);
                    cmd.Parameters.AddWithValue("@Duration", Convert.ToInt32(txtDuration.Text));
                    cmd.Parameters.AddWithValue("@Rating", txtRating.Text);
                    cmd.Parameters.AddWithValue("@ImageUrl", txtImageUrl.Text);
                    cmd.Parameters.AddWithValue("@TrailerUrl", txtTrailerUrl.Text);
                    cmd.Parameters.AddWithValue("@IsActive", chkIsActive.Checked);
                    cmd.Parameters.AddWithValue("@MovieID", Convert.ToInt32(txtMovieID.Text));
                    cmd.ExecuteNonQuery();
                }
            }

            // Refresh grid and hide form
            LoadMovies();
            LoadDashboardStats(); // Update active movies count
            pnlMovieForm.Visible = false;
        }

        protected void btnCancelMovie_Click(object sender, EventArgs e)
        {
            pnlMovieForm.Visible = false;
        }

        protected void gvMovies_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int movieID = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditMovie")
            {
                // Load movie data for editing
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT MovieID, Title, Genre, Duration, Rating, ImageUrl, TrailerUrl, IsActive " +
                        "FROM Movies WHERE MovieID = @MovieID", conn);
                    cmd.Parameters.AddWithValue("@MovieID", movieID);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        txtMovieID.Text = reader["MovieID"].ToString();
                        txtTitle.Text = reader["Title"].ToString();
                        txtGenre.Text = reader["Genre"].ToString();
                        txtDuration.Text = reader["Duration"].ToString();
                        txtRating.Text = reader["Rating"].ToString();
                        txtImageUrl.Text = reader["ImageUrl"] != DBNull.Value ? reader["ImageUrl"].ToString() : "";
                        txtTrailerUrl.Text = reader["TrailerUrl"] != DBNull.Value ? reader["TrailerUrl"].ToString() : "";
                        chkIsActive.Checked = Convert.ToBoolean(reader["IsActive"]);

                        pnlMovieForm.Visible = true;
                    }
                }
            }
            else if (e.CommandName == "DeleteMovie")
            {
                // Delete movie
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // First check if movie has bookings
                    SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM Bookings WHERE MovieID = @MovieID", conn);
                    checkCmd.Parameters.AddWithValue("@MovieID", movieID);
                    int bookingsCount = Convert.ToInt32(checkCmd.ExecuteScalar());

                    if (bookingsCount > 0)
                    {
                        // Movie has bookings, can't delete
                        ScriptManager.RegisterStartupScript(this, GetType(), "DeleteError",
                            "alert('Cannot delete movie because it has bookings associated with it. Consider marking it as inactive instead.');", true);
                    }
                    else
                    {
                        // Safe to delete
                        SqlCommand deleteCmd = new SqlCommand("DELETE FROM Movies WHERE MovieID = @MovieID", conn);
                        deleteCmd.Parameters.AddWithValue("@MovieID", movieID);
                        deleteCmd.ExecuteNonQuery();

                        // Refresh grid and statistics
                        LoadMovies();
                        LoadDashboardStats();
                    }
                }
            }
        }
        #endregion

        #region Booking Management
        private void LoadBookings()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = @"SELECT b.BookingID, m.Title as MovieTitle, u.Name as UserName, 
                               b.BookingDate, b.ShowDate, b.ShowTime, b.TotalAmount, 
                               bd.SeatID
                               FROM Bookings b
                               INNER JOIN Movies m ON b.MovieID = m.MovieID
                               INNER JOIN Users u ON b.UserID = u.UserID
                               INNER JOIN BookingDetails bd ON b.BookingID = bd.BookingID
                               ORDER BY b.BookingDate DESC";

                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                gvBookings.DataSource = dt;
                gvBookings.DataBind();
            }
        }
        #endregion
    }
}