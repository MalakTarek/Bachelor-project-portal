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
    public partial class studentReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterS(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string user = "Student";
            string email = Page.Request.Form["email"].ToString();
            string phone = Page.Request.Form["phoneNumber"].ToString();
            string username = Page.Request.Form["username"].ToString();
            string firstName = Page.Request.Form["firstName"].ToString();
            string lastName = Page.Request.Form["lastName"].ToString();
            int semster = int.Parse(Page.Request.Form["semster"].ToString());
            string address = Page.Request.Form["address"].ToString();
            decimal gpa = decimal.Parse(Page.Request.Form["gpa"].ToString());
            string bd = Page.Request.Form["birthday"].ToString();
            string majorCode = Page.Request.Form["majorCode"].ToString();

            SqlCommand regproc = new SqlCommand("UserRegister", conn);
            regproc.CommandType = CommandType.StoredProcedure;

            regproc.Parameters.Add(new SqlParameter("@usertype", user));
            regproc.Parameters.Add(new SqlParameter("@email", email));
            regproc.Parameters.Add(new SqlParameter("@phone_number", phone));
            regproc.Parameters.Add(new SqlParameter("@userName", username));
            regproc.Parameters.Add(new SqlParameter("@first_name", firstName));
            regproc.Parameters.Add(new SqlParameter("@last_name", lastName));
            regproc.Parameters.Add(new SqlParameter("@semester", semster));
            regproc.Parameters.Add(new SqlParameter("@address", address));
            regproc.Parameters.Add(new SqlParameter("@GPA", gpa));
            regproc.Parameters.Add(new SqlParameter("@birth_date", bd));
            regproc.Parameters.Add(new SqlParameter("@faculty_code", null));
            regproc.Parameters.Add(new SqlParameter("@major_code", majorCode));
            regproc.Parameters.Add(new SqlParameter("@company_name", null));
            regproc.Parameters.Add(new SqlParameter("@representative_name", null));
            regproc.Parameters.Add(new SqlParameter("@representative_email", null));
            regproc.Parameters.Add(new SqlParameter("@country_of_residence", null));


            SqlParameter password = regproc.Parameters.Add("@password", System.Data.SqlDbType.VarChar, 10);
            SqlParameter id = regproc.Parameters.Add("@user_id", System.Data.SqlDbType.Int);

            password.Direction = System.Data.ParameterDirection.Output;
            id.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            regproc.ExecuteNonQuery();
            conn.Close();
            int userid = (int)id.Value;
            String pass = (string)password.Value;
            Response.Redirect("regpass.aspx?userid=" + userid.ToString() + "&password=" + pass.ToString());
        }
    }
}