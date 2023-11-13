using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Configuration;

using System.Web.UI;
using System.Web.UI.WebControls;
using Label = System.Web.UI.WebControls.Label;

namespace GiuBachelorPortal.registration
{
    public partial class toViewThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id =int.Parse(Request.QueryString["id"]);
            string title = Request.QueryString["title"];


            string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewThesis = new SqlCommand("ViewMyThesis", conn);
            viewThesis.CommandType = CommandType.StoredProcedure;

            viewThesis.Parameters.Add(new SqlParameter("@sid", id));
            viewThesis.Parameters.Add(new SqlParameter("@title", title));
            
            

            conn.Open();
            viewThesis.ExecuteNonQuery();
            SqlDataReader rdr = viewThesis.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            while (rdr.Read())
            {

Label s = new Label();
                s.Text = " &nbsp; &nbsp;title:    " + s.Text;
                this.Controls.Add(s);

                string ti = rdr.GetString(rdr.GetOrdinal("Title"));
                Label titl = new Label();
                titl.Text = ti.ToString();
                this.Controls.Add(titl);

                Label s2 = new Label();
                s2.Text = " &nbsp; - &nbsp; deadlind:    "+s2.Text;
                this.Controls.Add(s2);

                DateTime dl = rdr.GetDateTime(rdr.GetOrdinal("Deadline"));
                Label del = new Label();
                del.Text = dl.ToString();
                this.Controls.Add(del);

                Label s3 = new Label();
                s3.Text = " &nbsp; - &nbsp; PDF document:    " + s3.Text;
                this.Controls.Add(s3);

                string pdf = rdr.GetString(rdr.GetOrdinal("PDF_doc"));
                Label pd = new Label();
                pd.Text = ti.ToString();
                this.Controls.Add(pd);

                Label s4 = new Label();
                s4.Text = " &nbsp; - &nbsp; Grade:    " + s4.Text;
                this.Controls.Add(s4);

                Decimal gr = rdr.GetDecimal(rdr.GetOrdinal("total_Grade"));
                Label g = new Label();
                g.Text = gr.ToString();
                this.Controls.Add(g);
            }
            conn.Close();

        }




    }
}