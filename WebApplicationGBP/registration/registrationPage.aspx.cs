
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GiuBachelorPortal
{
    public partial class registrationPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ToReg(object sender, EventArgs e)
        {
          
            string a = role.Items[role.SelectedIndex].Text;
            

            if (a.Equals("Student"))
            {
                Response.Redirect("studentReg.aspx");
            }
            else if (a.Equals("Lecturer"))
            {
                Response.Redirect("lecturerReg.aspx");
            }
            else if (a.Equals("Coordinator"))
            {
                Response.Redirect("cooReg.aspx");
            }
            else if(a.Equals("External Examiner"))
            {
                Response.Redirect("eeReg.aspx");
            }
            else if(a.Equals("Teaching Assistant"))
            {
                Response.Redirect("taReg.aspx");
            }

        }
    }
}