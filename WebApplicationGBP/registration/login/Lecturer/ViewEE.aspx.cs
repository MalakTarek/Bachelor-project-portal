using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GBP.registration.login.Lecturer
{
    public partial class ViewEE : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StringBuilder table = new StringBuilder();
            
            string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewMeeting = new SqlCommand("ViewEE", conn);
            viewMeeting.CommandType = System.Data.CommandType.StoredProcedure;
           ;
            conn.Open();
            SqlDataReader rdr = viewMeeting.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            table.Append("<table border = '1'>");
            table.Append("<tr><th>EE_Id</th><th>Schedule</th>");
            table.Append("</tr>");
            while (rdr.Read())
            {
                table.Append("<tr>");
                table.Append("<tr>");

                table.Append("<td>" + rdr[0] + "</td>");

                table.Append("<td>" + rdr[1] + "</td>");


                table.Append("</tr");
                table.Append("</tr");
            }
            table.Append("/table");
            this.Controls.Add(new Literal { Text = table.ToString() });
            rdr.Close();

        }
        protected void Button_Click(object sender, EventArgs e)
        {

            Response.Redirect("Recomendations.aspx");
        }
    }
}