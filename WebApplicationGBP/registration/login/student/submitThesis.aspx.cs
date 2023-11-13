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
    public partial class submitThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitThesis(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            
            int id =int.Parse(Page.Request.Form["ID"].ToString());
            string title = Page.Request.Form["title"].ToString();
            string pdf = Page.Request.Form["pdf"].ToString();
          

            SqlCommand regproc = new SqlCommand("SubmitMyThesis", conn);
            regproc.CommandType = CommandType.StoredProcedure;

            regproc.Parameters.Add(new SqlParameter("@sid", id));
            regproc.Parameters.Add(new SqlParameter("@title", title));
            regproc.Parameters.Add(new SqlParameter("@PDF_Document", pdf));
           

    
            conn.Open();
            regproc.ExecuteNonQuery();
            conn.Close();
        }
    }
}