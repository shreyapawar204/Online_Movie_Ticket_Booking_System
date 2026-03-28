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
    public partial class BookingReceipt : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int bookingId = GetBookingIdFromQueryString();
                if (bookingId != -1)
                {
                    LoadBookingReceipt(bookingId);
                }
                else
                {
                    ShowError("Invalid or missing booking ID.");
                }
            }
        }

        private int GetBookingIdFromQueryString()
        {
            if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int bookingId))
            {
                return bookingId;
            }
            return -1;
        }

        private void LoadBookingReceipt(int bookingId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    // First get the basic booking details
                    string query = @"
                        SELECT b.BookingID, b.MovieID, b.BookingDate, b.ShowDate, b.ShowTime, b.TotalAmount,
                               m.Title as MovieTitle,
                               p.PaymentMode, p.PaymentReference,
                               u.Name as CustomerName
                        FROM Bookings b
                        INNER JOIN Movies m ON b.MovieID = m.MovieID
                        LEFT JOIN Payments p ON b.BookingID = p.BookingID
                        LEFT JOIN Users u ON b.UserID = u.UserID
                        WHERE b.BookingID = @BookingID";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@BookingID", bookingId);

                    int movieId = 0;
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Get the movieId from the booking
                            movieId = Convert.ToInt32(reader["MovieID"]);
                            SetBookingDetails(reader);
                        }
                        else
                        {
                            ShowError("Booking information not found.");
                            return;
                        }
                    }

                    // Now specifically get the movie image
                    if (movieId > 0)
                    {
                        SetMovieImage(con, movieId);
                    }

                    // Load the seat information
                    LoadSeatInfo(con, bookingId);
                }
            }
            catch (Exception ex)
            {
                ShowError("Error loading booking receipt: " + ex.Message);
            }
        }

        private void SetMovieImage(SqlConnection con, int movieId)
        {
            try
            {
                SqlCommand imgCmd = new SqlCommand("SELECT ImageUrl FROM Movies WHERE MovieID = @MovieID", con);
                imgCmd.Parameters.AddWithValue("@MovieID", movieId);

                object result = imgCmd.ExecuteScalar();
                if (result != null && result != DBNull.Value)
                {
                    string imageUrl = result.ToString();
                    if (!string.IsNullOrEmpty(imageUrl))
                    {
                        imgMoviePoster.ImageUrl = imageUrl;
                        return;
                    }
                }

                // Fallback to placeholder if no image is found
                imgMoviePoster.ImageUrl = "Content/placeholder-movie.jpg";
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading movie image: " + ex.Message);
                imgMoviePoster.ImageUrl = "Content/placeholder-movie.jpg";
            }
        }

        private void SetBookingDetails(SqlDataReader reader)
        {
            lblBookingId.Text = reader["BookingID"].ToString();
            lblMovieTitle.Text = reader["MovieTitle"].ToString();
            lblShowDate.Text = Convert.ToDateTime(reader["ShowDate"]).ToString("dddd, MMMM d, yyyy");
            lblShowTime.Text = reader["ShowTime"].ToString();
            lblBookingDate.Text = Convert.ToDateTime(reader["BookingDate"]).ToString("MM/dd/yyyy hh:mm tt");
            lblTotalAmount.Text = "Rs. " + Convert.ToDecimal(reader["TotalAmount"]).ToString("0.00");
            lblPaymentMethod.Text = reader["PaymentMode"].ToString();

            string customerName = reader["CustomerName"].ToString();
            lblCustomerName.Text = string.IsNullOrEmpty(customerName) ? "Guest" : customerName;
        }

        private void LoadSeatInfo(SqlConnection con, int bookingId)
        {
            string seatQuery = @"
                SELECT s.SeatID
                FROM BookingDetails bd
                INNER JOIN Seats s ON bd.SeatID = s.SeatID
                WHERE bd.BookingID = @BookingID";

            SqlCommand seatCmd = new SqlCommand(seatQuery, con);
            seatCmd.Parameters.AddWithValue("@BookingID", bookingId);

            List<int> seatIds = new List<int>();
            using (SqlDataReader seatReader = seatCmd.ExecuteReader())
            {
                while (seatReader.Read())
                {
                    seatIds.Add(Convert.ToInt32(seatReader["SeatID"]));
                }
            }

            if (seatIds.Count > 0)
            {
                lblSeats.Text = string.Join(", ", seatIds.Select(id => GetSeatName(id)));
                lblTicketCount.Text = seatIds.Count.ToString();
            }
            else
            {
                lblSeats.Text = "No seats found";
                lblTicketCount.Text = "0";
            }
        }

        private string GetSeatName(int seatId)
        {
            int row = (seatId - 1) / 10;
            int seatNum = seatId - (row * 10);
            char rowChar = (char)(65 + row); // A, B, C, etc.
            return rowChar + seatNum.ToString();
        }

        private void ShowError(string message)
        {
            Panel errorPanel = new Panel { CssClass = "alert alert-danger m-3 text-center" };
            errorPanel.Controls.Add(new LiteralControl(message));

            Button btnHome = new Button
            {
                Text = "Go to Home",
                CssClass = "btn btn-primary mt-3"
            };
            btnHome.Click += (s, e) => Response.Redirect("Default.aspx");

            Control container = FindControl("MainContent");
            container?.Controls.Clear();
            container?.Controls.Add(errorPanel);
            container?.Controls.Add(btnHome);
        }

        protected void btnBackToHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}