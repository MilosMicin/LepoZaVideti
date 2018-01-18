using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sajt.Administrator
{
    public partial class AdminAnketa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string pitanje = TextBoxPitanje.Text;
            string odgovor1 = TextBoxOdgovor1.Text;
            string odgovor2 = TextBoxOdgovor2.Text;

            string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string sqlProcedure = "InsertAnketa";
            SqlConnection sqlConn = new SqlConnection(konekcijaStr);
            SqlCommand sqlComm = new SqlCommand(sqlProcedure);
            sqlComm.CommandType = CommandType.StoredProcedure;
            sqlComm.Connection = sqlConn;

            try
            {
                sqlComm.Parameters.AddWithValue("@Pitanje", pitanje);
                sqlComm.Parameters.AddWithValue("@Odgovor1", odgovor1);
                sqlComm.Parameters.AddWithValue("@Odgovor2", odgovor2);
                sqlComm.Parameters.AddWithValue("@Datum", DateTime.Now.ToString("dd.MM.yyyy HH:mm"));
                sqlConn.Open();
                sqlComm.ExecuteNonQuery();
                TextBoxPitanje.Text = String.Empty;
                TextBoxOdgovor1.Text = String.Empty;
                TextBoxOdgovor2.Text = String.Empty;
                GridViewAnketa.DataBind();
            }
            catch (Exception)
            {
                
                throw;
            }
            finally
            {
                sqlConn.Close();
            }
        }

        protected void GridViewAnketa_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label datum = (Label)GridViewAnketa.Rows[e.RowIndex].FindControl("LabelDatum");
            e.NewValues["Datum"] = DateTime.Now.ToString("dd.MM.yyyy HH:mm");
        }
    }
}