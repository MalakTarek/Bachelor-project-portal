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

namespace GBP.registration.login.Lecturer
{
    public partial class ViewMeetingHelper : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StringBuilder table = new StringBuilder();
            int lid = int.Parse(Request.QueryString["LID"]);
            int mid = int.Parse(Request.QueryString["MID"]);
            string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewMeeting = new SqlCommand("ViewMeetingLecturer", conn);
            viewMeeting.CommandType = System.Data.CommandType.StoredProcedure;
            viewMeeting.Parameters.Add(new SqlParameter("@Lecturer_id", lid));
            viewMeeting.Parameters.Add(new SqlParameter("@meeting_id", mid));
            conn.Open();
            SqlDataReader rdr = viewMeeting.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            table.Append("<table border = '1'>");
            table.Append("<tr><th>Meeting_Id</th><th>L_id</th><th>STime</th><th>ETime</th><th>Duration</th><th>Date</th><th>Meeting_Point<th>");
            table.Append("</tr>");
            while (rdr.Read())
            {
                table.Append("<tr>");
                table.Append("<tr>");

                table.Append("<td>" + rdr[0] + "</td>");

                table.Append("<td>" + rdr[1] + "</td>");

                table.Append("<td>" + rdr[2] + "</td>");

                table.Append("<td>" + rdr[3] + "</td>");

                table.Append("<td>" + rdr[4] + "</td>");

                table.Append("<td>" + rdr[5] + "</td>");

                table.Append("<td>" + rdr[6] + "</td>");

                table.Append("</tr");
                table.Append("</tr");
            }
            table.Append("/table");
            this.Controls.Add(new Literal { Text = table.ToString() });
            rdr.Close();
          
        }
        protected void Button_Click (object sender, EventArgs e)
        {
            Response.Redirect("Meeting.aspx");
        }

    }
}