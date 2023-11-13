﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GBP.registration.login.Lecturer
{
    public partial class LecGradePR : System.Web.UI.Page
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
            string s = SID.Text;
            int sid = int.Parse(s);
            DateTime date = DateTime.Parse(Date.Text);
            Decimal grade = Decimal.Parse(Grade.Text);
            SqlCommand gradepro = new SqlCommand("LecGradePR", conn);
            gradepro.CommandType = CommandType.StoredProcedure;
            gradepro.Parameters.Add(new SqlParameter("@Lecturer_id", id));
            gradepro.Parameters.Add(new SqlParameter("@sid", sid));
            gradepro.Parameters.Add(new SqlParameter("@date", date));
            gradepro.Parameters.Add(new SqlParameter("@lecturer_grade", grade));
            conn.Open();
            gradepro.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("Grading.aspx");

        }
    }
}