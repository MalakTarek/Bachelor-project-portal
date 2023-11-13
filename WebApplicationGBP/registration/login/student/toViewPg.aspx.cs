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
    public partial class toViewPg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"]);
            DateTime date = DateTime.Parse(Request.QueryString["date"]);


            string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewPG = new SqlCommand("ViewMyProgressReports", conn);
            viewPG.CommandType = CommandType.StoredProcedure;

            viewPG.Parameters.Add(new SqlParameter("@sid", id));
            viewPG.Parameters.Add(new SqlParameter("@date", date));

            conn.Open();
            viewPG.ExecuteNonQuery();
            SqlDataReader rdr = viewPG.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                Label n = new Label();
                n.Text = "&nbsp; &nbsp; content :" + n.Text;
                this.Controls.Add(n);

                string content = rdr.GetString(rdr.GetOrdinal("Content"));
                Label co = new Label();
                co.Text = content.ToString();
                this.Controls.Add(co);

                Label s = new Label();
                s.Text = "&nbsp; - &nbsp; grade :"+s.Text;
                this.Controls.Add(s);   

                Decimal gr = rdr.GetDecimal(rdr.GetOrdinal("grade"));
                Label g = new Label();
                g.Text = gr.ToString();
                this.Controls.Add(g);

                Label s2 = new Label();
                s2.Text = "&nbsp; - &nbsp; Date :" + s2.Text;
                this.Controls.Add(s2);

                DateTime dl = rdr.GetDateTime(rdr.GetOrdinal("Date"));
                Label del = new Label();
                del.Text = dl.ToString();
                this.Controls.Add(del);

                Label s3 = new Label();
                s3.Text = "&nbsp; - &nbsp; UpdatingUserID : " + s3.Text;
                this.Controls.Add(s3);

                int uID = rdr.GetInt32(rdr.GetOrdinal("UpdatingUser_id"));
                Label uid = new Label();
                uid.Text = uID.ToString();
                this.Controls.Add(uid);

                Label s4 = new Label();
                s4.Text = "&nbsp; -&nbsp; ComulativeProgressReportGrade :" + s4.Text;
                this.Controls.Add(s4);

                Decimal Cgr = rdr.GetDecimal(rdr.GetOrdinal("ComulativeProgressReportGrade"));
                Label cg = new Label();
                cg.Text = Cgr.ToString();
                this.Controls.Add(cg);

            }
            conn.Close();
        }
    }
}