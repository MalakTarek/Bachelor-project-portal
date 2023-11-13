using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GBP.Lecturer
{
    public partial class LecturerMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int userid = int.Parse(Request.QueryString["userid"]);
            // int userid = (int)userid.ToString();
            string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            //int id = 1;
            SqlCommand viewProfile = new SqlCommand("ViewProfile", conn);
            viewProfile.CommandType = System.Data.CommandType.StoredProcedure;
            viewProfile.Parameters.Add(new SqlParameter("@user_id", userid));
            conn.Open();
            SqlDataReader rdr = viewProfile.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            //string meow = "Meow";
            //Label ok = new Label();
            // ok.Text= meow;

            //ok. = new Point(222, 90);
            //ok.AutoSize = true;
            // ok.Font = new Font("Calibri", 18);
            // ok.BorderStyle = BorderStyle.Solid;
            // ok.ForeColor = Color.Green;
            // ok.Padding = new Padding(6);

            // Adding this control to the form
            //  this.Controls.Add(ok);
            while (rdr.Read())
            {
                String username = rdr.GetString(rdr.GetOrdinal("UserName"));
                Label Username = new Label();
                String role = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
               // string s = "  ";
                int serid = rdr.GetInt32(rdr.GetOrdinal("user_id"));

                Label Role = new Label();
                Label Userid = new Label();

                // Label runat = "server" style = "font-size:45px ;font-weight: bold; color:black; opacity: 1; -webkit-text-stroke: 1px white; margin-top:-10px" > 
                Role.Text = role;
                Userid.Text = serid.ToString();
                Username.Text = username;
               // Username.BorderStyle = BorderStyle.Solid;
               // Userid.BorderStyle = BorderStyle.Solid;
                Userid.ForeColor = Color.Black;
                Username.ForeColor = Color.Black;
                // Role = new Point(x:0, y:2);
                this.Controls.Add(Username);
                this.Controls.Add(Role);
                this.Controls.Add(Userid);
            }
            //   UserLabel.Text = Session["Username"].ToString();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerCreateLocalProject.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("SpecifyThesisDeadline.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
              Response.Redirect("Supervise.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
             Response.Redirect("LecCreatePR.aspx");
        }
        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("/registration/login/ViewBachelorProjects.aspx");
        }

    }
}
