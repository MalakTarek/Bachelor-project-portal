<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Meeting.aspx.cs" Inherits="GBP.Lecturer.Meeting" %>

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
               <li><a href="LecturerMain2.aspx"><i class="fas fa-home"></i>Profile</a></li>
               <li><a href="Grading.aspx"><i class="fas fa-sliders-h"></i>Grading</a></li>
               <li><a href="Recomendations.aspx"><i class="fas fa-address-book"></i>Recomendations</a></li>
               <li><a href="Meeting.aspx"><i class="fas fa-cog"></i>Meetings</a></li>
            </ul>
         </nav>
      </div>  
        <form id="form1" runat="server">
    <asp:Panel ID="Panel1" class="headerpanel" runat="server" Width="100%" Height="55px">
            <asp:Label runat="server" style="font-size:45px ;font-weight: bold; color:black; opacity: 1; -webkit-text-stroke: 1px white; margin-top:-10px">Meetings</asp:Label>
          
    </asp:Panel>
    
    <div style="margin:30px; float:right">
        <div>
           
            <asp:LinkButton ID="LinkButton5" runat="server"  BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Cursive" ForeColor="#000066" OnClick="button_click"><i class="fas fa-plus"></i> Create meetings</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton6" runat="server"  BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Cursive" ForeColor="#000066" OnClick="button2_click"><i class="fas fa-plus"></i> Add to the to-do list </asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton7" runat="server"  BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Cursive" ForeColor="#000066" OnClick="button3_click"><i class="fas fa-eye"></i> View Meetings</asp:LinkButton><br /><br />
        </div>
    </div>
    </form>
</body>
</html>
