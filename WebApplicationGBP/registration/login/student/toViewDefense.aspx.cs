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
    public partial class toViewDefense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"]);

            string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewDefense = new SqlCommand("ViewMyDefense", conn);
            viewDefense.CommandType = CommandType.StoredProcedure;

            viewDefense.Parameters.Add(new SqlParameter("@sid", id));

            conn.Open();
            viewDefense.ExecuteNonQuery();
            SqlDataReader rdr = viewDefense.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            while (rdr.Read())
            {

                Label s = new Label();
                s.Text = "&nbsp;&nbsp; location:" + s.Text;
                this.Controls.Add(s);

                string location = rdr.GetString(rdr.GetOrdinal("location"));
                Label l = new Label();
                l.Text = location.ToString();
                this.Controls.Add(l);

                Label s2 = new Label();
                s2.Text = "&nbsp; - &nbsp; content:" + s2.Text;
                this.Controls.Add(s2);

                string content = rdr.GetString(rdr.GetOrdinal("Content"));
                Label co = new Label();
                co.Text = content.ToString();
                this.Controls.Add(co);

                Label s3 = new Label();
                s3.Text = "&nbsp; - &nbsp; time:" + s3.Text;
                this.Controls.Add(s3);

                TimeSpan time = rdr.GetTimeSpan(rdr.GetOrdinal("Time"));
                Label h = new Label();
                h.Text = time.ToString();
                this.Controls.Add(h);

                Label s4 = new Label();
                s4.Text = "&nbsp; - &nbsp; date:" + s4.Text;
                this.Controls.Add(s4);

                DateTime dl = rdr.GetDateTime(rdr.GetOrdinal("Date"));
                Label del = new Label();
                del.Text = dl.ToString();
                this.Controls.Add(del);

                Label s5 = new Label();
                s5.Text = "&nbsp; - &nbsp; grade:" + s5.Text;
                this.Controls.Add(s5);

                Decimal gr = rdr.GetDecimal(rdr.GetOrdinal("total_Grade"));
                Label g = new Label();
                g.Text = gr.ToString();
                this.Controls.Add(g);

            }

        }
    }
}