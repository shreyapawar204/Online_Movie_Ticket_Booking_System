<%@ Page Title="" Language="C#" MasterPageFile="~/Filmfan.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="MajorProject.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us - Filmfan</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Poppins', sans-serif;
                line-height: 1.8;
                background: #f8f9fa;
                color: #333;
                overflow-x: hidden;
            }

            /* Hero Section with Animated Gradient */
            .hero {
                background: linear-gradient(-45deg, rgba(29, 53, 87, 0.9), rgba(69, 123, 157, 0.9), rgba(168, 218, 220, 0.8), rgba(241, 250, 238, 0.8));
                background-size: 400% 400%;
                color: white;
                padding: 150px 20px;
                text-align: center;
                position: relative;
                animation: gradientBG 15s ease infinite;
                overflow: hidden;
            }

            @keyframes gradientBG {
                0% { background-position: 0% 50%; }
                50% { background-position: 100% 50%; }
                100% { background-position: 0% 50%; }
            }

            .hero::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: url('/api/placeholder/1920/600') center/cover no-repeat;
                opacity: 0.15;
                z-index: -1;
            }

            .hero h1 {
                font-size: 4.5rem;
                margin-bottom: 20px;
                font-weight: 800;
                text-transform: uppercase;
                letter-spacing: 2px;
                text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
                animation: fadeInDown 1s ease-out;
            }

            @keyframes fadeInDown {
                from {
                    opacity: 0;
                    transform: translateY(-30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .hero p {
                font-size: 1.4rem;
                max-width: 800px;
                margin: 0 auto;
                animation: fadeIn 1.5s ease-out;
            }

            @keyframes fadeIn {
                from { opacity: 0; }
                to { opacity: 1; }
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 40px 20px;
            }

            /* Mission Section with Card Effect */
            .mission-section {
                background: white;
                padding: 80px 20px;
                text-align: center;
                margin: -50px auto 60px;
                width: 90%;
                max-width: 1100px;
                border-radius: 15px;
                box-shadow: 0 15px 30px rgba(0,0,0,0.1);
                position: relative;
                z-index: 10;
            }

            .mission-section h2 {
                color: #1d3557;
                font-size: 2.8rem;
                margin-bottom: 30px;
                position: relative;
                display: inline-block;
            }

            .mission-section h2::after {
                content: '';
                position: absolute;
                bottom: -10px;
                left: 50%;
                transform: translateX(-50%);
                width: 80px;
                height: 4px;
                background: #e63946;
                border-radius: 2px;
            }

            .mission-section p {
                font-size: 1.2rem;
                max-width: 800px;
                margin: 0 auto;
                color: #555;
            }

            /* Features with Hover Effects */
            .features {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                gap: 30px;
                margin-top: 50px;
            }

            .feature-card {
                background: white;
                padding: 40px 30px;
                border-radius: 12px;
                text-align: center;
                box-shadow: 0 10px 20px rgba(0,0,0,0.05);
                transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                border-bottom: 5px solid transparent;
            }

            .feature-card:hover {
                transform: translateY(-15px);
                box-shadow: 0 20px 30px rgba(0,0,0,0.1);
                border-bottom: 5px solid #e63946;
            }

            .feature-card img {
                width: 100px;
                height: 100px;
                margin-bottom: 25px;
                transition: transform 0.5s ease;
            }

            .feature-card:hover img {
                transform: scale(1.1) rotate(5deg);
            }

            .feature-card h3 {
                color: #1d3557;
                font-size: 1.6rem;
                margin-bottom: 15px;
                position: relative;
            }

            .feature-card p {
                color: #555;
                font-size: 1.1rem;
                line-height: 1.6;
            }

            /* Team Section with Modern Cards */
            .team-section {
                padding: 80px 0;
                text-align: center;
                background: #f9f9f9;
                position: relative;
                overflow: hidden;
            }

            .team-section::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: linear-gradient(135deg, rgba(230, 57, 70, 0.05) 0%, rgba(29, 53, 87, 0.05) 100%);
                z-index: 0;
            }

            .team-section h2 {
                color: #1d3557;
                font-size: 2.8rem;
                margin-bottom: 50px;
                position: relative;
                display: inline-block;
                z-index: 1;
            }

            .team-section h2::after {
                content: '';
                position: absolute;
                bottom: -10px;
                left: 50%;
                transform: translateX(-50%);
                width: 80px;
                height: 4px;
                background: #e63946;
                border-radius: 2px;
            }

            .team-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                gap: 40px;
                position: relative;
                z-index: 1;
            }

            .team-member {
                background: white;
                padding: 30px 20px;
                border-radius: 15px;
                box-shadow: 0 10px 25px rgba(0,0,0,0.08);
                transition: all 0.3s ease;
                position: relative;
                overflow: hidden;
            }

            .team-member::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: linear-gradient(to bottom, transparent 50%, rgba(230, 57, 70, 0.05) 100%);
                z-index: 0;
                transition: opacity 0.3s ease;
                opacity: 0;
            }

            .team-member:hover {
                transform: translateY(-10px);
            }

            .team-member:hover::before {
                opacity: 1;
            }

            .team-member img {
                width: 180px;
                height: 180px;
                border-radius: 50%;
                margin-bottom: 20px;
                border: 5px solid #f1faee;
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
                transition: all 0.3s ease;
                position: relative;
            }

            .team-member:hover img {
                transform: scale(1.05);
                border-color: #e63946;
            }

            .team-member h3 {
                color: #1d3557;
                font-size: 1.6rem;
                margin-bottom: 5px;
                position: relative;
            }

            .team-member p {
                color: #e63946;
                font-weight: 600;
                margin-bottom: 15px;
            }

            .social-links {
                display: flex;
                justify-content: center;
                gap: 15px;
                margin-top: 15px;
            }

            .social-links a {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                width: 40px;
                height: 40px;
                background: #f1faee;
                border-radius: 50%;
                color: #1d3557;
                transition: all 0.3s ease;
                font-size: 18px;
                text-decoration: none;
            }

            .social-links a:hover {
                background: #e63946;
                color: white;
                transform: translateY(-3px);
            }

            /* CTA Section with Gradient */
            .cta-section {
                text-align: center;
                padding: 100px 20px;
                background: linear-gradient(135deg, #1d3557 0%, #457b9d 100%);
                color: white;
                position: relative;
                overflow: hidden;
            }

            .cta-section::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: url('/api/placeholder/1920/600') center/cover no-repeat;
                opacity: 0.1;
                z-index: 0;
            }

            .cta-section h2 {
                font-size: 2.5rem;
                margin-bottom: 20px;
                position: relative;
                z-index: 1;
            }

            .cta-section p {
                font-size: 1.2rem;
                max-width: 700px;
                margin: 0 auto 30px;
                position: relative;
                z-index: 1;
            }

            .cta-button {
                display: inline-block;
                padding: 16px 40px;
                background: #e63946;
                color: white;
                text-decoration: none;
                border-radius: 50px;
                font-weight: 700;
                font-size: 1.1rem;
                letter-spacing: 1px;
                text-transform: uppercase;
                transition: all 0.3s ease;
                position: relative;
                overflow: hidden;
                z-index: 1;
                box-shadow: 0 8px 20px rgba(230, 57, 70, 0.4);
            }

            .cta-button::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
                transition: all 0.6s ease;
                z-index: -1;
            }

            .cta-button:hover {
                background: #c1121f;
                transform: translateY(-5px);
                box-shadow: 0 12px 25px rgba(193, 18, 31, 0.5);
            }

            .cta-button:hover::before {
                left: 100%;
            }

            /* Stats Section with Counter Animation */
            .stats-section {
                background: #1d3557;
                color: white;
                padding: 80px 0;
                margin: 60px 0;
                position: relative;
                overflow: hidden;
            }

            .stats-section::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: linear-gradient(45deg, rgba(230, 57, 70, 0.1) 0%, rgba(69, 123, 157, 0.1) 100%);
            }

            .stats-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 40px;
                text-align: center;
                position: relative;
                z-index: 1;
            }

            .stat-item {
                padding: 20px;
                border-radius: 10px;
                background: rgba(255,255,255,0.05);
                box-shadow: 0 8px 20px rgba(0,0,0,0.1);
                transition: all 0.3s ease;
            }

            .stat-item:hover {
                transform: translateY(-5px);
                background: rgba(255,255,255,0.1);
            }

            .stat-item h3 {
                font-size: 3rem;
                margin-bottom: 10px;
                color: #a8dadc;
                font-weight: 800;
            }

            .stat-item p {
                font-size: 1.1rem;
                color: #f1faee;
            }

            /* Responsive Adjustments */
            @media (max-width: 768px) {
                .hero h1 {
                    font-size: 3rem;
                }
                
                .mission-section {
                    width: 95%;
                    padding: 60px 15px;
                    margin-top: -30px;
                }
                
                .feature-card, .team-member {
                    padding: 30px 20px;
                }
                
                .stat-item h3 {
                    font-size: 2.5rem;
                }
            }
        </style>
    </head>
    <body>
        <section class="hero">
            <h1>Welcome to Filmfan</h1>
            <p>Your premier destination for hassle-free movie ticket booking</p>
        </section>

        <section class="mission-section">
            <div class="container">
                <h2>Our Mission</h2>
                <p>At Filmfan, we're passionate about creating the perfect movie-going experience. We believe that booking movie tickets should be as enjoyable as watching the film itself. Our platform combines cutting-edge technology with user-friendly design to make your booking experience seamless and convenient.</p>
            </div>
        </section>

        <div class="container">
            <div class="features">
                <div class="feature-card">
                    <img src="NewFolder1/EasyBooking.jpg" alt="Easy Booking">
                    <h3>Easy Booking</h3>
                    <p>Book your tickets in just a few clicks with our intuitive interface. Save your preferences and get personalized recommendations based on your viewing history.</p>
                </div>
                <div class="feature-card">
                    <img src="NewFolder1/SecurePayment.jpg" alt="Secure Payments">
                    <h3>Secure Payments</h3>
                    <p>Multiple secure payment options for safe and convenient transactions. Your financial data is protected with industry-leading encryption technology.</p>
                </div>
                <div class="feature-card">
                    <img src="NewFolder1/BestSeats.jpg" alt="Best Seats">
                    <h3>Best Seats</h3>
                    <p>Interactive seat selection with real-time availability updates. Get the perfect view with our detailed theater layouts and seat preview technology.</p>
                </div>
            </div>
        </div>

        <section class="stats-section">
            <div class="container">
                <div class="stats-grid">
                    <div class="stat-item">
                        <h3>5M+</h3>
                        <p>Happy Customers</p>
                    </div>
                    <div class="stat-item">
                        <h3>500+</h3>
                        <p>Partner Theaters</p>
                    </div>
                    <div class="stat-item">
                        <h3>1000+</h3>
                        <p>Movies Available</p>
                    </div>
                    <div class="stat-item">
                        <h3>98%</h3>
                        <p>Customer Satisfaction</p>
                    </div>
                </div>
            </div>
        </section>

        <section class="team-section">
            <div class="container">
                <h2>Meet Our Team</h2>
                <div class="team-grid">
                    <div class="team-member">
                        <img src="/api/placeholder/150/150" alt="John Doe">
                        <h3>John Doe</h3>
                        <p>Founder & CEO</p>
                        <p class="bio">With 15+ years in the entertainment industry, John brings vision and innovation to Filmfan.</p>
                        <div class="social-links">
                            <a href="#" aria-label="LinkedIn">in</a>
                            <a href="#" aria-label="Twitter">t</a>
                        </div>
                    </div>
                    <div class="team-member">
                        <img src="/api/placeholder/150/150" alt="Jane Smith">
                        <h3>Jane Smith</h3>
                        <p>Head of Operations</p>
                        <p class="bio">Jane ensures all systems run smoothly, maintaining our high standard of customer service.</p>
                        <div class="social-links">
                            <a href="#" aria-label="LinkedIn">in</a>
                            <a href="#" aria-label="Twitter">t</a>
                        </div>
                    </div>
                    <div class="team-member">
                        <img src="/api/placeholder/150/150" alt="Mike Johnson">
                        <h3>Mike Johnson</h3>
                        <p>Technical Director</p>
                        <p class="bio">Mike leads our tech team, developing cutting-edge solutions for the best user experience.</p>
                        <div class="social-links">
                            <a href="#" aria-label="LinkedIn">in</a>
                            <a href="#" aria-label="Twitter">t</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="cta-section">
            <div class="container">
                <h2>Ready to Experience the Best Movie Booking Service?</h2>
                <p>Join millions of happy customers who book their movie tickets with Filmfan. Get access to exclusive offers, early bookings, and special screenings.</p>
                <br>
                <a href="Default.aspx" class="cta-button">Book Your Tickets Now</a>
            </div>
        </section>
    </body>
    </html>
</asp:Content>