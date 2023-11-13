using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace WebApplicationGBP.registration.login
{
    public partial class ViewBachelorProjects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String type = Type.Text;
            string i = ID.Text;
            int id = int.Parse(i);
           
            
            Response.Redirect("viewprojectHelper.aspx?Type=" + type.ToString() + "&ID=" + id.ToString());
        }
    }
}