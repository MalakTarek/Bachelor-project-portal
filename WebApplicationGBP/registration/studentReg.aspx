<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentReg.aspx.cs" Inherits="GiuBachelorPortal.registration.studentReg" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>create project</title>
    <link rel="stylesheet" type="text/css" href="./regStyle.css"/>
</head>
<body>
    <div class="login-root">
    <div class="box-root flex-flex flex-direction--column" style="min-height: 100vh;flex-grow: 1;">
      <div class="loginbackground box-background--white padding-top--64">
        <div class="loginbackground-gridContainer">
          <div class="box-root flex-flex" style="grid-area: top / start / 8 / end;">
            <div class="box-root" style="background-image: linear-gradient(white 0%, rgb(247, 250, 252) 33%); flex-grow: 1;">
            </div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 4 / 2 / auto / 5;">
            <div class="box-root box-divider--light-all-2 animationLeftRight tans3s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 6 / start / auto / 2;">
            <div class="box-root box-background--blue800" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 7 / start / auto / 4;">
            <div class="box-root box-background--blue animationLeftRight" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 8 / 4 / auto / 6;">
            <div class="box-root box-background--gray100 animationLeftRight tans3s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 2 / 15 / auto / end;">
            <div class="box-root box-background--cyan200 animationRightLeft tans4s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 3 / 14 / auto / end;">
            <div class="box-root box-background--blue animationRightLeft" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 4 / 17 / auto / 20;">
            <div class="box-root box-background--gray100 animationRightLeft tans4s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 5 / 14 / auto / 17;">
            <div class="box-root box-divider--light-all-2 animationRightLeft tans3s" style="flex-grow: 1;"></div>
          </div>
        </div>
      </div>
      <div class="box-root padding-top--24 flex-flex flex-direction--column" style="flex-grow: 1; z-index: 9;">
        <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
          <h1><a href="http://www.giu-uni.de//" rel="dofollow"> GIU </a></h1>
        </div>
        <div class="formbg-outer">
          <div class="formbg">
            <div class="formbg-inner padding-horizontal--48">
              <span class="padding-bottom--15">Registration</span>
             
    <form id="form1" runat="server">
        <div>
             <div class="field padding-bottom--24">
        <div> 
             <label for="email" >Email</label>
                  <input type="text" name="email" id="email"/>
        </div>
          <div> 
             <label for="phoneNumber">PhoneNumber</label>
                  <input type="text" name="phoneNumber" id="phoneNumber"/>
        </div>
         <div> 
             <label for="username">UserName</label>
                  <input type="text" name="username" id="username"/>
        </div>
        
        <div> 
             <label for="firstName" >First name</label>
                  <input type="text" name="firstName" id="firstName"/>
        </div>
          <div> 
             <label for="lastName">Last name</label>
                  <input type="text" name="lastName" id="lastName"/>
        </div>
         <div> 
             <label for="semster">Semster</label>
                  <input type="number" name="semster" id="semster"/>
        </div>
             <div> 
             <label for="address" >Address</label>
                  <input type="text" name="address" id="address"/>
        </div>
          <div> 
             <label for="majorCode">Major code</label>
                  <input type="text" name="majorCode" id="majorCode"/>
        </div>
         <div> 
             <label for="gpa">GPA</label>
                  <input type="number" name="gpa" id="gpa" step ="any"/>
        </div>
         <div> 
             <label for="birthday">Date of birth</label>
                  <input type="Date" name="birthday" id="birthday"/>
             <br />
             </div>
        </div>
         <div class ="field padding-btoom--24">
             <asp:Button ID="regS" runat="server" Text="Register" OnClick="RegisterS"/>
         </div>
                  </form>
                 </div>
   
      </div>
   </div>
  </div>
</body>
</html>
