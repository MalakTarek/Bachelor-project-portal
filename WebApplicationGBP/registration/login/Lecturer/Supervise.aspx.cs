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
    public partial class Supervise : System.Web.UI.Page
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
            string pcode = Pcode.Text;
            SqlCommand supervisepro = new SqlCommand("SuperviseIndustrial", conn);
            supervisepro.CommandType = CommandType.StoredProcedure;
            supervisepro.Parameters.Add(new SqlParameter("@Lecturer_id", id));
            supervisepro.Parameters.Add(new SqlParameter("@proj_code", pcode));
            conn.Open();
            supervisepro.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("LecturerMain.aspx?userid=" + id.ToString());

        }
    }
}