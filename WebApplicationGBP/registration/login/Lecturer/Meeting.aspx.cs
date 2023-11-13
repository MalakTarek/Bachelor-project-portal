using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GBP.Lecturer
{
    public partial class Meeting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          

        }
        protected void button_click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerCreateMeeting.aspx");

        }
        protected void button2_click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerAddToDo.aspx");

        }
        protected void button3_click(object sender, EventArgs e)
        {
            Response.Redirect("ViewMeetings.aspx");

        }
    }
}