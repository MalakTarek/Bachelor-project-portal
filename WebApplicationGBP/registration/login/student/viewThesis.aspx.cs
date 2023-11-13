using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GiuBachelorPortal.registration
{
    public partial class viewThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ViewThesis(object sender, EventArgs e)
        {
            int id = int.Parse(Page.Request.Form["ID"].ToString());
            string title = Page.Request.Form["title"].ToString();
            
            Response.Redirect("toViewThesis.aspx?title="+title.ToString() +"&id="+ id);

        }
    }
}