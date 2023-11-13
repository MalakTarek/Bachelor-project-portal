using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GBP.registration.login.Lecturer
{
    public partial class LecturerMain2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerCreateLocalProject.aspx");
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("SpecifyThesisDeadline.aspx");
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Supervise.aspx");
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecCreatePR.aspx");
        }
        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("/registration/login/ViewBachelorProjects.aspx");
        }

    }
}