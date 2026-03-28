<%@ Page Title="" Language="C#" MasterPageFile="~/Filmfan.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MajorProject.Home2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FilmFan - Your Movie Destination</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css">
    <style>
        :root {
            --primary-dark: #141414;
            --primary-red: #E50914;
        }

        body {
            background-color: var(--primary-dark);
            color: white;
            font-family: 'Arial', sans-serif;
        }

        .hero-carousel {
            margin-bottom: 3rem;
            position: relative;
        }

        .hero-carousel::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 150px;
            background: linear-gradient(to top, var(--primary-dark), transparent);
        }

        .carousel-item img {
            height: 80vh;
            object-fit: cover;
            filter: brightness(0.7);
        }

        .recommended-section {
            padding: 2rem 0;
            text-align: center;  /* Center align the section */
        }

        .movie-card {
            position: relative;
            transition: transform 0.3s ease;
            overflow: hidden;
            border-radius: 8px;
            cursor: pointer;
            display: inline-block;  /* Allow centering */
            margin: 0 auto;  /* Center the card */
        }

        .movie-card:hover {
            transform: scale(1.05);
        }

        .movie-card img {
            width: 250px;  /* Fixed width */
            height: 350px;  /* Fixed height */
            border-radius: 8px;
            display: block;  /* Remove extra space */
            margin: 0 auto;  /* Center the image */
        }

        .movie-info {
            padding: 1rem 0;
            text-align: center;  /* Center the content */
        }

        .movie-title {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
            text-align: center;  /* Center the title */
        }

        .genre-badge {
            background-color: var(--primary-red);
            padding: 0.25rem 1rem;
            border-radius: 20px;
            font-size: 0.9rem;
            display: inline-block;
            margin: 0 0.25rem;  /* Add space between badges */
        }

        .section-title {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 2rem;
            text-align: center;  /* Center the title */
            padding-left: 0;  /* Remove left padding */
        }

        .section-title::before {
            display: none;  /* Remove the red line since it's centered */
        }

        /* Center the movie container */
        .movie-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
    </style>
</head>
<body>
    <div class="hero-carousel">
        <div id="mainCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="2"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="NewFolder1/th1.jpg" class="d-block w-100" alt="Movie 1">
                </div>
                <div class="carousel-item">
                    <img src="NewFolder1/th3.jpg" class="d-block w-100" alt="Movie 2">
                </div>
                <div class="carousel-item">
                    <img src="NewFolder1/th2.jpg" class="d-block w-100" alt="Movie 3">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>
    </div>

    <div class="container">
        <div class="recommended-section">
            <h2 class="section-title">Recommended Movies</h2>
            <h2 class="section-title">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/NewFolder1/pushpa2.jpg" PostBackUrl="~/trailer.aspx" />
            </h2>
            <div class="movie-container">
                <div class="movie-card">
                    &nbsp;<div class="movie-info">
                        <div class="movie-title">Pushpa 2: The Rule</div>
                        <span class="genre-badge">Action</span>
                        <span class="genre-badge">Thriller</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
</asp:Content>
