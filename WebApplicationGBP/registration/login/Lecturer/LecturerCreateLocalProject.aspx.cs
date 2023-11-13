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
    public partial class LecturerCreateLocalProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

          
        }
        protected void Button_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            // int id = LID.Value;
            string i = LID.Text;
            int id = int.Parse(i);
            // string email = emailText.Text;
            // string pass = password.Text;
            string pcode = Pcode.Text;
            string title = Title.Text;
            string des = Description.Text;
            string mcode = Mcode.Text;
            SqlCommand createpro = new SqlCommand("LecturerCreateLocalProject", conn);
            createpro.CommandType = CommandType.StoredProcedure;
            createpro.Parameters.Add(new SqlParameter("@Lecturer_id", id));
            createpro.Parameters.Add(new SqlParameter("@proj_code", pcode));
            createpro.Parameters.Add(new SqlParameter("@title", title));
            createpro.Parameters.Add(new SqlParameter("@description", des));
            createpro.Parameters.Add(new SqlParameter("@major_code", mcode));
            conn.Open();
            createpro.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("LecturerMain.aspx?userid=" + id.ToString());
        }
    }
}