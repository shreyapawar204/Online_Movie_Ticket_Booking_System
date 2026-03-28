<%@ Page Title="" Language="C#" MasterPageFile="~/Filmfan.Master" AutoEventWireup="true" CodeBehind="CaptionAmericaTrailer.aspx.cs" Inherits="MajorProject.CaptionAmericaTrailer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
         <html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        </head>
    <body>
        <h1>Captain America: Brave New World</h1>
        <p>Action,Adventure</p> </br>
        <p>Releasing on 14 Feb,2025<p>
        
       <iframe width="875" height="492" src="https://www.youtube.com/embed/1pHDWnXmK7Y" title="Captain America: Brave New World | Official Trailer" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
    <br />
    <br />
        <h2>About the movie</h2>
        <br />
        <p>Captain America: Brave New World is an upcoming American superhero film based on the Marvel Comics character Sam Wilson / Captain America.Produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures, it is intended to be the fourth installment in the Captain America film series, a continuation of the television miniseries The Falcon and the Winter Soldier (2021), and the 35th film in the Marvel Cinematic Universe (MCU).</p>
        <br />
        <h2>Cast</h2>
        <div style="text-align: center; margin-top: 50px;">
            <div style="display: inline-block; margin: 20px;">
             <asp:Image ID="Image25" runat="server" ImageUrl="~/NewFolder1/Anthony_Mackie.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
          <p>Anthony Mackie</p>
                <p>as Sam Wilson</p>
                </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image26" runat="server" ImageUrl="~/NewFolder1/Harrison_Ford.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
           <p>Harrison Ford</p>
                <p>Actor</p>
            </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image27" runat="server" ImageUrl="~/NewFolder1/Tim_Blake.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;" />&nbsp;&nbsp;
           <p>Tim Blake</p>
                <p>Actor</p>
                </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image28" runat="server" ImageUrl="~/NewFolder1/Liv_Tyler.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;
           <p>Liv Tyler</p>
                <p>Actor</p>
                </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image29" runat="server" ImageUrl="~/NewFolder1/Rose_Salazar.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
           <p>Rose Salazar</p>
                <p>Actor</p>
                </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image30" runat="server" ImageUrl="~/NewFolder1/Shira_Hass.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>
           <p>Shira Hass</p>
                <p>Actor</p>
                </div>
        
        <br />
            <br />
        <h2>Crew</h2>
             <div style="text-align: center; margin-top: 50px;">
        <div style="display: inline-block; margin: 20px;">
        <asp:Image ID="Image31" runat="server" ImageUrl="~/NewFolder1/Nate_Moore.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
        <p>Nate Moore</p>
            <p>Producer</p>
         </div>
        <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image32" runat="server" ImageUrl="~/NewFolder1/malcolm.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
        <p>Malcolm Spellman</p>
            <p>Writer </p>
     </div>
     <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image33" runat="server" ImageUrl="~/NewFolder1/matthew.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;" />&nbsp;&nbsp;
    <p>Mattew Orton</p>
         <p>Orton</p>
         </div>
     <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image34" runat="server" ImageUrl="~/NewFolder1/victoria.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;
    <p>Victoria Alonso</p>
         <p>Executive Producer</p>
         </div>
     <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image35" runat="server" ImageUrl="~/NewFolder1/louis.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
    <p>Louis D`Esposito</p>
         <p>Executive Producer </p>
         </div>
     <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image37" runat="server" ImageUrl="~/NewFolder1/kristin.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>
    <p>Kristin Lekki</p>
         <p>Art Director</p>
         </div>
       <br />
        <br />
                 <asp:HyperLink ID="BackToMovies" runat="server" NavigateUrl="~/UpcomingMovies.aspx" CssClass="back-btn">Back to Upcoming Movies</asp:HyperLink>
        
  <style>
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
        </style>
       
</body>
</html>
    <br />
    <br />  
</asp:Content>
