<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="MajorProject.ProfilePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile Page</title>
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            margin: 0;
            padding: 20px;
            font-family: 'Segoe UI', sans-serif;
        }

        .navbar {
            background: rgba(255, 255, 255, 0.95);
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-radius: 15px;
            margin-bottom: 30px;
        }

        .profile-container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.1);
        }

        .welcome-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .welcome-header h1 {
            color: #2d3748;
            font-size: 2.5em;
            margin-bottom: 10px;
        }

        .profile-info {
            background: #f7fafc;
            padding: 20px;
            border-radius: 15px;
            margin-bottom: 30px;
        }

        .info-item {
            margin: 15px 0;
            padding: 10px;
            border-bottom: 1px solid #e2e8f0;
        }

        .info-label {
            color: #4a5568;
            font-weight: bold;
        }

        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.3s;
        }

        .edit-btn {
            background: #4c51bf;
            color: white;
        }

        .logout-btn {
            background: #f56565;
            color: white;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <div class="logo">
                <i class="fas fa-user-circle"></i> My Profile
            </div>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn logout-btn" OnClick="btnLogout_Click" />
        </div>

        <div class="profile-container">
            <div class="welcome-header">
                <h1>Welcome, <asp:Label ID="lblUserName" runat="server"></asp:Label>!</h1>
                <p>Here's your profile information</p>
            </div>

            <div class="profile-info">
                <div class="info-item">
                    <span class="info-label">Name:</span>
                    <asp:Label ID="lblName" runat="server"></asp:Label>
                </div>
                <div class="info-item">
                    <span class="info-label">Email:</span>
                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                </div>
            </div>

            <div style="text-align: center;">
                <asp:Button ID="btnEdit" runat="server" Text="Edit Profile" CssClass="btn edit-btn" OnClick="btnEdit_Click" />
            </div>
        </div>
    </form>
</body>
</html>
