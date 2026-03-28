<%@ Page Title="" Language="C#" MasterPageFile="~/Filmfan.Master" AutoEventWireup="true" CodeBehind="trailer.aspx.cs" Inherits="MajorProject.trailer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        </head>
    <body>
        <h1>Game Changer</h1>
        <p>Drama, Political</p></br>
       
       <iframe width="700" height="400" src="https://www.youtube.com/embed/5lpfyGSQXbQ?t=56">
       </iframe>

    <br />
    <br />
        <h2>About the movie</h2>
        <br />
        <p> Get ready for RamCharan`s undeniable swag - he`s about to own the screen and slay it like never before!</p>
        <br />
        <h2>Cast</h2>
        <div style="text-align: center; margin-top: 50px;">
            <div style="display: inline-block; margin: 20px;">
             <asp:Image ID="Image13" runat="server" ImageUrl="~/NewFolder1/ram.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
          <p>Ram Charan</p>
                <p>Actor</p>
                </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image14" runat="server" ImageUrl="~/NewFolder1/kiara.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
           <p>Kiara Advani</p>
                <p>Actor</p>
            </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image15" runat="server" ImageUrl="~/NewFolder1/samuthirakani.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;" />&nbsp;&nbsp;
           <p>Samuthirakani</p>
                <p>Actor</p>
                </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image16" runat="server" ImageUrl="~/NewFolder1/sj.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;
           <p>S. J. Suryah</p>
                <p>Actor</p>
                </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image17" runat="server" ImageUrl="~/NewFolder1/anjali.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
           <p>Anjali</p>
                <p>Actor</p>
                </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image18" runat="server" ImageUrl="~/NewFolder1/meka.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>
           <p>Meka Srikanth</p>
                <p>Actor</p>
                </div>
        
        <br />
            <br />
        <h2>Crew</h2>
             <div style="text-align: center; margin-top: 50px;">
        <div style="display: inline-block; margin: 20px;">
        <asp:Image ID="Image19" runat="server" ImageUrl="~/NewFolder1/dil.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
        <p>Dil Raju</p>
            <p>Producer </p>
         </div>
        <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image20" runat="server" ImageUrl="~/NewFolder1/farhad.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
        <p>Farhad Samji</p>
            <p>Writer </p>
     </div>
     <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image21" runat="server" ImageUrl="~/NewFolder1/karthik.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;" />&nbsp;&nbsp;
    <p>Karthik Subbaraj</p>
         <p>Lyricist</p>
         </div>
     <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image22" runat="server" ImageUrl="~/NewFolder1/sthaman.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;
    <p>S.Thaman</p>
         <p>Musician</p>
         </div>
     <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image23" runat="server" ImageUrl="~/NewFolder1/shankar.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
    <p>Shankar Shanmugham</p>
         <p>Director </p>
         </div>
     <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image24" runat="server" ImageUrl="~/NewFolder1/sai.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>
    <p>Sai Madhav Burra</p>
         <p>Dialogue Writer </p>
         </div>
       <br />
        <br />
        <div style="height: 37px; background-color: #FFFFFF">
    <asp:Button ID="Button3" runat="server" BackColor="#FF0000" ForeColor="White" Height="37px" OnClick="Button3_Click" style="font-weight: bold; font-size: large" Text="Back To Movies Page" Width="375px" BorderStyle="None" PostBackUrl="~/Default.aspx" />
</div>
        <br />
       
</body>
</html>
    <br />
    <br />
</asp:Content>

