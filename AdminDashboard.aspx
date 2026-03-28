<%@ Page Title="" Language="C#" MasterPageFile="~/Filmfan.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="MajorProject.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>FilmFan Admin Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
    <!-- Enhanced styles will be added here -->
    /* Updated Admin Dashboard Styles */
body {
    margin: 0;
    padding: 0;
    font-family: 'Poppins', 'Segoe UI', sans-serif;
    background: #f8f9fa;
    color: #343a40;
}

.dashboard-container {
    display: flex;
    min-height: 100vh;
}

.main-content {
    flex: 1;
    padding: 30px;
    background: #fff;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
    border-radius: 10px;
    margin: 20px;
}

/* Enhanced Header */
.header {
    background: linear-gradient(135deg, #304FFE, #1a237e);
    padding: 25px 30px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-radius: 10px;
    margin-bottom: 30px;
    color: white;
}

.header h2 {
    margin: 0;
    font-weight: 600;
    position: relative;
}

.header h2::after {
    content: '';
    position: absolute;
    bottom: -8px;
    left: 0;
    width: 50px;
    height: 3px;
    background: #fff;
    border-radius: 5px;
}

/* Improved Logout Button */
.btn-logout {
    background: rgba(255, 255, 255, 0.2);
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 50px;
    cursor: pointer;
    transition: all 0.3s ease;
    font-weight: 500;
    display: flex;
    align-items: center;
    gap: 8px;
}

.btn-logout:hover {
    background: rgba(255, 255, 255, 0.3);
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.btn-logout::before {
    content: "\f2f5"; /* Font Awesome logout icon */
    font-family: "Font Awesome 6 Free";
    font-weight: 900;
}

/* Enhanced Statistics Cards */
.stats-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 25px;
    margin-top: 30px;
    margin-bottom: 40px;
}

.stat-card {
    background: white;
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    transition: all 0.3s ease;
    border-left: 5px solid #304FFE;
    position: relative;
    overflow: hidden;
}

.stat-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}

.stat-card h3 {
    margin-top: 0;
    font-size: 18px;
    color: #495057;
    margin-bottom: 15px;
}

.stat-card span {
    font-size: 28px;
    font-weight: 600;
    color: #304FFE;
}

.stat-card::before {
    content: '';
    position: absolute;
    top: 0;
    right: 0;
    width: 100px;
    height: 100px;
    background: rgba(48, 79, 254, 0.05);
    border-radius: 50%;
    transform: translate(30%, -30%);
}

/* Card Icon Styling */
.stat-card:nth-child(1) {
    border-left-color: #304FFE;
}

.stat-card:nth-child(2) {
    border-left-color: #FF5722;
}

.stat-card:nth-child(3) {
    border-left-color: #4CAF50;
}

.stat-card:nth-child(4) {
    border-left-color: #9C27B0;
}

/* Enhanced Tab Styles */
.tab-container {
    margin-top: 40px;
    background: white;
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    overflow: hidden;
}

.tab-buttons {
    display: flex;
    border-bottom: 1px solid #e9ecef;
    background: #f8f9fa;
    padding: 5px 5px 0;
}

.tab-button {
    padding: 15px 25px;
    background: transparent;
    border: none;
    border-radius: 10px 10px 0 0;
    margin-right: 5px;
    cursor: pointer;
    font-weight: 500;
    color: #495057;
    transition: all 0.3s ease;
    position: relative;
}

.tab-button:hover {
    background: rgba(48, 79, 254, 0.05);
    color: #304FFE;
}

.tab-button.active {
    background: #304FFE;
    color: white;
}

.tab-button.active::after {
    content: '';
    position: absolute;
    bottom: -1px;
    left: 0;
    width: 100%;
    height: 3px;
    background: #304FFE;
}

.tab-content {
    padding: 30px;
    border-top: none;
}

/* Form Styles */
.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-weight: 500;
    color: #495057;
}

.form-control {
    width: 100%;
    padding: 12px;
    border: 1px solid #ced4da;
    border-radius: 8px;
    transition: all 0.3s ease;
    font-size: 15px;
}

.form-control:focus {
    border-color: #304FFE;
    box-shadow: 0 0 0 3px rgba(48, 79, 254, 0.1);
    outline: none;
}

/* Button Styles */
.btn-primary {
    background: #304FFE;
    color: white;
    border: none;
    padding: 12px 25px;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s ease;
    font-weight: 500;
    box-shadow: 0 4px 6px rgba(48, 79, 254, 0.1);
}

.btn-primary:hover {
    background: #1a237e;
    transform: translateY(-2px);
    box-shadow: 0 6px 10px rgba(48, 79, 254, 0.2);
}

.btn-danger {
    background: #dc3545;
    color: white;
    padding: 8px 15px;
    border-radius: 6px;
    box-shadow: 0 4px 6px rgba(220, 53, 69, 0.1);
    transition: all 0.3s ease;
}

.btn-danger:hover {
    background: #c82333;
    transform: translateY(-2px);
    box-shadow: 0 6px 10px rgba(220, 53, 69, 0.2);
}

.btn-success {
    background: #28a745;
    color: white;
    padding: 8px 15px;
    border-radius: 6px;
    box-shadow: 0 4px 6px rgba(40, 167, 69, 0.1);
    transition: all 0.3s ease;
}

.btn-success:hover {
    background: #218838;
    transform: translateY(-2px);
    box-shadow: 0 6px 10px rgba(40, 167, 69, 0.2);
}

.form-actions {
    display: flex;
    gap: 15px;
    margin-top: 25px;
}

/* Enhanced Grid View */
.recent-logins {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    margin-bottom: 30px;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
}

.recent-logins th {
    background: #304FFE;
    color: white;
    padding: 15px;
    text-align: left;
    font-weight: 500;
}

.recent-logins td {
    padding: 15px;
    border-bottom: 1px solid #e9ecef;
}

.recent-logins tr:last-child td {
    border-bottom: none;
}

.recent-logins tr:nth-child(even) {
    background-color: #f8f9fa;
}

.recent-logins tr:hover {
    background-color: #e9ecef;
}

.grid-actions {
    display: flex;
    gap: 8px;
}

/* Animation for table rows */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.recent-logins tr {
    animation: fadeIn 0.3s ease-in-out forwards;
    animation-delay: calc(0.05s * var(--row-index, 0));
    opacity: 0;
}

/* Section Header Styling */
.section-header {
    position: relative;
    margin-bottom: 25px;
    padding-bottom: 10px;
    font-size: 22px;
    color: #343a40;
}

.section-header::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 50px;
    height: 3px;
    background: #304FFE;
    border-radius: 5px;
}

/* Responsive Adjustments */
@media (max-width: 768px) {
    .main-content {
        padding: 15px;
        margin: 10px;
    }
    
    .stats-container {
        grid-template-columns: 1fr;
    }
    
    .header {
        flex-direction: column;
        gap: 15px;
        padding: 20px;
    }
    
    .tab-buttons {
        flex-direction: column;
    }
    
    .tab-button {
        border-radius: 0;
        margin-right: 0;
        margin-bottom: 5px;
    }
}

/* Add icon to each tab button */
.tab-button[id*="Users"]::before {
    content: "\f007"; /* Font Awesome user icon */
    font-family: "Font Awesome 6 Free";
    font-weight: 900;
    margin-right: 8px;
}

.tab-button[id*="Movies"]::before {
    content: "\f008"; /* Font Awesome film icon */
    font-family: "Font Awesome 6 Free";
    font-weight: 900;
    margin-right: 8px;
}

.tab-button[id*="Bookings"]::before {
    content: "\f02b"; /* Font Awesome tag icon */
    font-family: "Font Awesome 6 Free";
    font-weight: 900;
    margin-right: 8px;
}

/* Make Recent Logins section more attractive */
.recent-logins-section {
    background: white;
    border-radius: 15px;
    padding: 25px;
    margin-top: 40px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
}

.recent-logins-section h3 {
    position: relative;
    margin-top: 0;
    padding-bottom: 15px;
    margin-bottom: 20px;
    color: #343a40;
}

.recent-logins-section h3::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 50px;
    height: 3px;
    background: #304FFE;
    border-radius: 5px;
}
</style>
</head>
<body>
   <div class="main-content">
    <div class="header">
        <h2><i class="fas fa-film"></i> FilmFan Admin Panel</h2>
        <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn-logout" OnClick="btnLogout_Click" />
    </div>
    
    <div class="stats-container">
        <div class="stat-card">
            <i class="fas fa-ticket-alt fa-2x" style="color: #304FFE; margin-bottom: 15px;"></i>
            <h3>Total Bookings</h3>
            <asp:Label ID="lblTotalBookings" runat="server" Text="0"></asp:Label>
        </div>
        <div class="stat-card">
            <i class="fas fa-film fa-2x" style="color: #FF5722; margin-bottom: 15px;"></i>
            <h3>Active Movies</h3>
            <asp:Label ID="lblActiveMovies" runat="server" Text="0"></asp:Label>
        </div>
        <div class="stat-card">
            <i class="fas fa-rupee-sign fa-2x" style="color: #4CAF50; margin-bottom: 15px;"></i>
            <h3>Total Revenue</h3>
            <asp:Label ID="lblTotalRevenue" runat="server" Text="Rs0"></asp:Label>
        </div>
        <div class="stat-card">
            <i class="fas fa-users fa-2x" style="color: #9C27B0; margin-bottom: 15px;"></i>
            <h3>Registered Users</h3>
            <asp:Label ID="lblRegisteredUsers" runat="server" Text="0"></asp:Label>
        </div>
    </div>
    
    <div class="tab-container">
        <div class="tab-buttons">
            <asp:Button ID="btnUsersTab" runat="server" Text="Manage Users" CssClass="tab-button active" OnClick="btnUsersTab_Click" />
            <asp:Button ID="btnMoviesTab" runat="server" Text="Manage Movies" CssClass="tab-button" OnClick="btnMoviesTab_Click" />
            <asp:Button ID="btnBookingsTab" runat="server" Text="View Bookings" CssClass="tab-button" OnClick="btnBookingsTab_Click" />
        </div>
        
        <div class="tab-content">
            <!-- Users Tab -->
            <asp:Panel ID="pnlUsersTab" runat="server" CssClass="tab-panel active">
                <h3 class="section-header">User Management</h3>
                <asp:Panel ID="pnlUserForm" runat="server">
                    <div class="form-group">
                        <asp:Label ID="lblUserID" runat="server" AssociatedControlID="txtUserID">User ID</asp:Label>
                        <asp:TextBox ID="txtUserID" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblName" runat="server" AssociatedControlID="txtName">Name</asp:Label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter full name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is required" ControlToValidate="txtName" 
                            Display="Dynamic" ForeColor="Red" ValidationGroup="UserValidation"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail">Email</asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="example@email.com"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is required" ControlToValidate="txtEmail" 
                            Display="Dynamic" ForeColor="Red" ValidationGroup="UserValidation"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Invalid email format" 
                            ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            Display="Dynamic" ForeColor="Red" ValidationGroup="UserValidation"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword">Password</asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword" 
                            Display="Dynamic" ForeColor="Red" ValidationGroup="UserValidation"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-actions">
                        <asp:Button ID="btnSaveUser" runat="server" Text="Save User" CssClass="btn-primary" OnClick="btnSaveUser_Click" ValidationGroup="UserValidation" />
                        <asp:Button ID="btnCancelUser" runat="server" Text="Cancel" OnClick="btnCancelUser_Click" />
                    </div>
                </asp:Panel>
                
                <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID" 
                    OnRowCommand="gvUsers_RowCommand" CssClass="recent-logins" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="UserID" HeaderText="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="CreatedDate" HeaderText="Created Date" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <div class="grid-actions">
                                    <asp:LinkButton ID="lbEditUser" runat="server" CommandName="EditUser" CommandArgument='<%# Eval("UserID") %>'
                                        CssClass="btn-primary"><i class="fas fa-edit"></i> Edit</asp:LinkButton>
                                    <asp:LinkButton ID="lbDeleteUser" runat="server" CommandName="DeleteUser" CommandArgument='<%# Eval("UserID") %>'
                                        CssClass="btn-danger" OnClientClick="return confirm('Are you sure you want to delete this user?');"><i class="fas fa-trash-alt"></i> Delete</asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                <asp:Button ID="btnAddNewUser" runat="server" Text="Add New User" CssClass="btn-primary" OnClick="btnAddNewUser_Click" />
            </asp:Panel>
            
            <!-- Movies Tab -->
            <asp:Panel ID="pnlMoviesTab" runat="server" CssClass="tab-panel">
                <h3 class="section-header">Movie Management</h3>
                <asp:Panel ID="pnlMovieForm" runat="server">
                    <div class="form-group">
                        <asp:Label ID="lblMovieID" runat="server" AssociatedControlID="txtMovieID">Movie ID</asp:Label>
                        <asp:TextBox ID="txtMovieID" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblTitle" runat="server" AssociatedControlID="txtTitle">Title</asp:Label>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Enter movie title"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Title is required" ControlToValidate="txtTitle" 
                            Display="Dynamic" ForeColor="Red" ValidationGroup="MovieValidation"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblGenre" runat="server" AssociatedControlID="txtGenre">Genre</asp:Label>
                        <asp:TextBox ID="txtGenre" runat="server" CssClass="form-control" placeholder="E.g. Action, Comedy, Drama"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvGenre" runat="server" ErrorMessage="Genre is required" ControlToValidate="txtGenre" 
                            Display="Dynamic" ForeColor="Red" ValidationGroup="MovieValidation"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblDuration" runat="server" AssociatedControlID="txtDuration">Duration (minutes)</asp:Label>
                        <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control" TextMode="Number" placeholder="E.g. 120"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDuration" runat="server" ErrorMessage="Duration is required" ControlToValidate="txtDuration" 
                            Display="Dynamic" ForeColor="Red" ValidationGroup="MovieValidation"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvDuration" runat="server" ErrorMessage="Duration must be between 1 and 300 minutes" 
                            MinimumValue="1" MaximumValue="300" Type="Integer" ControlToValidate="txtDuration" 
                            Display="Dynamic" ForeColor="Red" ValidationGroup="MovieValidation"></asp:RangeValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblRating" runat="server" AssociatedControlID="txtRating">Rating</asp:Label>
                        <asp:TextBox ID="txtRating" runat="server" CssClass="form-control" placeholder="E.g. PG-13, R, U/A"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRating" runat="server" ErrorMessage="Rating is required" ControlToValidate="txtRating" 
                            Display="Dynamic" ForeColor="Red" ValidationGroup="MovieValidation"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblImageUrl" runat="server" AssociatedControlID="txtImageUrl">Image URL</asp:Label>
                        <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control" placeholder="Enter poster image URL"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblTrailerUrl" runat="server" AssociatedControlID="txtTrailerUrl">Trailer URL</asp:Label>
                        <asp:TextBox ID="txtTrailerUrl" runat="server" CssClass="form-control" placeholder="Enter YouTube or Vimeo URL"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:CheckBox ID="chkIsActive" runat="server" Text="Is Active" />
                    </div>
                    <div class="form-actions">
                        <asp:Button ID="btnSaveMovie" runat="server" Text="Save Movie" CssClass="btn-primary" OnClick="btnSaveMovie_Click" ValidationGroup="MovieValidation" />
                        <asp:Button ID="btnCancelMovie" runat="server" Text="Cancel" OnClick="btnCancelMovie_Click" />
                    </div>
                </asp:Panel>
                
                <asp:GridView ID="gvMovies" runat="server" AutoGenerateColumns="False" DataKeyNames="MovieID" 
                    OnRowCommand="gvMovies_RowCommand" CssClass="recent-logins" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="MovieID" HeaderText="ID" />
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="Genre" HeaderText="Genre" />
                        <asp:BoundField DataField="Duration" HeaderText="Duration" />
                        <asp:BoundField DataField="Rating" HeaderText="Rating" />
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <span class='<%# Convert.ToBoolean(Eval("IsActive")) ? "badge-active" : "badge-inactive" %>'>
                                    <%# Convert.ToBoolean(Eval("IsActive")) ? "Active" : "Inactive" %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <div class="grid-actions">
                                    <asp:LinkButton ID="lbEditMovie" runat="server" CommandName="EditMovie" CommandArgument='<%# Eval("MovieID") %>'
                                        CssClass="btn-primary"><i class="fas fa-edit"></i> Edit</asp:LinkButton>
                                    <asp:LinkButton ID="lbDeleteMovie" runat="server" CommandName="DeleteMovie" CommandArgument='<%# Eval("MovieID") %>'
                                        CssClass="btn-danger" OnClientClick="return confirm('Are you sure you want to delete this movie?');"><i class="fas fa-trash-alt"></i> Delete</asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                <asp:Button ID="btnAddNewMovie" runat="server" Text="Add New Movie" CssClass="btn-primary" OnClick="btnAddNewMovie_Click" />
            </asp:Panel>
            
            <!-- Bookings Tab -->
            <asp:Panel ID="pnlBookingsTab" runat="server" CssClass="tab-panel">
                <h3 class="section-header">Booking Management</h3>
                <div class="booking-filters">
                    <div class="search-box">
                        <i class="fas fa-search"></i>
                        <input type="text" id="bookingsSearch" placeholder="Search bookings..." class="form-control" />
                    </div>
                </div>
                <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="False" DataKeyNames="BookingID" 
                    CssClass="recent-logins" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="BookingID" HeaderText="ID" />
                        <asp:BoundField DataField="MovieTitle" HeaderText="Movie" />
                        <asp:BoundField DataField="UserName" HeaderText="User" />
                        <asp:BoundField DataField="BookingDate" HeaderText="Booking Date" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="ShowDate" HeaderText="Show Date" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="ShowTime" HeaderText="Show Time" />
                        <asp:BoundField DataField="TotalAmount" HeaderText="Amount" DataFormatString="₹{0:0.00}" />
                        <asp:BoundField DataField="SeatID" HeaderText="Seat" />
                    </Columns>
                </asp:GridView>
            </asp:Panel>
        </div>
    </div>
    
    <!-- Recent Login Information Section -->
    <div class="recent-logins-section">
        <h3><i class="fas fa-history"></i> Recent User Activities</h3>
        <asp:PlaceHolder ID="recentLoginsPlaceholder" runat="server"></asp:PlaceHolder>
    </div>
</div>

<script type="text/javascript">
    function setActiveTab(tabIndex) {
        // Get all tab buttons and panels
        var tabButtons = document.getElementsByClassName('tab-button');
        var tabPanels = document.getElementsByClassName('tab-panel');

        // Remove active class from all buttons and panels
        for (var i = 0; i < tabButtons.length; i++) {
            tabButtons[i].classList.remove('active');
            tabPanels[i].classList.remove('active');
        }

        // Add active class to selected button and panel
        tabButtons[tabIndex].classList.add('active');
        tabPanels[tabIndex].classList.add('active');
    }

    // Add animation to table rows
    document.addEventListener('DOMContentLoaded', function () {
        // Add animation to table rows
        const tables = document.querySelectorAll('.recent-logins');
        tables.forEach(table => {
            const rows = table.querySelectorAll('tbody tr');
            rows.forEach((row, index) => {
                row.style.setProperty('--row-index', index);
            });
        });

        // Initialize tab functionality
        const tabButtons = document.querySelectorAll('.tab-button');
        tabButtons.forEach((button, index) => {
            button.addEventListener('click', function () {
                setActiveTab(index);
            });
        });

        // Initialize search functionality for bookings
        const bookingsSearch = document.getElementById('bookingsSearch');
        if (bookingsSearch) {
            bookingsSearch.addEventListener('keyup', function () {
                const searchValue = this.value.toLowerCase();
                const bookingsTable = document.getElementById('gvBookings');
                if (bookingsTable) {
                    const rows = bookingsTable.querySelectorAll('tbody tr');
                    rows.forEach(row => {
                        let foundMatch = false;
                        const cells = row.querySelectorAll('td');
                        cells.forEach(cell => {
                            if (cell.textContent.toLowerCase().includes(searchValue)) {
                                foundMatch = true;
                            }
                        });
                        row.style.display = foundMatch ? '' : 'none';
                    });
                }
            });
        }

        // Add stat card animation on hover
        const statCards = document.querySelectorAll('.stat-card');
        statCards.forEach(card => {
            card.addEventListener('mouseenter', function () {
                this.style.transform = 'translateY(-5px)';
                this.style.boxShadow = '0 8px 20px rgba(0, 0, 0, 0.1)';
            });
            card.addEventListener('mouseleave', function () {
                this.style.transform = '';
                this.style.boxShadow = '0 5px 15px rgba(0, 0, 0, 0.05)';
            });
        });

        // Add confirmation for logout
        const logoutBtn = document.getElementById('btnLogout');
        if (logoutBtn) {
            logoutBtn.addEventListener('click', function (e) {
                if (!confirm('Are you sure you want to logout?')) {
                    e.preventDefault();
                }
            });
        }

        // Add responsive menu toggle for mobile
        const adjustForMobile = function () {
            if (window.innerWidth <= 768) {
                // Handle mobile-specific adjustments
                const tabContainer = document.querySelector('.tab-container');
                if (tabContainer) {
                    tabContainer.classList.add('mobile-view');
                }
            } else {
                const tabContainer = document.querySelector('.tab-container');
                if (tabContainer) {
                    tabContainer.classList.remove('mobile-view');
                }
            }
        };

        // Call on page load and window resize
        adjustForMobile();
        window.addEventListener('resize', adjustForMobile);
    });
</script>
</body>
</html>
   </asp:Content>