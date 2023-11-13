using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GiuBachelorPortal.registration
{
    public partial class viewNotBookedMeetings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void viewMe(object sender, EventArgs e)
        {
            int id = int.Parse(Page.Request.Form["ID"].ToString());

            Response.Redirect("toViewNotBooked.aspx?id=" + id);

        }
    }
}