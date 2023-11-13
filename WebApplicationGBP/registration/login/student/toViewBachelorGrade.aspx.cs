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
    public partial class toViewBachelorGrade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"]);

            string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewBG = new SqlCommand("ViewMyBachelorProjectGrade", conn);
            viewBG.CommandType = CommandType.StoredProcedure;

            viewBG.Parameters.Add(new SqlParameter("@sid", id));

            conn.Open();
            viewBG.ExecuteNonQuery();
            SqlDataReader rdr = viewBG.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            while (rdr.Read())
            { 

                Label s5 = new Label();
                s5.Text = "&nbsp; &nbsp; grade:" + s5.Text;
                this.Controls.Add(s5);

                Decimal gr = rdr.GetDecimal(rdr.GetOrdinal("TotalBachelorGrade"));
                Label g = new Label();
                g.Text = gr.ToString();
                this.Controls.Add(g);

            }
        }
    }
}