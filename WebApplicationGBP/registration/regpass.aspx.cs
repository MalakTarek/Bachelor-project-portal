using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationGBP.registration
{
    public partial class regpass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int userid = int.Parse(Request.QueryString["userid"]);
            string pass = Request.QueryString["password"];

            StringBuilder table = new StringBuilder();
            table.Append("<table border = '1'>");
            table.Append("<tr><th>User_ID</th><th>pass</th>");
            table.Append("</tr>");
            table.Append("<tr>");
            table.Append("<tr>");

            table.Append("<td>" + userid + "</td>");

            table.Append("<td>" + pass + "</td>");

            table.Append("</tr");
            table.Append("</tr");
            table.Append("/table");
            this.Controls.Add(new Literal { Text = table.ToString() });

        }
        protected void Button_Click(object sender, EventArgs e)
        {
            Response.Redirect("login/loginForm.aspx");
        }
    }
}