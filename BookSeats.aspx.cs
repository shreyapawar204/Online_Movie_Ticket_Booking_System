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
    public partial class BookSeats : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
        private int movieId;
        private const int TICKET_PRICE = 180; // Rs. 180 per seat (updated from $10)
        private List<int> selectedSeatIds = new List<int>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["movieId"] != null && int.TryParse(Request.QueryString["movieId"], out movieId))
                {
                    LoadMovieDetails();
                    LoadDateOptions();

                    // Initially hide seat selection section
                    seatSelectionSection.Attributes["class"] = "selection-container hidden";
                    timeSelectionSection.Attributes["class"] = "selection-container hidden";
                    dateSelectionSection.Attributes["class"] = "selection-container";

                    // Set initial step indicator
                    stepDate.Attributes["class"] = "step active";
                    stepTime.Attributes["class"] = "step";
                    stepSeats.Attributes["class"] = "step";
                }
                else
                {
                    lblMessage.Text = "Invalid movie selection.";
                    lblMessage.Visible = true;
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                movieId = Convert.ToInt32(Request.QueryString["movieId"]);
                if (!string.IsNullOrEmpty(hdnSelectedSeats.Value))
                {
                    selectedSeatIds = hdnSelectedSeats.Value.Split(',')
                        .Where(s => !string.IsNullOrEmpty(s))
                        .Select(int.Parse)
                        .ToList();
                }
            }
        }

        private void LoadMovieDetails()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    // Update this query to include the ImageUrl column
                    SqlCommand cmd = new SqlCommand("SELECT Title, Genre, Duration, Rating, ImageUrl FROM Movies WHERE MovieID = @MovieID", con);
                    cmd.Parameters.AddWithValue("@MovieID", movieId);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        lblMovieTitle.Text = reader["Title"].ToString();
                        lblGenre.Text = reader["Genre"].ToString();
                        lblDuration.Text = reader["Duration"].ToString();
                        lblRating.Text = reader["Rating"].ToString();

                        // Add this line here to set the movie poster image URL
                        imgMoviePoster.ImageUrl = "~" + reader["ImageUrl"].ToString();
                    }
                    else
                    {
                        lblMessage.Text = "Movie details not found.";
                        lblMessage.Visible = true;
                        Response.Redirect("Default.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading movie details: " + ex.Message;
                lblMessage.Visible = true;
            }
        }

        private void LoadDateOptions()
        {
            // Create a DataTable to store dates
            DataTable dtDates = new DataTable();
            dtDates.Columns.Add("Date", typeof(DateTime));

            // Add current date and next 7 days
            DateTime currentDate = DateTime.Today;
            for (int i = 0; i < 7; i++)
            {
                DataRow dr = dtDates.NewRow();
                dr["Date"] = currentDate.AddDays(i);
                dtDates.Rows.Add(dr);
            }

            rptDates.DataSource = dtDates;
            rptDates.DataBind();

            // Set default date (today)
            hdnSelectedDate.Value = currentDate.ToString("yyyy-MM-dd");
            lblSelectedDate.Text = currentDate.ToString("dddd, MMMM d, yyyy");
        }

        private void LoadTimeOptions()
        {
            // Create a DataTable to store show times
            DataTable dtTimes = new DataTable();
            dtTimes.Columns.Add("Time", typeof(string));

            // Get movie showtimes from database or hardcode them
            // In a real application, you would likely get these from a database based on the movie and date
            string[] showTimes = { "10:00 AM", "1:00 PM", "4:00 PM", "7:00 PM", "10:00 PM" };

            foreach (string time in showTimes)
            {
                DataRow dr = dtTimes.NewRow();
                dr["Time"] = time;
                dtTimes.Rows.Add(dr);
            }

            rptTimes.DataSource = dtTimes;
            rptTimes.DataBind();
        }

        private void LoadSeatingArrangement()
        {
            try
            {
                // Create a DataTable to store seating arrangement
                // Create a 10x8 seat layout (8 rows A-H, 10 seats per row)
                DataTable dtRows = new DataTable();
                dtRows.Columns.Add("RowID", typeof(int));

                for (int i = 0; i < 8; i++)
                {
                    DataRow row = dtRows.NewRow();
                    row["RowID"] = i;
                    dtRows.Rows.Add(row);
                }

                rptRows.DataSource = dtRows;
                rptRows.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading seating arrangement: " + ex.Message;
                lblMessage.Visible = true;
            }
        }

        protected void rptRows_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int rowId = (int)DataBinder.Eval(e.Item.DataItem, "RowID");
                Repeater rptSeats = (Repeater)e.Item.FindControl("rptSeats");

                // Create seats for this row
                DataTable dtSeats = new DataTable();
                dtSeats.Columns.Add("SeatID", typeof(int));
                dtSeats.Columns.Add("SeatNumber", typeof(int));
                dtSeats.Columns.Add("Status", typeof(string));

                for (int i = 1; i <= 10; i++)
                {
                    DataRow dr = dtSeats.NewRow();
                    int seatId = (rowId * 10) + i;
                    dr["SeatID"] = seatId;
                    dr["SeatNumber"] = i;
                    dr["Status"] = GetSeatStatus(seatId); // Get the status considering date and time
                    dtSeats.Rows.Add(dr);
                }

                rptSeats.DataSource = dtSeats;
                rptSeats.DataBind();
            }
        }

        public string GetSeatClass(string status)
        {
            string cssClass = "seat ";

            switch (status)
            {
                case "Available":
                    cssClass += "available";
                    break;
                case "Selected":
                    cssClass += "selected";
                    break;
                case "Booked":
                    cssClass += "booked";
                    break;
                default:
                    cssClass += "available";
                    break;
            }

            return cssClass;
        }

        private string GetSeatStatus(int seatId)
        {
            // Check if seat is already booked in the database
            // Now considering the selected date and time
            string selectedDate = hdnSelectedDate.Value;
            string selectedTime = hdnSelectedTime.Value;

            if (!string.IsNullOrEmpty(selectedDate) && !string.IsNullOrEmpty(selectedTime))
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(
                        "SELECT COUNT(*) " +
                        "FROM BookingDetails bd " +
                        "INNER JOIN Bookings b ON bd.BookingID = b.BookingID " +
                        "WHERE b.MovieID = @MovieID AND bd.SeatID = @SeatID " +
                        "AND b.ShowDate = @ShowDate AND b.ShowTime = @ShowTime", con);

                    cmd.Parameters.AddWithValue("@MovieID", movieId);
                    cmd.Parameters.AddWithValue("@SeatID", seatId);
                    cmd.Parameters.AddWithValue("@ShowDate", DateTime.Parse(selectedDate));
                    cmd.Parameters.AddWithValue("@ShowTime", selectedTime);

                    con.Open();
                    int count = (int)cmd.ExecuteScalar();

                    if (count > 0)
                    {
                        return "Booked";
                    }
                }
            }

            // Check if seat is selected by the current user
            if (selectedSeatIds.Contains(seatId))
            {
                return "Selected";
            }

            return "Available";
        }

        protected void btnDate_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "SelectDate")
            {
                // Update selected date
                string selectedDate = e.CommandArgument.ToString();
                hdnSelectedDate.Value = selectedDate;
                DateTime dateValue = DateTime.Parse(selectedDate);
                lblSelectedDate.Text = dateValue.ToString("dddd, MMMM d, yyyy");

                // Reset time selection
                hdnSelectedTime.Value = string.Empty;
                lblSelectedTime.Text = string.Empty;

                // Reset seat selection
                selectedSeatIds.Clear();
                hdnSelectedSeats.Value = string.Empty;
                lblSelectedSeats.Text = string.Empty;
                lblTotalAmount.Text = "0.00";

                // Update date blocks visual state
                foreach (RepeaterItem item in rptDates.Items)
                {
                    LinkButton btnDate = (LinkButton)item.FindControl("btnDate");
                    if (btnDate.CommandArgument == selectedDate)
                    {
                        btnDate.CssClass = "date-block selected";
                    }
                    else
                    {
                        btnDate.CssClass = "date-block";
                    }
                }
            }
        }

        protected void btnTime_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "SelectTime")
            {
                // Update selected time
                string selectedTime = e.CommandArgument.ToString();
                hdnSelectedTime.Value = selectedTime;
                lblSelectedTime.Text = selectedTime;

                // Reset seat selection
                selectedSeatIds.Clear();
                hdnSelectedSeats.Value = string.Empty;
                lblSelectedSeats.Text = string.Empty;
                lblTotalAmount.Text = "0.00";

                // Update time blocks visual state
                foreach (RepeaterItem item in rptTimes.Items)
                {
                    LinkButton btnTime = (LinkButton)item.FindControl("btnTime");
                    if (btnTime.CommandArgument == selectedTime)
                    {
                        btnTime.CssClass = "time-block selected";
                    }
                    else
                    {
                        btnTime.CssClass = "time-block";
                    }
                }
            }
        }

        protected void btnSeat_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "ToggleSeat")
            {
                int seatId = Convert.ToInt32(e.CommandArgument);

                if (selectedSeatIds.Contains(seatId))
                {
                    // If seat is already selected, unselect it
                    selectedSeatIds.Remove(seatId);
                }
                else
                {
                    // If seat is available, select it
                    selectedSeatIds.Add(seatId);
                }

                // Store selected seats in hidden field
                hdnSelectedSeats.Value = string.Join(",", selectedSeatIds);

                // Update display
                UpdateBookingInfo();
                LoadSeatingArrangement();  // Reload seating arrangement to reflect the changes
            }
        }

        private void UpdateBookingInfo()
        {
            lblSelectedSeats.Text = string.Join(", ", selectedSeatIds.Select(id => GetSeatName(id)));
            lblTotalAmount.Text = (selectedSeatIds.Count * TICKET_PRICE).ToString("0.00");
        }

        private string GetSeatName(int seatId)
        {
            int row = (seatId - 1) / 10;
            int seatNum = seatId - (row * 10);

            char rowChar = (char)(65 + row); // A, B, C, etc.
            return rowChar + seatNum.ToString();
        }

        protected void btnContinueToTime_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(hdnSelectedDate.Value))
            {
                lblMessage.Text = "Please select a date first.";
                lblMessage.Visible = true;
                return;
            }

            // Load time options
            LoadTimeOptions();

            // Show time selection, hide date selection
            dateSelectionSection.Attributes["class"] = "selection-container hidden";
            timeSelectionSection.Attributes["class"] = "selection-container";
            seatSelectionSection.Attributes["class"] = "selection-container hidden";

            // Update step indicator
            stepDate.Attributes["class"] = "step completed";
            stepTime.Attributes["class"] = "step active";
            stepSeats.Attributes["class"] = "step";
        }

        protected void btnBackToDate_Click(object sender, EventArgs e)
        {
            // Show date selection, hide others
            dateSelectionSection.Attributes["class"] = "selection-container";
            timeSelectionSection.Attributes["class"] = "selection-container hidden";
            seatSelectionSection.Attributes["class"] = "selection-container hidden";

            // Update step indicator
            stepDate.Attributes["class"] = "step active";
            stepTime.Attributes["class"] = "step";
            stepSeats.Attributes["class"] = "step";
        }

        protected void btnContinueToSeats_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(hdnSelectedTime.Value))
            {
                lblMessage.Text = "Please select a show time first.";
                lblMessage.Visible = true;
                return;
            }

            // Load seating arrangement for the selected date and time
            LoadSeatingArrangement();

            // Show seat selection, hide others
            dateSelectionSection.Attributes["class"] = "selection-container hidden";
            timeSelectionSection.Attributes["class"] = "selection-container hidden";
            seatSelectionSection.Attributes["class"] = "selection-container";

            // Update step indicator
            stepDate.Attributes["class"] = "step completed";
            stepTime.Attributes["class"] = "step completed";
            stepSeats.Attributes["class"] = "step active";
        }

        protected void btnBackToTime_Click(object sender, EventArgs e)
        {
            // Show time selection, hide others
            dateSelectionSection.Attributes["class"] = "selection-container hidden";
            timeSelectionSection.Attributes["class"] = "selection-container";
            seatSelectionSection.Attributes["class"] = "selection-container hidden";

            // Update step indicator
            stepDate.Attributes["class"] = "step completed";
            stepTime.Attributes["class"] = "step active";
            stepSeats.Attributes["class"] = "step";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        protected void btnConfirmBooking_Click(object sender, EventArgs e)
        {
            if (selectedSeatIds.Count == 0)
            {
                lblMessage.Text = "Please select at least one seat to book.";
                lblMessage.Visible = true;
                return;
            }

            if (string.IsNullOrEmpty(hdnSelectedDate.Value) || string.IsNullOrEmpty(hdnSelectedTime.Value))
            {
                lblMessage.Text = "Please select both date and time for your booking.";
                lblMessage.Visible = true;
                return;
            }

            // Check if the user is logged in
            if (Session["UserID"] == null)
            {
                // Store booking information in session 
                StoreBookingInfoInSession();

                // Store the return URL in session
                Session["ReturnUrl"] = "Payment.aspx";

                // Show the login dialog instead of direct redirect
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowLoginDialog",
                    "showLoginDialog();", true);
            }
            else
            {
                // User is already logged in, store booking info and proceed to payment
                StoreBookingInfoInSession();
                Response.Redirect("Payment.aspx");
            }
        }

        // Helper method to store booking information in session
        private void StoreBookingInfoInSession()
        {
            Session["MovieID"] = movieId;
            Session["MovieTitle"] = lblMovieTitle.Text;
            Session["SelectedDate"] = hdnSelectedDate.Value;
            Session["SelectedTime"] = hdnSelectedTime.Value;
            Session["SelectedSeats"] = hdnSelectedSeats.Value;
            Session["TotalAmount"] = (selectedSeatIds.Count * TICKET_PRICE).ToString("0.00");
            Session["SeatCount"] = selectedSeatIds.Count;
        }

    }
}