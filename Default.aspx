<%@ Page Title="" Language="C#" MasterPageFile="~/Filmfan.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MajorProject.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Base container styling */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: linear-gradient(135deg, #f5f7fa 0%, #e9eef5 100%);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.1);
        }
        
        /* Page heading */
        .page-title {
            color: #1e3799;
            text-align: center;
            margin-bottom: 50px;
            font-size: 42px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 2px;
            position: relative;
        }
        
        .page-title:after {
            content: "";
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: linear-gradient(90deg, #e74c3c, #3498db);
            border-radius: 2px;
        }
        
        /* Movie list container */
        .movie-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
        }
        
        /* Movie card styling */
        .movie-card {
            width: 280px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            margin-bottom: 20px;
        }
        
        .movie-card:hover {
            transform: translateY(-15px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
        }
        
        /* Image container with gradient overlay */
        .image-container {
            position: relative;
            overflow: hidden;
            height: 400px;
        }
        
        .movie-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s;
        }
        
        .movie-card:hover .movie-image {
            transform: scale(1.08);
        }
        
        /* Gradient overlay on hover */
        .image-container:after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(to bottom, rgba(0,0,0,0) 60%, rgba(0,0,0,0.8) 100%);
            opacity: 0.8;
        }
        
        /* Movie details styling */
        .movie-details {
            padding: 25px;
        }
        
        .movie-title {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 12px;
            color: #2c3e50;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        .movie-info {
            font-size: 15px;
            color: #555;
            margin-bottom: 20px;
            line-height: 1.6;
        }
        
        .movie-info div {
            margin-bottom: 5px;
        }
        
        .movie-rating {
            display: flex;
            align-items: center;
            margin-bottom: 8px;
        }
        
        .stars {
            color: #f39c12;
            margin-left: 5px;
        }
        
        /* Button styling */
        .button-group {
            display: flex;
            gap: 12px;
        }
        
        .book-button {
            background: linear-gradient(135deg, #4CAF50, #2ecc71);
            color: white;
            padding: 12px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;
            font-weight: 600;
            border-radius: 50px;
            cursor: pointer;
            border: none;
            flex: 1;
            transition: all 0.3s;
            box-shadow: 0 4px 8px rgba(46, 204, 113, 0.3);
        }
        
        .book-button:hover {
            background: linear-gradient(135deg, #45a049, #27ae60);
            box-shadow: 0 6px 12px rgba(46, 204, 113, 0.5);
            transform: translateY(-2px);
        }
        
        .trailer-button {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            color: white;
            padding: 12px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;
            font-weight: 600;
            border-radius: 50px;
            cursor: pointer;
            border: none;
            flex: 1;
            transition: all 0.3s;
            box-shadow: 0 4px 8px rgba(231, 76, 60, 0.3);
        }
        
        .trailer-button:hover {
            background: linear-gradient(135deg, #c0392b, #a93226);
            box-shadow: 0 6px 12px rgba(231, 76, 60, 0.5);
            transform: translateY(-2px);
        }
        
        /* Genre badge */
        .genre-badge {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: rgba(0,0,0,0.7);
            color: white;
            padding: 6px 12px;
            border-radius: 30px;
            font-size: 12px;
            font-weight: 600;
            z-index: 1;
        }
        
        /* Duration badge */
        .duration-badge {
            position: absolute;
            top: 20px;
            left: 20px;
            background-color: rgba(52, 152, 219, 0.9);
            color: white;
            padding: 6px 12px;
            border-radius: 30px;
            font-size: 12px;
            font-weight: 600;
            z-index: 1;
        }
        
        /* Upcoming movies button */
        .upcoming-button {
            display: block;
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            padding: 15px 30px;
            margin: 40px auto 0;
            text-align: center;
            font-size: 18px;
            font-weight: 700;
            border-radius: 50px;
            cursor: pointer;
            border: none;
            transition: all 0.3s;
            width: 350px;
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.4);
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .upcoming-button:hover {
            background: linear-gradient(135deg, #2980b9, #1f618d);
            box-shadow: 0 6px 20px rgba(52, 152, 219, 0.6);
            transform: translateY(-3px);
        }
        
        /* Error message styling */
        .error-message {
            text-align: center;
            background-color: #fff3f3;
            color: #e74c3c;
            padding: 15px;
            border-left: 5px solid #e74c3c;
            margin: 20px 0;
            border-radius: 5px;
            font-weight: 500;
        }
    </style>

    <div class="container">
        <h1 class="page-title">Now Showing</h1>
        
        <asp:Repeater ID="rptMovies" runat="server">
            <HeaderTemplate>
                <div class="movie-list">
            </HeaderTemplate>
            <ItemTemplate>
                <div class="movie-card">
                    <div class="genre-badge"><%# Eval("Genre") %></div>
                    <div class="duration-badge"><%# Eval("Duration") %> min</div>
                    <div class="image-container">
                        <img class="movie-image" src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' />
                    </div>
                    <div class="movie-details">
                        <div class="movie-title"><%# Eval("Title") %></div>
                        <div class="movie-info">
                            <div class="movie-rating">
                                Rating: <%# Eval("Rating") %>/10
                                <span class="stars">
                                    <%# GetStars(Convert.ToDouble(Eval("Rating"))) %>
                                </span>
                            </div>
                        </div>
                        <div class="button-group">
                            <asp:Button ID="btnTrailer" runat="server" Text="Watch Trailer" CssClass="trailer-button" 
                                CommandName="WatchTrailer" CommandArgument='<%# Eval("TrailerUrl") %>' 
                                OnCommand="btnTrailer_Command" />
                            <asp:Button ID="btnBook" runat="server" Text="Book Now" CssClass="book-button" 
                                CommandName="BookTickets" CommandArgument='<%# Eval("MovieID") %>' 
                                OnCommand="btnBook_Command" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
        
        <asp:Label ID="lblMessage" runat="server" CssClass="error-message" Visible="false"></asp:Label>
        
        <asp:Button ID="Button3" runat="server" CssClass="upcoming-button" 
            PostBackUrl="~/UpcomingMovies.aspx" Text="Upcoming Movies" />
    </div>

    <script type="text/javascript">
        // Add any JavaScript enhancements here if needed
        window.onload = function() {
            // You can add animation or interaction code here
        };
    </script>
</asp:Content>