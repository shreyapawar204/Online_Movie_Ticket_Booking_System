<%@ Page Title="Payment" Language="C#" MasterPageFile="~/Filmfan.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="MajorProject.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .page-title {
            color: #333;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .booking-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .movie-poster {
            flex: 0 0 250px;
            margin-right: 20px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }
        .movie-poster:hover {
            transform: scale(1.02);
        }
        .movie-poster img {
            width: 100%;
            height: auto;
            display: block;
        }
        .booking-summary {
            flex: 1;
            min-width: 300px;
            background: linear-gradient(to bottom, #f9f9f9, #efefef);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .summary-header {
            color: #007bff;
            margin-top: 0;
            font-size: 1.4em;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }
        .summary-row {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid #eee;
        }
        .summary-label {
            font-weight: bold;
            color: #555;
        }
        .total-row {
            background-color: #e8f4ff;
            padding: 12px;
            border-radius: 5px;
            margin-top: 10px;
            font-size: 1.1em;
            font-weight: bold;
            color: #0056b3;
        }
        .user-info {
            margin-bottom: 20px;
            padding: 15px;
            background-color: #e9f7fd;
            border-radius: 10px;
            border-left: 4px solid #17a2b8;
        }
        .payment-options {
            margin-top: 30px;
            padding: 20px;
            background: linear-gradient(to bottom, #f9f9f9, #efefef);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .payment-options h3 {
            color: #007bff;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }
        .payment-mode {
            margin-top: 15px;
            margin-bottom: 15px;
        }
        .payment-mode select {
            padding: 10px;
            width: 100%;
            max-width: 300px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .button {
            padding: 12px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .button:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }
        .back-button {
            background-color: #6c757d;
        }
        .back-button:hover {
            background-color: #5a6268;
        }
        
        /* Success Dialog Styles - Keeping as is, they're already good */
        .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }
        
        .success-dialog {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            padding: 0;
            width: 90%;
            max-width: 400px;
            animation: slideDown 0.4s ease-out;
        }
        
        @keyframes slideDown {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
        
        .dialog-header {
            background-color: #28a745;
            color: white;
            padding: 15px 20px;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .dialog-title {
            font-size: 18px;
            font-weight: bold;
            margin: 0;
        }
        
        .dialog-content {
            padding: 20px;
            text-align: center;
        }
        
        .dialog-icon {
            font-size: 48px;
            color: #28a745;
            margin-bottom: 15px;
        }
        
        .dialog-message {
            color: #333;
            font-size: 16px;
            margin-bottom: 15px;
        }
        
        .booking-id {
            font-weight: bold;
            font-size: 18px;
            color: #007bff;
            margin: 10px 0;
        }
        
        .dialog-footer {
            padding: 10px 20px 20px;
            text-align: center;
        }
        
        .close-dialog {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        .close-dialog:hover {
            background-color: #0056b3;
        }
        
        .close-icon {
            font-size: 20px;
            color: white;
            cursor: pointer;
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .booking-container {
                flex-direction: column;
            }
            .movie-poster {
                margin-right: 0;
                margin-bottom: 20px;
                max-width: 100%;
            }
        }
    </style>

    <div class="container">
        <h1 class="page-title">Complete Your Payment</h1>
        
        <!-- User Information -->
        <div class="user-info">
            <span class="summary-label">Welcome, </span>
            <asp:Label ID="lblUsername" runat="server"></asp:Label>! Enjoy your movie experience.
        </div>
        
        <div class="booking-container">
            <!-- Movie Poster -->
            <div class="movie-poster">
                <asp:Image ID="imgMoviePoster" runat="server" AlternateText="Movie Poster" />
            </div>
            
            <!-- Booking Summary -->
            <div class="booking-summary">
                <h3 class="summary-header">Booking Summary</h3>
                <div class="summary-row">
                    <span class="summary-label">Movie:</span>
                    <asp:Label ID="lblMovieTitle" runat="server"></asp:Label>
                </div>
                <div class="summary-row">
                    <span class="summary-label">Date:</span>
                    <asp:Label ID="lblSelectedDate" runat="server"></asp:Label>
                </div>
                <div class="summary-row">
                    <span class="summary-label">Time:</span>
                    <asp:Label ID="lblSelectedTime" runat="server"></asp:Label>
                </div>
                <div class="summary-row">
                    <span class="summary-label">Seats:</span>
                    <asp:Label ID="lblSelectedSeats" runat="server"></asp:Label>
                </div>
                <div class="summary-row">
                    <span class="summary-label">Number of Tickets:</span>
                    <asp:Label ID="lblTicketCount" runat="server"></asp:Label>
                </div>
                <div class="summary-row">
                    <span class="summary-label">Ticket Price:</span>
                    <span>Rs. 180.00 per ticket</span>
                </div>
                <div class="total-row summary-row">
                    <span class="summary-label">Total Amount:</span>
                    <span>Rs. <asp:Label ID="lblTotalAmount" runat="server">0.00</asp:Label></span>
                </div>
            </div>
        </div>

        <!-- Payment Options -->
        <div class="payment-options">
            <h3>Payment Options</h3>
            <div class="payment-mode">
                <p>Select Payment Mode:</p>
                <asp:DropDownList ID="ddlPaymentMode" runat="server">
                    <asp:ListItem Value="Credit Card">Credit Card</asp:ListItem>
                    <asp:ListItem Value="Debit Card">Debit Card</asp:ListItem>
                    <asp:ListItem Value="UPI">UPI</asp:ListItem>
                    <asp:ListItem Value="Net Banking">Net Banking</asp:ListItem>
                    <asp:ListItem Value="Cash">Cash</asp:ListItem>
                </asp:DropDownList>
            </div>
            
            <div style="margin-top: 20px;">
                <asp:Button ID="btnBackToSeats" runat="server" Text="Back to Seat Selection" CssClass="button back-button" OnClick="btnBackToSeats_Click" />
                <asp:Button ID="btnProcessPayment" runat="server" Text="Process Payment" CssClass="button" OnClick="btnProcessPayment_Click" />
            </div>
        </div>

        <!-- Error Message -->
        <div style="margin-top: 20px;">
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
        </div>
        
        <!-- Hidden Field to store Booking ID -->
        <asp:HiddenField ID="hdnBookingId" runat="server" />
    </div>
    
    <!-- Success Dialog Box -->
    <div id="successDialog" class="modal-overlay" runat="server">
        <div class="success-dialog">
            <div class="dialog-header">
                <h3 class="dialog-title">Payment Successful</h3>
                <span class="close-icon" onclick="closeSuccessDialog()">×</span>
            </div>
            <div class="dialog-content">
                <div class="dialog-icon">✓</div>
                <div class="dialog-message">
                    Payment processed successfully!<br>
                    Your booking is confirmed.
                </div>
                <div class="booking-id">
                    <asp:Label ID="lblBookingId" runat="server"></asp:Label>
                </div>
            </div>
            <div class="dialog-footer">
    <asp:Button ID="Button1" runat="server" Text="Continue" CssClass="close-dialog" OnClick="btnContinue_Click" />
</div>
        </div>
        <!-- Add this code inside the success dialog div in Payment.aspx -->

    </div>
    
    <script type="text/javascript">
        function showSuccessDialog() {
            document.getElementById('<%= successDialog.ClientID %>').style.display = 'flex';
        }
        
        
    </script>
</asp:Content>