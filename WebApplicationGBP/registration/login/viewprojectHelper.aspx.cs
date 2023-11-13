using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace WebApplicationGBP.registration.login
{
    public partial class viewprojectHelper : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
        StringBuilder table = new StringBuilder();
        string type = Request.QueryString["Type"];
        int id = int.Parse(Request.QueryString["ID"]);
        
        string connStr = WebConfigurationManager.ConnectionStrings["GBP"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand viewProject= new SqlCommand("ViewBachelorProjects", conn);
            viewProject.CommandType = System.Data.CommandType.StoredProcedure;
            viewProject.Parameters.Add(new SqlParameter("@ProjectType", type));
            viewProject.Parameters.Add(new SqlParameter("@User_id", id));
            conn.Open();
            SqlDataReader rdr = viewProject.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            table.Append("<table border = '1'>");
            table.Append("<tr><th>Project code</th><th>id1</th><th>id2</th><th>id3</th>");
            table.Append("</tr>");
            while (rdr.Read())
            {
                table.Append("<tr>");
                table.Append("<tr>");

                table.Append("<td>" + rdr[0] + "</td>");

                table.Append("<td>" + rdr[1] + "</td>");

                table.Append("<td>" + rdr[2] + "</td>");

                table.Append("<td>" + rdr[3] + "</td>");

                

                table.Append("</tr");
                table.Append("</tr");
            }
            table.Append("/table");
            this.Controls.Add(new Literal { Text = table.ToString() });
            rdr.Close();

        }
    }
}