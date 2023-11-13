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

namespace GBP.registration.login.Lecturer
{
    public partial class LecturerAddToDo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void  Button_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            ;
            string i = MID.Text;
            int id = int.Parse(i);
            string tlist = list.Text;
            SqlCommand addtodo = new SqlCommand("LecturerAddToDo", conn);
            addtodo.CommandType = CommandType.StoredProcedure;
            addtodo.Parameters.Add(new SqlParameter("@meeting_id", id));
            addtodo.Parameters.Add(new SqlParameter("@to_do_list", tlist));
            conn.Open();
            addtodo.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("Meeting.aspx");
        }
    }
}