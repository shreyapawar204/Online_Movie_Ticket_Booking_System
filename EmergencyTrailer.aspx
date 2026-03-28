<%@ Page Title="" Language="C#" MasterPageFile="~/Filmfan.Master" AutoEventWireup="true" CodeBehind="trailer.aspx.cs" Inherits="MajorProject.trailer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        </head>
    <body>
        <h1>Emergency</h1>
        <p>2h 27m • Drama,Historical •UA</p></br>
        
       <iframe width="700" height="400" src="https://www.youtube.com/embed/GB-9NdjTFvM?t=21">
       </iframe>
    <br />
    <br />
        <h2>About the movie</h2>
        <br />
        <p>Emergency is based on true events that unfolded in 1975. The film chronicles incidents that took place under the leadership of Mrs Indira Gandhi, one of the most Powerful Women in Indian History.</p>
        <br />
        <h2>Cast</h2>
        <div style="text-align: center; margin-top: 50px;">
            <div style="display: inline-block; margin: 20px;">
             <asp:Image ID="Image25" runat="server" ImageUrl="~/NewFolder1/kangana.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
          <p>Kangana Ranaut</p>
                <p>as Indira Gandhi</p>
                </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image26" runat="server" ImageUrl="~/NewFolder1/anupam.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
           <p>Anupam Kher</p>
                <p>as Jayprakash Narayan</p>
            </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image27" runat="server" ImageUrl="~/NewFolder1/shreyas.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;" />&nbsp;&nbsp;
           <p>Shreyas Talpade</p>
                <p>as Atal Bihari Vajpayee</p>
                </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image28" runat="server" ImageUrl="~/NewFolder1/mahima.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;
           <p>Mahima Chaudhary</p>
                <p>as Pupul Jayakar</p>
                </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image29" runat="server" ImageUrl="~/NewFolder1/vishak.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
           <p>Vishak Nair</p>
                <p>as Sanjay Gandhi</p>
                </div>
            <div style="display: inline-block; margin: 20px;">
                <asp:Image ID="Image30" runat="server" ImageUrl="~/NewFolder1/bhumika.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>
           <p>Bhumika Chawla</p>
                <p>Actor</p>
                </div>
        
        <br />
            <br />
        <h2>Crew</h2>
             <div style="text-align: center; margin-top: 50px;">
        <div style="display: inline-block; margin: 20px;">
        <asp:Image ID="Image31" runat="server" ImageUrl="~/NewFolder1/kangana.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
        <p>Kangana Ranaut</p>
            <p>Director •Producer •Writer</p>
         </div>
        <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image32" runat="server" ImageUrl="~/NewFolder1/zee.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
        <p>Zee Studio</p>
            <p>Producer </p>
     </div>
     <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image33" runat="server" ImageUrl="~/NewFolder1/gv.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;" />&nbsp;&nbsp;
    <p>G.V.Prakash Kumar</p>
         <p>Musician</p>
         </div>
     <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image34" runat="server" ImageUrl="~/NewFolder1/manoj.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;
    <p>Manoj Muntashir</p>
         <p>Lyricist</p>
         </div>
     <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image35" runat="server" ImageUrl="~/NewFolder1/ritesh.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>&nbsp;&nbsp;
    <p>Ritesh Shah</p>
         <p>Dialogue Writer •Screenplay </p>
         </div>
     <div style="display: inline-block; margin: 20px;">
         <asp:Image ID="Image37" runat="server" ImageUrl="~/NewFolder1/rameshwar.jpg" style="border-radius: 50%; width: 150px; height: 150px; object-fit: cover; border: 2px solid #ccc;"/>
    <p>Rameshwar Bhagat</p>
         <p>Editor</p>
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

