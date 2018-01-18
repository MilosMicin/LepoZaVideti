using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sajt
{
    public partial class Rezervacija : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonUnesi_Click(object sender, EventArgs e)
        {
            string ime = TextBoxIme.Text;
            string prezime = TextBoxPrezime.Text;
            string email = TextBoxEmail.Text;
            int pozoriste = Int32.Parse(DropDownListIzaberiPozoriste.SelectedValue);
            int predstava = Int32.Parse(RadioButtonListIzaberiPredstavu.SelectedValue);

            string konekcioniString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string insertPredstavaStoredProc = "InsertPrijava";
            SqlConnection sqlConn = new SqlConnection(konekcioniString);
            SqlCommand sqlComm = new SqlCommand(insertPredstavaStoredProc);
            sqlComm.CommandType = CommandType.StoredProcedure;
            sqlComm.Connection = sqlConn;

            try
            {
                sqlComm.Parameters.AddWithValue("@Ime", ime);
                sqlComm.Parameters.AddWithValue("@Prezime", prezime);
                sqlComm.Parameters.AddWithValue("@Email", email);
                sqlComm.Parameters.AddWithValue("@IdPredstava", predstava);
                sqlComm.Parameters.AddWithValue("@IdPozoriste", pozoriste);
                sqlComm.Parameters.AddWithValue("@Datum", DateTime.Now.ToString("dd.MM.yyyy HH:mm"));
                sqlConn.Open();
                sqlComm.ExecuteNonQuery();
                Prikaz.InnerHtml = String.Format("{0} {1} je uspesno rezervisao kartu ", ime, prezime);
                TextBoxIme.Text = String.Empty;
                TextBoxPrezime.Text = String.Empty;
                TextBoxEmail.Text = String.Empty;
                DropDownListIzaberiPozoriste.SelectedValue = "0";
                RadioButtonListIzaberiPredstavu.SelectedValue = null;

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
    }
}