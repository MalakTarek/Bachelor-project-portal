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
    public partial class toViewBooked : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"]);
            int m_id = int.Parse(Request.QueryString["mid"]);

            string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewB = new SqlCommand("ViewMeeting", conn);
            viewB.CommandType = CommandType.StoredProcedure;

            viewB.Parameters.Add(new SqlParameter("@sid", id));
            viewB.Parameters.Add(new SqlParameter("@meeting_id", m_id));
            
            conn.Open();
            viewB.ExecuteNonQuery();
            SqlDataReader rdr = viewB.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                Label se = new Label();
                se.Text = "&nbsp; &nbsp; Meeting ID:" + se.Text;
                this.Controls.Add(se);

                int mid = rdr.GetInt32(rdr.GetOrdinal("Meeting_ID"));
                Label m2 = new Label();
                m2.Text = mid.ToString();
                this.Controls.Add(m2);

                Label ss = new Label();
                ss.Text = "&nbsp; - &nbsp; Lecturer ID:" + ss.Text;
                this.Controls.Add(ss);

                int lid = rdr.GetInt32(rdr.GetOrdinal("L_id"));
                Label l = new Label();
                l.Text = lid.ToString();
                this.Controls.Add(l);

                Label s3 = new Label();
                s3.Text = "&nbsp; - &nbsp; Start time:" + s3.Text;
                this.Controls.Add(s3);

                TimeSpan time = rdr.GetTimeSpan(rdr.GetOrdinal("STime"));
                Label h = new Label();
                h.Text = time.ToString();
                this.Controls.Add(h);

                Label s2 = new Label();
                s2.Text = "&nbsp; - &nbsp; End time:" + s2.Text;
                this.Controls.Add(s2);

                TimeSpan time2 = rdr.GetTimeSpan(rdr.GetOrdinal("ETime"));
                Label h2 = new Label();
                h2.Text = time2.ToString();
                this.Controls.Add(h2);

                Label s = new Label();
                s.Text = "&nbsp; - &nbsp; Duration:" + s.Text;
                this.Controls.Add(s);

                int du = rdr.GetInt32(rdr.GetOrdinal("Duration"));
                Label u = new Label();
                u.Text = du.ToString();
                this.Controls.Add(u);

                Label s4 = new Label();
                s4.Text = "&nbsp; - &nbsp; date:" + s4.Text;
                this.Controls.Add(s4);

                DateTime dl = rdr.GetDateTime(rdr.GetOrdinal("Date"));
                Label del = new Label();
                del.Text = dl.ToString();
                this.Controls.Add(del);

                Label s5 = new Label();
                s5.Text = "&nbsp; - &nbsp; Meeting Point:" + s5.Text;
                this.Controls.Add(s5);

                string mp = rdr.GetString(rdr.GetOrdinal("Meeting_Point"));
                Label m = new Label();
                m.Text = mp.ToString();
                this.Controls.Add(m);

                Label sd = new Label();
                sd.Text = "&nbsp; - &nbsp; To do list:" + sd.Text;
                this.Controls.Add(sd);

                string dol = rdr.GetString(rdr.GetOrdinal("ToDoList"));
                Label d = new Label();
                d.Text = dol.ToString();
                this.Controls.Add(d);

            }
            conn.Close();
        }
    }
}