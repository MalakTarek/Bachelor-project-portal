using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GBP
{
    public partial class SpecifyThesisDeadline : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            //string deadline = DeadlineDate.Text;
            DateTime deadline = DateTime.Parse(DeadlineDate.Text);
            SqlCommand specify = new SqlCommand("SpecifyThesisDeadline", conn);
            specify.CommandType = CommandType.StoredProcedure;
            specify.Parameters.Add(new SqlParameter("@deadline", deadline));
            conn.Open();
            specify.ExecuteNonQuery();
            conn.Close();
              Response.Redirect("LecturerMain2.aspx");

        }
    }
}