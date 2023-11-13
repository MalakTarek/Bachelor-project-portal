using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GBP.Lecturer
{
    public partial class Grading : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button_Click1(object sender, EventArgs e)
        {
            Response.Redirect("LecGradeThesis.aspx");
        }
        protected void Button_Click2(object sender, EventArgs e)
        {
            Response.Redirect("LecGradeDefense.aspx");
        }
        protected void Button_Click3(object sender, EventArgs e)
        {
            Response.Redirect("LecGradePR.aspx");
        }

    }
}