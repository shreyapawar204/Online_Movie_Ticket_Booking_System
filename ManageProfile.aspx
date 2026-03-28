<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageProfile.aspx.cs" Inherits="MajorProject.ManageProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Profile</title>
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .navbar {
            background: rgba(255, 255, 255, 0.95);
            padding: 20px 30px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-radius: 15px;
            margin-bottom: 30px;
            backdrop-filter: blur(10px);
        }

        .nav-left {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #4a5568;
        }

        .welcome-text {
            font-size: 18px;
            color: #2d3748;
            padding-left: 20px;
            border-left: 2px solid #e2e8f0;
        }

        .welcome-name {
            color: #4c51bf;
            font-weight: 600;
        }

        .logout-btn {
            background-color: #f56565 !important;
            color: white !important;
            border: none !important;
            padding: 10px 25px !important;
            border-radius: 8px !important;
            cursor: pointer !important;
            font-size: 16px !important;
            transition: all 0.3s ease !important;
            display: flex !important;
            align-items: center !important;
            gap: 8px !important;
        }

        .logout-btn:hover {
            background-color: #e53e3e !important;
            transform: translateY(-2px) !important;
            box-shadow: 0 4px 12px rgba(245, 101, 101, 0.2) !important;
        }

        .profile-container {
            max-width: 800px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.1);
            backdrop-filter: blur(10px);
        }

        h2 {
            color: #2d3748;
            margin-bottom: 40px;
            text-align: center;
            font-size: 32px;
            font-weight: 700;
            position: relative;
        }

        h2:after {
            content: '';
            display: block;
            width: 60px;
            height: 4px;
            background: linear-gradient(to right, #667eea, #764ba2);
            margin: 15px auto 0;
            border-radius: 2px;
        }

        .form-group {
            margin-bottom: 30px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 10px;
            color: #4a5568;
            font-weight: 500;
            font-size: 16px;
        }

        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 15px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 16px;
            transition: all 0.3s ease;
            background: white;
        }

        .form-group input:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102,126,234,0.1);
            outline: none;
        }

        .profile-info {
            font-size: 16px;
            color: #4a5568;
            padding: 15px;
            background: #f7fafc;
            border-radius: 12px;
            display: block;
            border: 2px solid #e2e8f0;
        }

        .btn-group {
            display: flex;
            gap: 20px;
            margin-top: 40px;
        }

        .btn {
            flex: 1;
            padding: 15px 30px;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .update-btn {
            background: linear-gradient(to right, #667eea, #764ba2);
            color: white;
        }

        .back-btn {
            background: #cbd5e0;
            color: #4a5568;
        }

        .error-message {
            color: #e53e3e;
            margin-top: 8px;
            font-size: 14px;
            padding: 10px;
            background: #fff5f5;
            border-radius: 8px;
            border-left: 4px solid #e53e3e;
        }

        .success-message {
            color: #2f855a;
            margin-top: 8px;
            font-size: 14px;
            padding: 10px;
            background: #f0fff4;
            border-radius: 8px;
            border-left: 4px solid #48bb78;
            text-align: center;
        }

        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }
            
            .nav-left {
                flex-direction: column;
                gap: 10px;
            }
            
            .welcome-text {
                padding: 10px 0;
                border-left: none;
                border-top: 2px solid #e2e8f0;
            }
            
            .btn-group {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div class="navbar">
            <div class="nav-left">
                <div class="logo">
                    <i class="fas fa-user-circle"></i> My Profile
                </div>
                <div class="welcome-text">
                    Welcome, <span class="welcome-name"><asp:Label ID="lblWelcomeName" runat="server"></asp:Label></span>
                </div>
            </div>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="logout-btn" OnClick="btnLogout_Click" />
        </div>

        <div class="profile-container">
            <h2>Manage Your Profile</h2>
            
            <div class="form-group">
                <label><i class="fas fa-envelope"></i> Email:</label>
                <asp:Label ID="lblEmail" runat="server" CssClass="profile-info"></asp:Label>
            </div>

            <div class="form-group">
                <label><i class="fas fa-user"></i> Name:</label>
                <asp:TextBox ID="txtName" runat="server" placeholder="Enter your name"></asp:TextBox>
            </div>

            <div class="form-group">
                <label><i class="fas fa-lock"></i> New Password:</label>
                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" placeholder="Enter new password"></asp:TextBox>
            </div>

            <div class="form-group">
                <label><i class="fas fa-lock"></i> Confirm New Password:</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm new password"></asp:TextBox>
            </div>

            <div class="form-group">
                <label><i class="fas fa-shield-alt"></i> Current Password:</label>
                <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password" placeholder="Enter current password"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblMessage" runat="server" CssClass="success-message"></asp:Label>
            </div>

            <div class="btn-group">
                <asp:Button ID="btnUpdateProfile" runat="server" 
                    Text="Update Profile" OnClick="btnUpdateProfile_Click" 
                    CssClass="btn update-btn" />
                <asp:Button ID="btnBack" runat="server" 
                    Text="Back to Profile" OnClick="btnBack_Click" 
                    CssClass="btn back-btn" CausesValidation="false" />
            </div>
        </div>
       
    </form>
</body>
</html>
