<%@ Page Title="Book Movie Seats" Language="C#" MasterPageFile="~/Filmfan.Master" AutoEventWireup="true" CodeBehind="BookSeats.aspx.cs" Inherits="MajorProject.BookSeats" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        /* Keep all your other CSS styles here */
        .screen {
            background-color: #ddd;
            height: 30px;
            border-radius: 10px;
            text-align: center;
            line-height: 30px;
            font-weight: bold;
            color: #555;
            margin-bottom: 30px;
        }
        .seats-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
        }
        .row {
            display: flex;
            justify-content: center;
            margin: 5px 0;
        }
        .seat {
            width: 40px;
            height: 40px;
            margin: 5px;
            background-color: #bbb;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            line-height: 40px;
            font-weight: bold;
        }
        .seat.available {
            background-color: #bbb;
        }
        .seat.selected {
            background-color: #4CAF50;
            color: white;
        }
        .seat.booked {
            background-color: #f44336;
            color: white;
            cursor: not-allowed;
        }
        .legend {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .legend-item {
            display: flex;
            align-items: center;
            margin: 0 10px;
        }
        .legend-color {
            width: 20px;
            height: 20px;
            border-radius: 5px;
            margin-right: 5px;
        }
        .booking-info {
            margin-top: 30px;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
        }
        .date-selection {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }
        .date-block {
            width: 80px;
            height: 80px;
            margin: 5px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            cursor: pointer;
        }
        .date-block:hover {
            background-color: #f0f0f0;
        }
        .date-block.selected {
            background-color: #007bff;
            color: white;
        }
        .date-block .day {
            font-size: 16px;
            font-weight: bold;
        }
        .date-block .date {
            font-size: 22px;
            font-weight: bold;
        }
        .date-block .month {
            font-size: 14px;
        }
        .time-selection {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }
        .time-block {
            width: 100px;
            height: 40px;
            margin: 5px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-weight: bold;
        }
        .time-block:hover {
            background-color: #f0f0f0;
        }
        .time-block.selected {
            background-color: #007bff;
            color: white;
        }
        .selection-container {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .selection-title {
            font-weight: bold;
            margin-bottom: 10px;
        }
        .hidden {
            display: none;
        }
        .step-indicator {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .step {
            width: 30%;
            text-align: center;
            padding: 10px;
            border-radius: 5px;
            background-color: #ddd;
        }
        .step.active {
            background-color: #007bff;
            color: white;
        }
        .step.completed {
            background-color: #4CAF50;
            color: white;
        }
     
    
    .modal-header {
        padding: 15px;
        background-color: #007bff;
        color: white;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }
    
    /* Modal Body */
    .modal-body {
        padding: 20px;
    }
    
    /* Modal Footer */
    .modal-footer {
        padding: 15px;
        text-align: right;
        border-top: 1px solid #ddd;
    }
    
    /* Close Button */
    .close-modal {
        color: white;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
    
    .close-modal:hover,
    .close-modal:focus {
        color: #ddd;
        text-decoration: none;
        cursor: pointer;
    }
    
    /* Button Styling */
    .modal-footer .button {
        margin-left: 10px;
    }
    /* Button styling */
.button, input[type="submit"], input[type="button"] {
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 4px;
    padding: 10px 15px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s ease;
    margin: 5px;
}

.button:hover, input[type="submit"]:hover, input[type="button"]:hover {
    background-color: #0056b3;
    box-shadow: 0 2px 5px rgba(0,0,0,0.2);
}

.back-button {
    background-color: #6c757d;
}

.back-button:hover {
    background-color: #5a6268;
}

#btnConfirmBooking {
    background-color: #28a745;
    font-size: 16px;
    padding: 12px 20px;
}

#btnConfirmBooking:hover {
    background-color: #218838;
}

.modal-footer .button {
    padding: 8px 12px;
}

#btnLoginRedirect {
    background-color: #007bff;
}

#btnLoginRedirect:hover {
    background-color: #0056b3;
}

#btnCancelLogin {
    background-color: #6c757d;
}

#btnCancelLogin:hover {
    background-color: #5a6268;
}
    /* Modal styling */
.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.5);
    /* This makes sure the modal covers the entire screen */
}

.modal-content {
    position: relative;
    background-color: #fff;
    margin: 0;
    padding: 0;
    border: 1px solid #888;
    width: 400px;
    max-width: 90%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    border-radius: 5px;
    animation: modalopen 0.4s;
    
    /* Center the modal both horizontally and vertically */
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

@keyframes modalopen {
    from {opacity: 0; transform: translate(-50%, -70%);}
    to {opacity: 1; transform: translate(-50%, -50%);}
}

    </style>

    <div class="container">
        <h1>Book Your Seats</h1>

        <!-- Movie Details Section -->
       <!-- Movie Details Section -->
<div class="movie-details">
    <div class="movie-details-flex">
        <div class="movie-poster">
            <asp:Image ID="imgMoviePoster" runat="server" CssClass="poster-image" />
        </div>
        <div class="movie-info-container">
            <div class="movie-title">
                <asp:Label ID="lblMovieTitle" runat="server" Font-Size="X-Large" Font-Bold="True"></asp:Label>
            </div>
            <div class="movie-info">
                <div>Duration: <asp:Label ID="lblDuration" runat="server"></asp:Label> min</div>
                <div>Genre: <asp:Label ID="lblGenre" runat="server"></asp:Label></div>
                <div>Rating: <asp:Label ID="lblRating" runat="server"></asp:Label>/10</div>
            </div>
        </div>
    </div>
</div>
        </div>

        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <!-- Step Indicator -->
                <div class="step-indicator">
                    <div class="step active" id="stepDate" runat="server">1. Select Date</div>
                    <div class="step" id="stepTime" runat="server">2. Select Time</div>
                    <div class="step" id="stepSeats" runat="server">3. Select Seats</div>
                </div>

                <!-- Date Selection Section -->
                <div id="dateSelectionSection" runat="server" class="selection-container">
                    <div class="selection-title">Select a Date:</div>
                    <div class="date-selection">
                        <asp:Repeater ID="rptDates" runat="server">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDate" runat="server" CssClass='<%# "date-block" + (Container.ItemIndex == 0 ? " selected" : "") %>' 
                                    CommandName="SelectDate" CommandArgument='<%# Eval("Date", "{0:yyyy-MM-dd}") %>' OnCommand="btnDate_Command">
                                    <div class="day"><%# Eval("Date", "{0:ddd}") %></div>
                                    <div class="date"><%# Eval("Date", "{0:dd}") %></div>
                                    <div class="month"><%# Eval("Date", "{0:MMM}") %></div>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div style="text-align: center; margin-top: 10px;">
                        <asp:Button ID="btnContinueToTime" runat="server" Text="Continue to Time Selection" OnClick="btnContinueToTime_Click" />
                    </div>
                </div>

                <!-- Time Selection Section -->
                <div id="timeSelectionSection" runat="server" class="selection-container hidden">
                    <div class="selection-title">Select a Time:</div>
                    <div class="time-selection">
                        <asp:Repeater ID="rptTimes" runat="server">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnTime" runat="server" CssClass="time-block" 
                                    CommandName="SelectTime" CommandArgument='<%# Eval("Time") %>' OnCommand="btnTime_Command">
                                    <%# Eval("Time") %>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div style="text-align: center; margin-top: 10px;">
                        <asp:Button ID="btnBackToDate" runat="server" Text="Back to Date Selection" OnClick="btnBackToDate_Click" />
                        <asp:Button ID="btnContinueToSeats" runat="server" Text="Continue to Seat Selection" OnClick="btnContinueToSeats_Click" />
                    </div>
                </div>

                <!-- Seat Selection Section -->
                <div id="seatSelectionSection" runat="server" class="selection-container hidden">
                    <!-- Screen Display -->
                    <div class="screen">SCREEN</div>

                    <!-- Seat Legend -->
                    <div class="legend">
                        <div class="legend-item">
                            <div class="legend-color" style="background-color: #bbb;"></div>
                            <span>Available</span>
                        </div>
                        <div class="legend-item">
                            <div class="legend-color" style="background-color: #4CAF50;"></div>
                            <span>Selected</span>
                        </div>
                        <div class="legend-item">
                            <div class="legend-color" style="background-color: #f44336;"></div>
                            <span>Booked</span>
                        </div>
                    </div>

                    <!-- Seats Container -->
                    <div class="seats-container">
                        <!-- Repeater for Rows -->
                        <asp:Repeater ID="rptRows" runat="server" OnItemDataBound="rptRows_ItemDataBound">
                            <ItemTemplate>
                                <div class="row">
                                    <!-- Row Label (A, B, C...) -->
                                    <div class="row-label">
                                        <%# (char)(65 + Convert.ToInt32(DataBinder.Eval(Container.DataItem, "RowID"))) %>
                                    </div>

                                    <!-- Seats for this row -->
                                    <asp:Repeater ID="rptSeats" runat="server">
                                        <ItemTemplate>
                                            <div class="seat-container">
                                                <asp:LinkButton ID="btnSeat" runat="server" 
                                                    CssClass='<%# "seat " + (Eval("Status").ToString() == "Available" ? "available" : (Eval("Status").ToString() == "Selected" ? "selected" : "booked")) %>'
                                                    CommandName="ToggleSeat" 
                                                    CommandArgument='<%# Eval("SeatID") %>' 
                                                    OnCommand="btnSeat_Command" 
                                                    Enabled='<%# Eval("Status").ToString() != "Booked" %>'>
                                                    <asp:Label ID="lblSeatNumber" runat="server" Text='<%# Eval("SeatNumber") %>'></asp:Label>
                                                </asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <div style="text-align: center; margin-top: 10px;">
                        <asp:Button ID="btnBackToTime" runat="server" Text="Back to Time Selection" OnClick="btnBackToTime_Click" />
                    </div>
                </div>

                <!-- Booking Info -->
                <div class="booking-info">
    <h3>Booking Information</h3>
    <p>Selected Date: <asp:Label ID="lblSelectedDate" runat="server"></asp:Label></p>
    <p>Selected Time: <asp:Label ID="lblSelectedTime" runat="server"></asp:Label></p>
    <p>Selected Seats: <asp:Label ID="lblSelectedSeats" runat="server"></asp:Label></p>
    <p>Total Amount: Rs. <asp:Label ID="lblTotalAmount" runat="server">0.00</asp:Label></p>
    <asp:Button ID="btnBack" runat="server" Text="Back to Movies" CssClass="button back-button" OnClick="btnBack_Click" />
    <asp:Button ID="btnConfirmBooking" runat="server" Text="Proceed to Payment" CssClass="button" OnClick="btnConfirmBooking_Click" />
</div>

                <!-- Error Message -->
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>

                <!-- Hidden Fields -->
                <asp:HiddenField ID="hdnSelectedSeats" runat="server" />
                <asp:HiddenField ID="hdnSelectedDate" runat="server" />
                <asp:HiddenField ID="hdnSelectedTime" runat="server" />
                <div id="loginRequiredModal" class="modal" style="display:none;">
    <div class="modal-content">
        <div class="modal-header">
            <span class="close-modal">&times;</span>
            <h2>Login Required</h2>
        </div>
        <div class="modal-body">
            <p>You need to login first before proceeding to payment.</p>
        </div>
        <div class="modal-footer">
            <button id="btnLoginRedirect" class="button">Login</button>
            <button id="btnCancelLogin" class="button back-button">Cancel</button>
        </div>
    </div>
</div>

            </ContentTemplate>
        </asp:UpdatePanel>
    <script type="text/javascript">
        function showLoginDialog() {
            // Show the login modal
            document.getElementById('loginRequiredModal').style.display = 'block';

            // Handle the close button
            document.querySelector('.close-modal').onclick = function () {
                document.getElementById('loginRequiredModal').style.display = 'none';
            };

            // Handle the Login button
            document.getElementById('btnLoginRedirect').onclick = function () {
                window.location.href = 'LoginForm.aspx';
            };

            // Handle the Cancel button
            document.getElementById('btnCancelLogin').onclick = function () {
                document.getElementById('loginRequiredModal').style.display = 'none';
            };

            // Close the modal if user clicks outside of it
            window.onclick = function (event) {
                if (event.target == document.getElementById('loginRequiredModal')) {
                    document.getElementById('loginRequiredModal').style.display = 'none';
                }
            };
        }
    </script>
   
</asp:Content>