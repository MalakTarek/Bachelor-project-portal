using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GBP.registration.login.Lecturer
{
    public partial class LecCreatePR : System.Web.UI.Page
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
            String s = SID.Text;
            int sid = int.Parse(s);
            DateTime date = DateTime.Parse(Date.Text);
            string content = Content.Text;
            SqlCommand createm = new SqlCommand("LecCreatePR", conn);
            createm.CommandType = CommandType.StoredProcedure;
            createm.Parameters.Add(new SqlParameter("@Lecturer_id", id));
            createm.Parameters.Add(new SqlParameter("@sid", sid));
            createm.Parameters.Add(new SqlParameter("@date", date));
            createm.Parameters.Add(new SqlParameter("@content",content));
            conn.Open();
            createm.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("LecturerMain.aspx?userid=" + id.ToString());
        }
    }
}