<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrationpage.aspx.cs" Inherits="MajorProject.Registrationpage" %>

<!DOCTYPE html>

<html>
<head>
    <title>Sign Up</title>
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

        .signup-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            width: 380px;
            transition: all 0.3s ease;
        }
        
        .signup-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(98, 0, 234, 0.25);
        }

        .signup-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 25px;
            align-items: center;
            border-bottom: 2px solid #f0f0f0;
            padding-bottom: 15px;
        }

        .signup-header h2 {
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
        }
        
        .close-btn:hover {
            color: #6200ea;
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

        .signup-btn {
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
        
        .signup-btn:hover {
            background: #5000d0;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(98, 0, 234, 0.3);
        }

        .terms {
            display: flex;
            align-items: center;
            margin: 15px 0;
            color: #555;
            font-size: 14px;
        }

        .terms input {
            width: auto;
            margin-right: 10px;
            cursor: pointer;
        }
        
        .terms label {
            cursor: pointer;
        }

        .login-link {
            text-align: center;
            margin-top: 25px;
            font-size: 15px;
            color: #555;
        }

        .login-link a {
            color: #6200ea;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .login-link a:hover {
            text-decoration: underline;
        }
        
        .validator {
            font-family: 'Segoe UI', Arial;
            font-style: italic;
            font-size: 12px;
            display: block;
            margin-top: 5px;
        }
        
        @media (max-width: 480px) {
            .signup-container {
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
    <form id="form1" runat="server">
    <div class="signup-container">
        <div class="signup-header">
            <h2>Create Account</h2>
            <span class="close-btn" onclick="redirectToHome()">&times;</span>
        </div>
        
        <div class="input-group">
            <i class="fas fa-user"></i>
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" CssClass="validator" 
                ErrorMessage="* Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        
        <div class="input-group">
            <i class="fas fa-envelope"></i>
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Email Address"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox2" CssClass="validator" 
                ErrorMessage="* Email is required" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="TextBox2" CssClass="validator" 
                ErrorMessage="* Please enter a valid email" ForeColor="Red" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>
        
        <div class="input-group">
            <i class="fas fa-lock"></i>
            <asp:TextBox ID="TextBox3" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBox3" CssClass="validator" 
                ErrorMessage="* Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        
        <div class="input-group">
            <i class="fas fa-check-circle"></i>
            <asp:TextBox ID="TextBox4" runat="server" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="TextBox4" CssClass="validator" 
                ErrorMessage="* Please confirm your password" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="TextBox3" ControlToValidate="TextBox4" CssClass="validator" 
                ErrorMessage="* Passwords do not match" ForeColor="Red"></asp:CompareValidator>
        </div>

        <div class="terms">
            <input type="checkbox" id="terms">
            <label for="terms">I agree to the Terms of Service and Privacy Policy</label>
        </div>
        
        <asp:Button ID="Button1" runat="server" Text="Create Account" CssClass="signup-btn" OnClick="Button1_Click1" />
        
        <div class="login-link">
            Already have an account? <a href="LoginForm.aspx">Log in</a>
        </div>
    </div>
    </form>
</body>
</html>