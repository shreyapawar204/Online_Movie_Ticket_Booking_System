using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Web;

namespace MajorProject
{
    public partial class Payment : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
        private int movieId;
        private int userId = -1; // Default value if user is not logged in
        private string userName = "Guest"; // Default username if user is not logged in
        private const int TICKET_PRICE = 180; // Rs. 180 per seat
        private List<int> selectedSeatIds = new List<int>();
        private bool areSeatSelectionValid = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Hide success dialog initially
                successDialog.Style["display"] = "none";

                // Check if user is logged in
                GetCurrentUser();

                // Set the username on the page
                lblUsername.Text = userName;

                // Check if we have booking information in session
                if (Session["SelectedDate"] != null &&
                    Session["SelectedTime"] != null &&
                    Session["SelectedSeats"] != null)
                {
                    // Retrieve booking information from session
                    string selectedDate = Session["SelectedDate"].ToString();
                    string selectedTime = Session["SelectedTime"].ToString();
                    string selectedSeatsStr = Session["SelectedSeats"].ToString();
                    string totalAmount = Session["TotalAmount"].ToString();
                    int seatCount = Convert.ToInt32(Session["SeatCount"]);

                    // First retrieve movieId from session
                    // In Page_Load, right after retrieving movieId:
                    System.Diagnostics.Debug.WriteLine("Initial Movie ID from session: " + movieId);
                    if (Session["MovieID"] != null)
                    {
                        movieId = Convert.ToInt32(Session["MovieID"]);
                        // Validate movie exists
                        if (!VerifyMovieExists(movieId))
                        {
                            int validMovieId = GetValidMovieId();
                            if (validMovieId > 0)
                            {
                                movieId = validMovieId;
                                Session["MovieID"] = movieId;
                                // Update movie title if available
                                string movieTitle = GetMovieTitle(movieId);
                                if (!string.IsNullOrEmpty(movieTitle))
                                {
                                    Session["MovieTitle"] = movieTitle;
                                }
                            }
                            else
                            {
                                lblMessage.Text = "Error: No valid movies found in database. Please contact support.";
                                lblMessage.Visible = true;
                                btnProcessPayment.Enabled = false;
                                return;
                            }
                        }
                    }
                    else
                    {
                        // No MovieID in session, try to get a valid one
                        int validMovieId = GetValidMovieId();
                        if (validMovieId > 0)
                        {
                            movieId = validMovieId;
                            Session["MovieID"] = movieId;
                            // Update movie title if available
                            string movieTitle = GetMovieTitle(movieId);
                            if (!string.IsNullOrEmpty(movieTitle))
                            {
                                Session["MovieTitle"] = movieTitle;
                            }
                        }
                        else
                        {
                            lblMessage.Text = "Error: No valid movies found in database. Please contact support.";
                            lblMessage.Visible = true;
                            btnProcessPayment.Enabled = false;
                            return;
                        }
                    }

                    // Now that movieId is properly set, get the movie image
                    string movieImage = GetMovieImage(movieId);
                    if (!string.IsNullOrEmpty(movieImage))
                    {
                        imgMoviePoster.ImageUrl = movieImage;
                        imgMoviePoster.Visible = true;
                    }
                    else
                    {
                        imgMoviePoster.Visible = false;
                    }

                    // Process selected seats - Add validation and error message
                    if (!string.IsNullOrEmpty(selectedSeatsStr))
                    {
                        selectedSeatIds = selectedSeatsStr.Split(',')
                            .Where(s => !string.IsNullOrEmpty(s))
                            .Select(int.Parse)
                            .ToList();

                        // Check if we actually have seats after processing
                        if (selectedSeatIds.Count == 0)
                        {
                            lblMessage.Text = "No seats were found in your selection.";
                            lblMessage.Visible = true;
                            btnProcessPayment.Enabled = false;
                        }
                    }
                    else
                    {
                        lblMessage.Text = "No seats selected for booking.";
                        lblMessage.Visible = true;
                        btnProcessPayment.Enabled = false;
                    }

                    // Populate the booking summary
                    lblMovieTitle.Text = Session["MovieTitle"]?.ToString() ?? "Selected Movie";
                    lblSelectedDate.Text = DateTime.Parse(selectedDate).ToString("dddd, MMMM d, yyyy");
                    lblSelectedTime.Text = selectedTime;
                    lblSelectedSeats.Text = string.Join(", ", selectedSeatIds.Select(id => GetSeatName(id)));
                    lblTicketCount.Text = seatCount.ToString();
                    lblTotalAmount.Text = totalAmount;
                }
                else
                {
                    // Redirect back to BookSeats page if no information is available
                    Response.Redirect("BookSeats.aspx");
                }
            }
        }
        private string GetMovieImage(int movieId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT ImageUrl FROM Movies WHERE MovieID = @MovieID", con);
                    cmd.Parameters.AddWithValue("@MovieID", movieId);
                    object result = cmd.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        return result.ToString();
                    }
                    return string.Empty;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error getting movie image: " + ex.Message);
                return string.Empty;
            }
        }

        // Get the current logged-in user information
        private void GetCurrentUser()
        {
            try
            {
                // Check if user is logged in (assuming UserID is stored in session)
                if (Session["UserID"] != null)
                {
                    userId = Convert.ToInt32(Session["UserID"]);

                    // Get username from database
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("SELECT Name FROM Users WHERE UserID = @UserID", con);
                        cmd.Parameters.AddWithValue("@UserID", userId);
                        object result = cmd.ExecuteScalar();
                        if (result != null && result != DBNull.Value)
                        {
                            userName = result.ToString();
                        }
                    }
                }
                else if (Session["Username"] != null)
                {
                    // If we have username but not ID, get the ID from the database
                    userName = Session["Username"].ToString();
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("SELECT UserID FROM Users WHERE Name = @Name", con);
                        cmd.Parameters.AddWithValue("@Name", userName);
                        object result = cmd.ExecuteScalar();
                        if (result != null && result != DBNull.Value)
                        {
                            userId = Convert.ToInt32(result);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error getting user information: " + ex.Message);
                // Fall back to default values (already set)
            }
        }

        // Get a valid MovieID from the database
        private int GetValidMovieId()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT TOP 1 MovieID FROM Movies WHERE IsActive = 1 ORDER BY MovieID", con);
                    object result = cmd.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        return Convert.ToInt32(result);
                    }
                    return -1;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error getting valid movie ID: " + ex.Message);
                return -1;
            }
        }

        // Get movie title for a given MovieID
        private string GetMovieTitle(int movieId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT Title FROM Movies WHERE MovieID = @MovieID", con);
                    cmd.Parameters.AddWithValue("@MovieID", movieId);
                    object result = cmd.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        return result.ToString();
                    }
                    return string.Empty;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error getting movie title: " + ex.Message);
                return string.Empty;
            }
        }

        // Verify if the movie exists
        private bool VerifyMovieExists(int movieId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Movies WHERE MovieID = @MovieID", con);
                    cmd.Parameters.AddWithValue("@MovieID", movieId);
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error verifying movie: " + ex.Message);
                return false;
            }
        }

        private string GetSeatName(int seatId)
        {
            int row = (seatId - 1) / 10;
            int seatNum = seatId - (row * 10);

            char rowChar = (char)(65 + row); // A, B, C, etc.
            return rowChar + seatNum.ToString();
        }

        protected void btnBackToSeats_Click(object sender, EventArgs e)
        {
            // Redirect back to the seat selection page
            Response.Redirect("BookSeats.aspx");
        }

        protected void btnProcessPayment_Click(object sender, EventArgs e)
        {
            // First ensure we have the correct movieId from session
            if (Session["MovieID"] != null)
            {
                movieId = Convert.ToInt32(Session["MovieID"]);
            }

            if (Session["SelectedSeats"] == null || string.IsNullOrEmpty(Session["SelectedSeats"].ToString()))
            {
                lblMessage.Text = "No seats selected for booking.";
                lblMessage.Visible = true;
                return;
            }

            // Only replace movieId if it absolutely doesn't exist
            if (!VerifyMovieExists(movieId))
            {
                lblMessage.Text = "Error: The selected movie is no longer available. Please select another movie.";
                lblMessage.Visible = true;
                return;

                // Don't automatically replace with another movie - force user to make a new selection
                // Remove this auto-replacement:
                /*
                int validMovieId = GetValidMovieId();
                if (validMovieId > 0)
                {
                    movieId = validMovieId;
                    Session["MovieID"] = movieId;
                }
                else
                {
                    lblMessage.Text = "Error: No valid movies found in database. Please contact support.";
                    lblMessage.Visible = true;
                    return;
                }
                */
            }

            // Debug output to verify correct movieId
            // In the database insert section:
            System.Diagnostics.Debug.WriteLine("Final Movie ID for booking: " + movieId);


            // Re-populate selected seats from session if needed
            if (selectedSeatIds.Count == 0)
            {
                string selectedSeatsStr = Session["SelectedSeats"].ToString();
                selectedSeatIds = selectedSeatsStr.Split(',')
                    .Where(s => !string.IsNullOrEmpty(s))
                    .Select(int.Parse)
                    .ToList();
            }

            if (selectedSeatIds.Count == 0)
            {
                lblMessage.Text = "No seats selected for booking.";
                lblMessage.Visible = true;
                return;
            }

            // Make sure we have the current user information
            if (userId <= 0)
            {
                GetCurrentUser();
            }

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlTransaction transaction = con.BeginTransaction();

                    try
                    {
                        // In the btnProcessPayment_Click method, before creating the booking:
                        // In btnProcessPayment_Click, after validating movieId
                        

                        // In the database insert
                        
                        // Create booking record
                        SqlCommand cmdInsertBooking = new SqlCommand(
                            "INSERT INTO Bookings (MovieID, BookingDate, ShowDate, ShowTime, TotalAmount, UserID) " +
                            "VALUES (@MovieID, @BookingDate, @ShowDate, @ShowTime, @TotalAmount, @UserID); SELECT SCOPE_IDENTITY();", con, transaction);
                        System.Diagnostics.Debug.WriteLine("Movie ID for booking: " + movieId);
                        cmdInsertBooking.Parameters.AddWithValue("@MovieID", movieId);
                        cmdInsertBooking.Parameters.AddWithValue("@BookingDate", DateTime.Now);
                        cmdInsertBooking.Parameters.AddWithValue("@ShowDate", DateTime.Parse(Session["SelectedDate"].ToString()));
                        cmdInsertBooking.Parameters.AddWithValue("@ShowTime", Session["SelectedTime"].ToString());
                        cmdInsertBooking.Parameters.AddWithValue("@TotalAmount", Convert.ToDecimal(Session["TotalAmount"]));

                        // Add UserID parameter (use DBNull if not logged in)
                        if (userId > 0)
                        {
                            cmdInsertBooking.Parameters.AddWithValue("@UserID", userId);
                        }
                        else
                        {
                            cmdInsertBooking.Parameters.AddWithValue("@UserID", DBNull.Value);
                        }

                        int bookingId = Convert.ToInt32(cmdInsertBooking.ExecuteScalar());

                        // Insert seat details
                        foreach (int seatId in selectedSeatIds)
                        {
                            SqlCommand cmdInsertSeat = new SqlCommand(
                                "INSERT INTO BookingDetails (BookingID, SeatID, UserID) VALUES (@BookingID, @SeatID, @UserID)", con, transaction);

                            cmdInsertSeat.Parameters.AddWithValue("@BookingID", bookingId);
                            cmdInsertSeat.Parameters.AddWithValue("@SeatID", seatId);

                            // Add UserID parameter (use DBNull if not logged in)
                            if (userId > 0)
                            {
                                cmdInsertSeat.Parameters.AddWithValue("@UserID", userId);
                            }
                            else
                            {
                                cmdInsertSeat.Parameters.AddWithValue("@UserID", DBNull.Value);
                            }

                            cmdInsertSeat.ExecuteNonQuery();
                        }

                        // Insert payment details
                        string paymentMode = ddlPaymentMode.SelectedValue;
                        SqlCommand cmdInsertPayment = new SqlCommand(
                            "INSERT INTO Payments (BookingID, PaymentMode, PaymentAmount, PaymentStatus, PaymentDate, PaymentReference, UserID) " +
                            "VALUES (@BookingID, @PaymentMode, @PaymentAmount, @PaymentStatus, @PaymentDate, @PaymentReference, @UserID)", con, transaction);

                        cmdInsertPayment.Parameters.AddWithValue("@BookingID", bookingId);
                        cmdInsertPayment.Parameters.AddWithValue("@PaymentMode", paymentMode);
                        cmdInsertPayment.Parameters.AddWithValue("@PaymentAmount", Convert.ToDecimal(Session["TotalAmount"]));
                        cmdInsertPayment.Parameters.AddWithValue("@PaymentStatus", "Completed");
                        cmdInsertPayment.Parameters.AddWithValue("@PaymentDate", DateTime.Now);
                        // Add a payment reference
                        cmdInsertPayment.Parameters.AddWithValue("@PaymentReference", "PAY-" + DateTime.Now.ToString("yyyyMMddHHmmss") + "-" + bookingId);

                        // Add UserID parameter (use DBNull if not logged in)
                        if (userId > 0)
                        {
                            cmdInsertPayment.Parameters.AddWithValue("@UserID", userId);
                        }
                        else
                        {
                            cmdInsertPayment.Parameters.AddWithValue("@UserID", DBNull.Value);
                        }

                        cmdInsertPayment.ExecuteNonQuery();

                        transaction.Commit();

                        // Set the booking ID in the success dialog
                        lblBookingId.Text = "Booking ID: " + bookingId;
                        hdnBookingId.Value = bookingId.ToString();

                        // Show the success dialog
                        successDialog.Style["display"] = "flex";

                        // Add client-side script to show the dialog
                        ScriptManager.RegisterStartupScript(this, GetType(), "showDialog", "showSuccessDialog();", true);

                        // Disable the payment button after successful payment
                        btnProcessPayment.Enabled = false;

                        // Clear the session data
                        Session.Remove("MovieID");
                        Session.Remove("MovieTitle");
                        Session.Remove("SelectedDate");
                        Session.Remove("SelectedTime");
                        Session.Remove("SelectedSeats");
                        Session.Remove("TotalAmount");
                        Session.Remove("SeatCount");
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        throw ex;
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the full error for debugging
                System.Diagnostics.Debug.WriteLine("Payment Error: " + ex.ToString());

                // Display a user-friendly message
                if (ex.Message.Contains("FOREIGN KEY constraint"))
                {
                    lblMessage.Text = "Error: The selected movie is not available for booking. Please select another movie.";
                }
                else
                {
                    lblMessage.Text = "Error processing payment: " + ex.Message;
                }
                lblMessage.Visible = true;
            }
        }
        protected void btnContinue_Click(object sender, EventArgs e)
        {
            // Get the booking ID from the hidden field
            string bookingId = hdnBookingId.Value;

            // Make sure it's not empty
            if (!string.IsNullOrEmpty(bookingId))
            {
                // Redirect to the BookingReceipt page with the booking ID
                Response.Redirect($"BookingReceipt.aspx?id={bookingId}");
            }
            else
            {
                // Fallback if no booking ID
                Response.Redirect("Default.aspx");
            }
        }
    }
}