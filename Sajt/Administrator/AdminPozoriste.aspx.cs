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
    public partial class AdminPozoriste : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string pozoriste = TextBoxPozoriste.Text;

            string konekcioniString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string insertPozoristeStoredProc = "InsertPozoriste";
            SqlConnection sqlConn = new SqlConnection(konekcioniString);
            SqlCommand sqlComm = new SqlCommand(insertPozoristeStoredProc);
            sqlComm.CommandType = CommandType.StoredProcedure;
            sqlComm.Connection = sqlConn;
            sqlComm.Parameters.AddWithValue("@Naziv", pozoriste);
            sqlComm.Parameters.AddWithValue("@Datum", DateTime.Now.ToString("dd.MM.yyyy. HH:mm"));

            try
            {                
                sqlConn.Open();
                sqlComm.ExecuteNonQuery();
                TextBoxPozoriste.Text = String.Empty;
                GridViewPozoriste.DataBind();
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
            finally
            {
                sqlConn.Close();
            }
        }

        protected void GridViewPozoriste_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewPozoriste.EditIndex = e.NewEditIndex;
            
        }

        protected void GridViewPozoriste_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label datum = (Label)GridViewPozoriste.Rows[e.RowIndex].FindControl("LabelDatum");
            e.NewValues["Datum"] = DateTime.Now.ToString("dd.MM.yyyy HH:mm");
        }
    }
}