using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GBP
{
    public partial class LecturerCreateMeeting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string i = LID.Text;
            int id = int.Parse(i);
            DateTime stime = DateTime.Parse(STime.Text);
            DateTime etime = DateTime.Parse(ETime.Text);
            DateTime date = DateTime.Parse(Date.Text);
            string mpoint = MPoint.Text;
            SqlCommand createm = new SqlCommand("CreateMeeting", conn);
            createm.CommandType = CommandType.StoredProcedure;
            createm.Parameters.Add(new SqlParameter("@Lecturer_id", id));
            createm.Parameters.Add(new SqlParameter("@start_time", stime));
            createm.Parameters.Add(new SqlParameter("@end_time", etime));
            createm.Parameters.Add(new SqlParameter("@date", date));
            createm.Parameters.Add(new SqlParameter("@meeting_point", mpoint));
            conn.Open();
            createm.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("Meeting.aspx");
        }
    }
}