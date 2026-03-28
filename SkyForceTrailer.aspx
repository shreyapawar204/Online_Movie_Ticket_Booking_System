<%@ Page Title="" Language="C#" MasterPageFile="~/Filmfan.Master" AutoEventWireup="true" CodeBehind="SkyForceTrailer.aspx.cs" Inherits="MajorProject.SkyForceTrailer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
             <html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        </head>
    <body>
        <h1>Sky Force</h1>
        <p> Action,Historical,Thriller</p> </br>
        <p>Releasing on 24 January 2025<p>
        
      <iframe width="875" height="492" src="https://www.youtube.com/embed/PKsVB1wPZ78" title="Sky Force | Official Trailer | Akshay Kumar | Veer P | Sara | Nimrat | Dinesh Vijan | 24th Jan 2025" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
    <br />
    <br />
        <h2>About the movie</h2>
        <br />
        <p>The actor plays the role of Indian Air Force Officer and the film celebrates one of the biggest victories of Indian Air Force. The story is based on true events.Sky Force is an upcoming Indian Hindi-language war film directed by Abhishek Anil Kapur and Sandeep Kewlani and produced by Dinesh Vijan and Amar Kaushik under Maddock Films.</p>
        <br />
        <h2>Cast</h2>
        <div style="text-align: center; margin-top: 50px;">
            <div style="display: inline-block; margin: 20px;">
             <asp:Image ID="Image25" runat="server" ImageUrl="~/NewFolder1/Akshay.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
          <p>Akshay Kumar</p>
                <p>Actor</p>
                </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image26" runat="server" ImageUrl="~/NewFolder1/nimrit.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
           <p>Nimrat Kaur</p>
                <p>Actor</p>
            </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image27" runat="server" ImageUrl="~/NewFolder1/irena.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;" />&nbsp;&nbsp;
           <p>Irina Svecova</p>
                <p>Actor</p>
                </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image28" runat="server" ImageUrl="~/NewFolder1/veer.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;
           <p>Veer Pahariya</p>
                <p>Actor</p>
                </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image29" runat="server" ImageUrl="~/NewFolder1/bogmuli.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
           <p>Bogumila Bubiak</p>
                <p>Actor</p>
                </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image30" runat="server" ImageUrl="~/NewFolder1/sarakhan.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>
           <p>Sara Ali Khan</p>
                <p>Actor</p>
                </div>
        
        <br />
            <br />
        <h2>Crew</h2>
             <div style="text-align: center; margin-top: 50px;">
        <div style="display: inline-block; margin: 20px;">
        <asp:Image ID="Image31" runat="server" ImageUrl="~/NewFolder1/skyC1.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
        <p>Sandeep Kewlani</p>
            <p>Director, Writer</p>
         </div>
        <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image32" runat="server" ImageUrl="~/NewFolder1/SkyC2.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
        <p>Abhishek SAnil</p>
            <p>Director </p>
     </div>
     <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image33" runat="server" ImageUrl="~/NewFolder1/SkyC3.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;" />&nbsp;&nbsp;
    <p>Dinesh Vijan</p>
         <p>Producer</p>
         </div>
     <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image34" runat="server" ImageUrl="~/NewFolder1/SkyC4.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;
    <p>Jyoti deshpande</p>
         <p> Producer</p>
         </div>
     <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image35" runat="server" ImageUrl="~/NewFolder1/SkyC5.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
    <p>Amar Kaushik</p>
         <p>Producer </p>
         </div>
     <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image37" runat="server" ImageUrl="~/NewFolder1/SkyC6.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>
    <p>Jio Studios</p>
         <p>Presents
         </p>
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
