<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLoginPage.aspx.cs" Inherits="MajorProject.AdminLoginPage" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FilmFan Admin Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('NewFolder1/th3.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            width: 380px;
            transition: all 0.3s ease;
        }
        
        .login-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(98, 0, 234, 0.25);
        }

        .login-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 25px;
            align-items: center;
            border-bottom: 2px solid #f0f0f0;
            padding-bottom: 15px;
        }

        .login-header h2 {
            margin: 0;
            color: #333;
            font-size: 26px;
            font-weight: 600;
        }

        .close-btn {
            color: #999;
            cursor: pointer;
            font-size: 24px;
            transition: color 0.3s;
            position: absolute;
            top: 20px;
            right: 20px;
        }
        
        .close-btn:hover {
            color: #6200ea;
        }

        .logo {
            text-align: center;
            margin-bottom: 25px;
        }

        .logo h1 {
            color: #6200ea;
            font-size: 32px;
            margin: 0;
        }

        .logo p {
            color: #555;
            font-size: 16px;
            margin-top: 5px;
            font-weight: 500;
        }

        .input-group {
            position: relative;
            margin-bottom: 20px;
        }
        
        .input-group i {
            position: absolute;
            left: 15px;
            top: 22px;
            color: #6200ea;
        }

        input {
            width: 100%;
            padding: 15px 15px 15px 45px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
            transition: all 0.3s;
        }
        
        input:focus {
            border-color: #6200ea;
            box-shadow: 0 0 0 3px rgba(98, 0, 234, 0.15);
            outline: none;
        }

        .login-btn {
            width: 100%;
            padding: 15px;
            background: #6200ea;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 10px;
            font-size: 16px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s;
        }
        
        .login-btn:hover {
            background: #5000d0;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(98, 0, 234, 0.3);
        }

        .error-message {
            color: #d32f2f;
            margin-top: 15px;
            text-align: center;
            font-size: 14px;
            display: block;
        }
        
        @media (max-width: 480px) {
            .login-container {
                width: 90%;
                padding: 30px 20px;
            }
        }
    </style>
    <script type="text/javascript">
        function redirectToHome() {
            window.location.href = 'Home.aspx';
        }
    </script>
</head>
<body>
    <form id="formAdminLogin" runat="server">
        <div class="login-container">
            <span class="close-btn" onclick="redirectToHome()">&times;</span>
            
            <div class="logo">
                <h1>🎬 FilmFan</h1>
                <p>Admin Portal</p>
            </div>
            
            <div class="input-group">
                <i class="fas fa-user"></i>
                <asp:TextBox ID="txtUsername" runat="server" placeholder="Username"></asp:TextBox>
            </div>
            
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
            </div>
            
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="login-btn" OnClick="btnLogin_Click" />
            
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label>
        </div>
    </form>
</body>
</html>