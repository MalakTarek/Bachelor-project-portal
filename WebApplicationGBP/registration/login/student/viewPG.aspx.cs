using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GiuBachelorPortal.registration
{
    public partial class viewPG : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ViewPG(object sender, EventArgs e)
        {
            int id = int.Parse(Page.Request.Form["ID"].ToString());
            DateTime date = DateTime.Parse(Page.Request.Form["date"].ToString());

            Response.Redirect("toViewPG.aspx?date=" + date.ToString() + "&id=" + id);
        }
    }
}