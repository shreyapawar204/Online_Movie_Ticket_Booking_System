<%@ Page Title="" Language="C#" MasterPageFile="~/Filmfan.Master" AutoEventWireup="true" CodeBehind="UpcomingMovies.aspx.cs" Inherits="MajorProject.UpcomingMovies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header class="header">
        <h1>Upcoming Movies</h1>
        <p>Get ready for these exciting releases</p>
    </header>

    <main class="upcoming-movies">
        <h2 class="section-title">Coming Soon</h2>
        
        <div class="movie-grid">
            <asp:Repeater ID="rptUpcomingMovies" runat="server">
                <ItemTemplate>
                    <div class="movie-card">
                        <div class="poster-container">
                            <img src="<%# Eval("ImageUrl") %>" alt="<%# Eval("Title") %>" class="movie-image" onerror="this.src='/Images/placeholder.jpg'; this.onerror=null;" />
                            <div class="poster-overlay">
                                <asp:HyperLink ID="lnkTrailer" runat="server" NavigateUrl='<%# Eval("TrailerUrl") %>' CssClass="trailer-btn-overlay" Target="_blank">
                                    <i class="fa fa-play"></i> Watch Trailer
                                </asp:HyperLink>
                            </div>
                        </div>
                        <div class="movie-content">
                            <h3 class="movie-title"><%# Eval("Title") %></h3>
                            <p class="movie-description"><%# Eval("Description") %></p>
                            <div class="movie-footer">
                                <span class="release-date">Release Date: <%# Eval("ReleaseDate", "{0:MMM d, yyyy}") %></span>
                                <asp:HyperLink ID="lnkTrailerBtn" runat="server" NavigateUrl='<%# Eval("TrailerUrl") %>' CssClass="trailer-btn" Target="_blank">View Trailer</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        
        <asp:Label ID="lblNoMovies" runat="server" Text="No upcoming movies available at this time." 
            Visible="false" CssClass="no-movies"></asp:Label>

        <asp:HyperLink ID="BackToMovies" runat="server" NavigateUrl="~/Default.aspx" CssClass="back-btn">Back to Current Movies</asp:HyperLink>
    </main>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap');
        @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Montserrat', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #0f172a;
            color: #fff;
        }

        .header {
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)),
                        url('/Images/upcoming-banner.jpg');
            background-size: cover;
            background-position: center;
            padding: 3rem 2rem;
            text-align: center;
            height: 350px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .header h1 {
            font-size: 3.5rem;
            margin-bottom: 1rem;
            color: #fff;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
            font-weight: 700;
            letter-spacing: 1px;
        }

        .header p {
            font-size: 1.2rem;
            color: #e2e8f0;
        }

        .upcoming-movies {
            padding: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .section-title {
            font-size: 2.2rem;
            margin-bottom: 2.5rem;
            color: #fff;
            text-align: center;
            position: relative;
            font-weight: 600;
        }

        .section-title:after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: linear-gradient(to right, #3b82f6, #4f46e5);
        }

        .movie-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 2.5rem;
            margin-bottom: 3rem;
        }

        .movie-card {
            background: #1e293b;
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .movie-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
        }

        .poster-container {
            position: relative;
            overflow: hidden;
        }

        .movie-image {
            width: 100%;
            height: 400px;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .movie-card:hover .movie-image {
            transform: scale(1.05);
        }

        .poster-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            display: flex;
            justify-content: center;
            align-items: center;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .movie-card:hover .poster-overlay {
            opacity: 1;
        }

        .trailer-btn-overlay {
            display: inline-block;
            background: #e11d48;
            color: white;
            padding: 0.8rem 1.5rem;
            border-radius: 30px;
            font-size: 1rem;
            text-decoration: none;
            transition: all 0.3s ease;
            font-weight: 500;
            box-shadow: 0 4px 10px rgba(225, 29, 72, 0.3);
        }

        .trailer-btn-overlay:hover {
            background: #be123c;
            transform: scale(1.05);
        }

        .trailer-btn-overlay i {
            margin-right: 8px;
        }

        .movie-content {
            padding: 1.5rem;
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }

        .movie-title {
            font-size: 1.5rem;
            margin-bottom: 0.8rem;
            color: #fff;
            font-weight: 600;
        }

        .movie-description {
            color: #94a3b8;
            line-height: 1.6;
            margin-bottom: 1.5rem;
            flex-grow: 1;
            font-size: 0.95rem;
        }

        .movie-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: auto;
        }

        .release-date {
            background: #334155;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.9rem;
            color: #fff;
            display: inline-block;
        }

        .trailer-btn {
            display: inline-block;
            background: #e11d48;
            color: white;
            padding: 0.5rem 1.2rem;
            border-radius: 30px;
            font-size: 0.9rem;
            text-decoration: none;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .trailer-btn:hover {
            background: #be123c;
            transform: scale(1.05);
        }

        .back-btn {
            display: block;
            width: fit-content;
            margin: 1.5rem auto 0;
            background: #3b82f6;
            color: white;
            padding: 0.7rem 1.5rem;
            border: none;
            border-radius: 30px;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            text-align: center;
            font-weight: 500;
            box-shadow: 0 4px 10px rgba(59, 130, 246, 0.3);
        }

        .back-btn:hover {
            background: #2563eb;
            transform: scale(1.05);
            box-shadow: 0 6px 15px rgba(59, 130, 246, 0.4);
        }
        
        .no-movies {
            text-align: center;
            color: #94a3b8;
            font-size: 1.2rem;
            margin-bottom: 2rem;
            display: block;
        }

        /* Add a pulsing effect to new releases */
        .movie-card:nth-child(3n+1)::before {
            content: 'New';
            position: absolute;
            top: 10px;
            right: 10px;
            background: #e11d48;
            color: white;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            z-index: 1;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { box-shadow: 0 0 0 0 rgba(225, 29, 72, 0.7); }
            70% { box-shadow: 0 0 0 10px rgba(225, 29, 72, 0); }
            100% { box-shadow: 0 0 0 0 rgba(225, 29, 72, 0); }
        }

        @media (max-width: 768px) {
            .header h1 {
                font-size: 2.5rem;
            }
            
            .movie-grid {
                grid-template-columns: 1fr;
            }

            .movie-footer {
                flex-direction: column;
                gap: 1rem;
                align-items: flex-start;
            }

            .trailer-btn {
                align-self: flex-end;
            }
        }
    </style>
</asp:Content>