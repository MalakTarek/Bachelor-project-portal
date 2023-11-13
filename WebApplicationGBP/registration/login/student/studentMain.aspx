<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentMain.aspx.cs" Inherits="GiuBachelorPortal.studentMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="utf-8">
      <title></title>
      <link rel="stylesheet" href="main.css">
    
   </head>

   <body>
      <div class="wrapper">
         <input type="checkbox" id="btn" hidden/>
         <label for="btn" class="menu-btn">
         <i class="fas fa-bars"></i>
         <i class="fas fa-times"></i>
         </label>
         <nav id="sidebar">
            <div class="title">
               Menu
            </div>
            <ul class="list-items">
               <li><a href="studentMain.aspx"><i class="fas fa-home"></i>Profile</a></li>
               <li><a href="thesis.aspx"><i class="fas fa-sliders-h"></i>Thesis</a></li>
               <li><a href="pg.aspx"><i class="fas fa-address-book"></i>Progress report</a></li>
               <li><a href="defense.aspx"><i class="fas fa-cog"></i>Defense</a></li>
               <li><a href="meetings.aspx"><i class="fas fa-cog"></i>Meetings</a></li>
            </ul>
         </nav>
      </div>  
        <form id="form1" runat="server">
    <asp:Panel ID="Panel1" class="headerpanel" runat="server" Width="100%" Height="55px">
            <asp:Label runat="server" style="font-size:45px ;font-weight: bold; color:black; opacity: 1; -webkit-text-stroke: 1px white; margin-top:-10px">Home</asp:Label>
            <div style="margin-top: -60px; padding-right: 20px">
            <asp:Button ID="Button2" runat="server" Text="Sign Out" style="float:right; margin-top:20px" BackColor="#FF5050" BorderColor="Red" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="Maroon" OnClick="Button2_Click" />
            <asp:Label ID="UserLabel" runat="server" style="font-size:30px ;font-weight: bold; color:black; opacity: 1; margin-top:10px; margin-right: 10px; float:right"></asp:Label>
            </div>
    </asp:Panel>
    
    <div style="margin:30px; float:right">
        <div>
            <asp:LinkButton ID="LinkButton3" runat="server"  BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Cursive" ForeColor="#000066" OnClick="LinkButton3_Click"><i class="fas fa-plus"></i> Make preferences for projects</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton9" runat="server"  BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Cursive" ForeColor="#000066" OnClick="LinkButton9_Click"><i class="fas fa-eye"></i> view bachelor project grade</asp:LinkButton><br /><br />
                        <asp:LinkButton ID="LinkButton1" runat="server"  BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Cursive" ForeColor="#000066" onclick="Button7_Click"><i class="fas fa-eye"></i> view bachelor project</asp:LinkButton><br /><br />
        </div>
    </div>
    </form>
   </body>
</html>
