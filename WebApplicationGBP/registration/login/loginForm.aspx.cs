using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GiuBachelorPortal
{
    public partial class loginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            // string em = email;
            // string pass = password.Text;
            string email = Page.Request.Form["email"].ToString();
            string pass = Page.Request.Form["password"].ToString();
            SqlCommand loginproc = new SqlCommand("UserLogin", conn);
            SqlCommand isStudent = new SqlCommand("IsStudent", conn);
            SqlCommand isLecturer = new SqlCommand("IsLecturer", conn);
            SqlCommand isCoordinator = new SqlCommand("IsCoordinator", conn);
            SqlCommand isTA = new SqlCommand("IsTA", conn);
            SqlCommand isExternalExaminer = new SqlCommand("IsExternalExaminer", conn);
            loginproc.CommandType = CommandType.StoredProcedure;
            loginproc.Parameters.Add(new SqlParameter("@email", email));
            loginproc.Parameters.Add(new SqlParameter("@password", pass));

            SqlParameter suc = loginproc.Parameters.Add("@success", System.Data.SqlDbType.Bit);
            SqlParameter id = loginproc.Parameters.Add("@user_id", System.Data.SqlDbType.Int);

            suc.Direction = System.Data.ParameterDirection.Output;
            id.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            loginproc.ExecuteNonQuery();
            conn.Close();
            int userid = (int)id.Value;

            isStudent.CommandType = CommandType.StoredProcedure;
            isStudent.Parameters.Add(new SqlParameter("@id", userid));

            isLecturer.CommandType = CommandType.StoredProcedure;
            isLecturer.Parameters.Add(new SqlParameter("@id", userid));

            isCoordinator.CommandType = CommandType.StoredProcedure;
            isCoordinator.Parameters.Add(new SqlParameter("@id", userid));

            isTA.CommandType = CommandType.StoredProcedure;
            isTA.Parameters.Add(new SqlParameter("@id", userid));

            isExternalExaminer.CommandType = CommandType.StoredProcedure;
            isExternalExaminer.Parameters.Add(new SqlParameter("@id", userid));

            SqlParameter studentsuc = isStudent.Parameters.Add("@success", System.Data.SqlDbType.Bit);
            SqlParameter lecturersuc = isLecturer.Parameters.Add("@success", System.Data.SqlDbType.Bit);
            SqlParameter coordinatorsuc = isCoordinator.Parameters.Add("@success", System.Data.SqlDbType.Bit);
            SqlParameter tasuc = isTA.Parameters.Add("@success", System.Data.SqlDbType.Bit);
            SqlParameter eesuc = isExternalExaminer.Parameters.Add("@success", System.Data.SqlDbType.Bit);



            studentsuc.Direction = System.Data.ParameterDirection.Output;
            lecturersuc.Direction = System.Data.ParameterDirection.Output;
            coordinatorsuc.Direction = System.Data.ParameterDirection.Output;
            tasuc.Direction = System.Data.ParameterDirection.Output;
            eesuc.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            Console.Write("CONNECTED");
            Response.Write("CONNECTED");

            isStudent.ExecuteNonQuery();
            isLecturer.ExecuteNonQuery();
            isCoordinator.ExecuteNonQuery();
            isTA.ExecuteNonQuery();
            isExternalExaminer.ExecuteNonQuery();
            conn.Close();
            Response.Write("SUCCESS: " + suc.Value.ToString());
            if (suc.Value.ToString() == "True")
            {
                if (studentsuc.Value.ToString() == "True")
                {
                    Response.Redirect("student/studentMain.aspx");
                    Console.Write("WELCOME");
                    Response.Write("welcome");
                }
                else if (lecturersuc.Value.ToString() == "True")
                {
                    Response.Redirect("Lecturer/LecturerMain.aspx?userid=" + userid.ToString());
                    // Console.Write("LOGIN FAILED");

                    // Response.Write("login failed");
                }
                else if (tasuc.Value.ToString() == "True")
                {
                    Response.Redirect("taProfile.aspx?userid=" + userid.ToString());

                }
                else if (coordinatorsuc.Value.ToString() == "True")
                {
                    Response.Redirect("coordinatorProfile.aspx?userid=" + userid.ToString());

                }
                else if (eesuc.Value.ToString() == "True")
                {
                    Response.Redirect("eeProfile.aspx?userid=" + userid.ToString());

                }
                else
                {
                    Console.Write("Not avaliable on the system yet");
                }
            }
            else
            {
                Console.Write("LOGIN FAILED");

                Response.Write("login failed");

            }
        }

    }
}