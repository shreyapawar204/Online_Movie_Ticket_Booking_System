<%@ Page Title="" Language="C#" MasterPageFile="~/Filmfan.Master" AutoEventWireup="true" CodeBehind="Contact Us.aspx.cs" Inherits="MajorProject.Contact_Us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Base styles */
        body {
            font-family: 'Poppins', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            color: #333;
            background-color: #f8f9fa;
        }

        /* Hero Section */
        .hero-section {
            background: linear-gradient(135deg, #3a1c71 0%, #d76d77 50%, #ffaf7b 100%);
            padding: 6rem 0;
            position: relative;
            color: white;
            text-align: center;
            overflow: hidden;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            max-width: 900px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1IiBoZWlnaHQ9IjUiPgo8cmVjdCB3aWR0aD0iNSIgaGVpZ2h0PSI1IiBmaWxsPSIjZmZmIiBmaWxsLW9wYWNpdHk9IjAuMSI+PC9yZWN0Pgo8L3N2Zz4=');
            opacity: 0.2;
        }

        .hero-title {
            font-size: 3.5rem;
            font-weight: 800;
            margin: 0 0 1rem;
            color: #fff;
            text-shadow: 0 2px 15px rgba(0,0,0,0.2);
            letter-spacing: -1px;
        }

        .hero-subtitle {
            font-size: 1.5rem;
            margin-bottom: 2rem;
            opacity: 0.9;
            font-weight: 300;
        }

        /* Shape divider */
        .shape-divider {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            overflow: hidden;
            line-height: 0;
        }

        .shape-divider svg {
            position: relative;
            display: block;
            width: calc(100% + 1.3px);
            height: 70px;
        }

        .shape-divider .shape-fill {
            fill: #FFFFFF;
        }

        /* Main container */
        .main-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            position: relative;
            z-index: 1;
        }

        /* Contact methods grid */
        .contact-methods {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin: -4rem auto 3rem;
        }

        .contact-card {
            background: white;
            border-radius: 16px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.08);
            padding: 2.5rem 2rem;
            text-align: center;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            z-index: 5;
        }

        .contact-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.12);
        }

        .contact-icon {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            display: inline-block;
            background: linear-gradient(135deg, #3a1c71 0%, #d76d77 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .contact-title {
            font-size: 1.8rem;
            margin: 0 0 1.2rem;
            color: #2d3748;
            font-weight: 700;
        }

        .contact-info {
            margin-bottom: 1rem;
        }

        .contact-highlight {
            font-size: 1.3rem;
            color: #3a1c71;
            font-weight: 600;
            margin: 0.5rem 0;
        }

        .contact-detail {
            color: #718096;
            margin: 0.3rem 0;
        }

        /* Form section */
        .form-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 50px rgba(0,0,0,0.05);
            padding: 3rem;
            margin-bottom: 4rem;
        }

        .form-title {
            font-size: 2.2rem;
            color: #2d3748;
            margin: 0 0 2rem;
            text-align: center;
            font-weight: 700;
            position: relative;
            padding-bottom: 1rem;
        }

        .form-title:after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(90deg, #3a1c71, #d76d77);
            border-radius: 4px;
        }

        .form-group {
            margin-bottom: 1.8rem;
        }

        .form-label {
            display: block;
            font-size: 1rem;
            font-weight: 600;
            color: #4a5568;
            margin-bottom: 0.8rem;
        }

        .form-control {
            width: 100%;
            padding: 1rem 1.2rem;
            font-size: 1rem;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            background-color: #f8fafc;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: #3a1c71;
            box-shadow: 0 0 0 3px rgba(58, 28, 113, 0.1);
            background-color: #fff;
        }

        .error-message {
            color: #e53e3e;
            font-size: 0.9rem;
            margin-top: 0.5rem;
        }

        .submit-button {
            display: block;
            width: 100%;
            padding: 1.2rem;
            background: linear-gradient(135deg, #3a1c71 0%, #d76d77 100%);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 1rem;
            box-shadow: 0 4px 15px rgba(215, 109, 119, 0.3);
        }

        .submit-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(215, 109, 119, 0.4);
        }

        /* Features section */
        .features-section {
            padding: 4rem 0;
            background-color: #f8f9fa;
        }

        .section-title {
            font-size: 2.2rem;
            text-align: center;
            margin-bottom: 3rem;
            color: #2d3748;
            font-weight: 700;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 2rem;
        }

        .feature-card {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.04);
            transition: all 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 40px rgba(0,0,0,0.08);
        }

        .feature-icon {
            font-size: 3rem;
            margin-bottom: 1.5rem;
            display: inline-block;
            background: linear-gradient(135deg, #3a1c71 0%, #d76d77 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .feature-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 1rem;
        }

        .feature-description {
            color: #718096;
            font-size: 1rem;
        }

        /* Office locations section */
        .offices-section {
            padding: 4rem 0;
            background-color: white;
        }

        .offices-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }
        
        .office-card {
            background: linear-gradient(135deg, #f6f9fc 0%, #f1f4f9 100%);
            border-radius: 16px;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.03);
            transition: all 0.3s ease;
            border-top: 4px solid transparent;
            border-image: linear-gradient(90deg, #3a1c71, #d76d77);
            border-image-slice: 1;
        }

        .office-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.06);
        }

        .office-title {
            font-size: 1.6rem;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 1rem;
        }

        .office-address {
            color: #718096;
            font-size: 1.1rem;
            line-height: 1.8;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem;
            }
            
            .hero-subtitle {
                font-size: 1.2rem;
            }
            
            .form-container {
                padding: 2rem;
            }
            
            .contact-methods {
                margin-top: -2rem;
            }
        }
    </style>

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="hero-content">
            <h1 class="hero-title">🎬 Get in Touch</h1>
            <p class="hero-subtitle">We're here to help make your movie experience extraordinary</p>
        </div>
        <div class="shape-divider">
            <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
                <path d="M985.66,92.83C906.67,72,823.78,31,743.84,14.19c-82.26-17.34-168.06-16.33-250.45.39-57.84,11.73-114,31.07-172,41.86A600.21,600.21,0,0,1,0,27.35V120H1200V95.8C1132.19,118.92,1055.71,111.31,985.66,92.83Z" class="shape-fill"></path>
            </svg>
        </div>
    </div>

    <div class="main-container">
        <!-- Contact Methods -->
        <div class="contact-methods">
            <div class="contact-card">
                <div class="contact-icon">📞</div>
                <h3 class="contact-title">Phone Support</h3>
                <div class="contact-info">
                    <p class="contact-detail">Call us anytime:</p>
                    <p class="contact-highlight">1-800-FILMFAN</p>
                    <p class="contact-detail">(1-800-345-6326)</p>
                </div>
                <p class="contact-detail">Available 24/7 for urgent assistance</p>
            </div>
            
            <div class="contact-card">
                <div class="contact-icon">📧</div>
                <h3 class="contact-title">Email Support</h3>
                <div class="contact-info">
                    <p class="contact-detail">General Inquiries:</p>
                    <p class="contact-highlight">support@filmfan.com</p>
                </div>
                <div class="contact-info">
                    <p class="contact-detail">Business Partnerships:</p>
                    <p class="contact-highlight">partners@filmfan.com</p>
                </div>
            </div>

            <div class="contact-card">
                <div class="contact-icon">📱</div>
                <h3 class="contact-title">Mobile Support</h3>
                <p class="contact-detail">Download our app for instant assistance</p>
                <div style="display: flex; gap: 10px; margin-top: 1.5rem;">
                    <button class="submit-button" style="margin: 0;">App Store</button>
                    <button class="submit-button" style="margin: 0; background: #333;">Google Play</button>
                </div>
            </div>
        </div>

        <!-- Contact Form -->
        <div class="form-container">
            <h2 class="form-title">Send Us a Message</h2>
            
            <div class="form-group">
                <label class="form-label" for="txtName">Full Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                    ControlToValidate="txtName" 
                    ErrorMessage="Name is required" 
                    CssClass="error-message"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <label class="form-label" for="txtEmail">Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                    ControlToValidate="txtEmail" 
                    ErrorMessage="Email is required" 
                    CssClass="error-message"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label class="form-label" for="ddlSubject">Subject</label>
                <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select a subject" Value="" />
                    <asp:ListItem Text="Booking Issue" Value="booking" />
                    <asp:ListItem Text="Payment Problem" Value="payment" />
                    <asp:ListItem Text="Refund Request" Value="refund" />
                    <asp:ListItem Text="Technical Support" Value="technical" />
                    <asp:ListItem Text="General Feedback" Value="feedback" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvSubject" runat="server" 
                    ControlToValidate="ddlSubject" 
                    ErrorMessage="Subject is required" 
                    CssClass="error-message"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <label class="form-label" for="txtMessage">Your Message</label>
                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" 
                    CssClass="form-control" placeholder="How can we help you today?">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMessage" runat="server" 
                    ControlToValidate="txtMessage" 
                    ErrorMessage="Message is required" 
                    CssClass="error-message"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:Button ID="Button3" runat="server" Text="Send Message" 
                    OnClick="Button3_Click" CssClass="submit-button" />
            </div>
        </div>

        <!-- Features Section -->
        <section class="features-section">
            <h2 class="section-title">Why Choose FilmFan</h2>
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">🎫</div>
                    <h3 class="feature-title">Instant Booking</h3>
                    <p class="feature-description">Book movie tickets in seconds with our streamlined process</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">🍿</div>
                    <h3 class="feature-title">Snack Pre-order</h3>
                    <p class="feature-description">Skip the concession line and order your snacks in advance</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">⭐</div>
                    <h3 class="feature-title">Loyalty Rewards</h3>
                    <p class="feature-description">Earn points with every booking and redeem for free tickets</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">📱</div>
                    <h3 class="feature-title">Mobile Tickets</h3>
                    <p class="feature-description">Use your phone for quick, paperless entry to all movies</p>
                </div>
            </div>
        </section>

        <!-- Office Locations -->
        <section class="offices-section">
            <h2 class="section-title">Our Locations</h2>
            <div class="offices-grid">
                <div class="office-card">
                    <h3 class="office-title">New York</h3>
                    <p class="office-address">
                        123 Broadway<br>
                        New York, NY 10013<br>
                        United States
                    </p>
                </div>
                <div class="office-card">
                    <h3 class="office-title">Los Angeles</h3>
                    <p class="office-address">
                        456 Hollywood Blvd<br>
                        Los Angeles, CA 90028<br>
                        United States
                    </p>
                </div>
                <div class="office-card">
                    <h3 class="office-title">Chicago</h3>
                    <p class="office-address">
                        789 Michigan Ave<br>
                        Chicago, IL 60601<br>
                        United States
                    </p>
                </div>
            </div>
        </section>
    </div>

    <script type="text/javascript">
        // Optional: Add smooth scrolling or other interactive features
        // This is just a placeholder in case you want to add JavaScript later
    </script>
</asp:Content>