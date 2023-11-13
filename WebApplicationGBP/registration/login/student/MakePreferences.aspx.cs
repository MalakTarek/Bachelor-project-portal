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
    public partial class MakePreferences : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void MakePref(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int id = int.Parse(Page.Request.Form["ID"].ToString());
            string bCode = Page.Request.Form["bCode"].ToString();
            int PrefN = int.Parse(Page.Request.Form["pNumber"].ToString());


            SqlCommand regproc = new SqlCommand("MakePreferencesLocalProject", conn);
            regproc.CommandType = CommandType.StoredProcedure;

            regproc.Parameters.Add(new SqlParameter("@sid", id));
            regproc.Parameters.Add(new SqlParameter("@bachelor_code", bCode));
            regproc.Parameters.Add(new SqlParameter("@preference_number", PrefN));



            conn.Open();
            regproc.ExecuteNonQuery();
            conn.Close();

        }
    }
}