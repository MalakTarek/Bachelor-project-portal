using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GiuBachelorPortal.registration
{
    public partial class bookMeeting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BookMeerting(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int id = int.Parse(Page.Request.Form["ID"].ToString());
            int mid = int.Parse(Page.Request.Form["m_id"].ToString());



            SqlCommand regproc = new SqlCommand("BookMeeting", conn);
            regproc.CommandType = CommandType.StoredProcedure;

            regproc.Parameters.Add(new SqlParameter("@sid", id));
            regproc.Parameters.Add(new SqlParameter("@meeting_id", mid));



            conn.Open();
            regproc.ExecuteNonQuery();
            conn.Close();
        }
    }
}