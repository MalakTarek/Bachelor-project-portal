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
    public partial class addToDoList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddToDL(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int mid = int.Parse(Page.Request.Form["m_id"].ToString());
            string doLi = Page.Request.Form["Todl"].ToString();
            



            SqlCommand regproc = new SqlCommand("StudentAddToDo", conn);
            regproc.CommandType = CommandType.StoredProcedure;

            regproc.Parameters.Add(new SqlParameter("@meeting_id", mid));
            regproc.Parameters.Add(new SqlParameter("@to_do_list", doLi));



            conn.Open();
            regproc.ExecuteNonQuery();
            conn.Close();
        }
    }
}