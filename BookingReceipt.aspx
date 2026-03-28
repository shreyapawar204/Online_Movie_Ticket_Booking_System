<%@ Page Title="Booking Receipt" Language="C#" MasterPageFile="~/Filmfan.Master" AutoEventWireup="true" CodeBehind="BookingReceipt.aspx.cs" Inherits="MajorProject.BookingReceipt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="receipt-container">
        <div class="receipt-header">
            <div class="receipt-logo">FILMFAN</div>
            <div class="receipt-logo"><asp:Image ID="Image2" runat="server" Height="30px" ImageUrl="~/NewFolder1/map.png" Width="32px" />
            Suriya Nova Cinemas ,Vita.415311 </div>
            <h2>Booking Receipt</h2>
            <p>Thank you for your purchase!</p>
       
        </div>
        
        <div class="movie-info">
            <asp:Image ID="imgMoviePoster" runat="server" CssClass="movie-poster" />
            <div class="movie-details">
                <h3><asp:Label ID="lblMovieTitle" runat="server"></asp:Label></h3>
                <div class="info-row">
                    <span class="info-label">Date:</span>
                    <asp:Label ID="lblShowDate" runat="server"></asp:Label>
                </div>
                <div class="info-row">
                    <span class="info-label">Time:</span>
                    <asp:Label ID="lblShowTime" runat="server"></asp:Label>
                </div>
            </div>
        </div>

        <div class="booking-details">
            <h4>Booking Information</h4>
            <div class="info-row">
                <span class="info-label">Booking ID:</span>
                <asp:Label ID="lblBookingId" runat="server"></asp:Label>
            </div>
            <div class="info-row">
                <span class="info-label">Customer Name:</span>
                <asp:Label ID="lblCustomerName" runat="server"></asp:Label>
            </div>
            <div class="info-row">
                <span class="info-label">Booking Date:</span>
                <asp:Label ID="lblBookingDate" runat="server"></asp:Label>
            </div>
            <div class="info-row">
                <span class="info-label">Payment Method:</span>
                <asp:Label ID="lblPaymentMethod" runat="server"></asp:Label>
            </div>
        </div>

        <div class="ticket-info">
            <h4>Ticket Details</h4>
            <div class="info-row">
                <span class="info-label">Seats:</span>
                <asp:Label ID="lblSeats" runat="server"></asp:Label>
            </div>
            <div class="info-row">
                <span class="info-label">Number of Tickets:</span>
                <asp:Label ID="lblTicketCount" runat="server"></asp:Label>
            </div>
            <div class="info-row">
                <span class="info-label">Price per Ticket:</span>
                <asp:Label ID="lblTicketPrice" runat="server">Rs. 180</asp:Label>
            </div>
            <div class="info-row">
                <span class="info-label">Total Amount:</span>
                <asp:Label ID="lblTotalAmount" runat="server"></asp:Label>
            </div>
        </div>

        <div class="barcode">
            <img src="~/NewFolder1/QR-imfan.jpeg" alt="Barcode" runat="server" id="imgBarcode" />
            <p>Scan this barcode at the theater entrance</p>
        </div>

        <div class="footer">
            <p>This is an electronic ticket. Please present it at the cinema ticket counter.</p>
            <p>For any assistance, please contact us at support@filmfan.com</p>
        </div>

        <!-- Simplified Print Button -->
        <asp:Button ID="btnPrint" runat="server" Text="Print Receipt" CssClass="print-button no-print" OnClientClick="window.print(); return false;" />

        <!-- Simplified Back to Home Button -->
        <div class="text-center mt-3 no-print">
            <asp:Button ID="btnBackToHome" runat="server" Text="Back to Home" CssClass="btn btn-primary" OnClick="btnBackToHome_Click" BackColor="#0099FF" BorderColor="#3399FF" ForeColor="Black" Height="37px" PostBackUrl="~/Home.aspx" Width="152px" />

        </div>
    </div>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        .receipt-container {
            max-width: 800px;
            margin: 30px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .receipt-header {
            text-align: center;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
            margin-bottom: 20px;
        }
        .receipt-logo {
            font-size: 24px;
            font-weight: bold;
            color: #337ab7;
            margin-bottom: 10px;
        }
        .movie-info {
            display: flex;
            margin-bottom: 20px;
        }
        .movie-poster {
            width: 150px;
            margin-right: 20px;
        }
        .movie-details {
            flex-grow: 1;
        }
        .booking-details {
            margin-bottom: 20px;
        }
        .ticket-info {
            border: 1px dashed #ccc;
            padding: 15px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
        }
        .info-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .info-label {
            font-weight: bold;
            min-width: 150px;
        }
        .barcode {
            text-align: center;
            margin: 20px 0;
        }
        .barcode img {
            max-width: 300px;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            color: #777;
            font-size: 14px;
        }
        .print-button {
            display: block;
            margin: 20px auto;
            padding: 8px 16px;
            background-color: #337ab7;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .print-button:hover {
            background-color: #286090;
        }
        @media print {
            .no-print {
                display: none;
            }
            body {
                background-color: white;
            }
            .receipt-container {
                box-shadow: none;
                margin: 0;
                padding: 0;
            }
        }
    </style>

</asp:Content>


    
