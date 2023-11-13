using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GiuBachelorPortal.registration
{
    public partial class viewBookedMeetings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ViewBM(object sender, EventArgs e)
        {
            int id = int.Parse(Page.Request.Form["ID"].ToString());
            int mid = int.Parse(Page.Request.Form["m_id"].ToString());
            Response.Redirect("toViewBooked.aspx?id=" + id + "&mid=" + mid);

        }
    }
}