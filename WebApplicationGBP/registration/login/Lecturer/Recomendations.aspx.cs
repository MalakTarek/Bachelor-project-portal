using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GBP.Lecturer
{
    public partial class Recomendations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewEE.aspx");
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("RecomendEE.aspx");
        }
    }
}