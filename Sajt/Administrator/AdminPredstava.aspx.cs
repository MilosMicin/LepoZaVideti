using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sajt.Administrator
{
    public partial class AdminPredstava : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string uploadFolder = Server.MapPath("~/images/upload/");
            if(FileUploadSlikaPredstava.HasFile)
            {
                string naziv = TextBoxNaziv.Text;
                int pozoriste = Int32.Parse(DropDownListPozoriste.SelectedValue);
                string opis = TextBoxOpis.Text;
                string nazivFajla = FileUploadSlikaPredstava.PostedFile.FileName;
                string novoIme = String.Format("{0}_{1}", DateTime.Now.ToString("ddMMyyyy"), nazivFajla);
                string tipFajla = FileUploadSlikaPredstava.PostedFile.ContentType;
                int velicina = FileUploadSlikaPredstava.PostedFile.ContentLength;

                string konekcioniString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string insertPredstavaStoredProc = "InsertPredstava";
                SqlConnection sqlConn = new SqlConnection(konekcioniString);
                SqlCommand sqlComm = new SqlCommand(insertPredstavaStoredProc);
                sqlComm.CommandType = CommandType.StoredProcedure;
                sqlComm.Connection = sqlConn;
                try
                {
                    FileUploadSlikaPredstava.SaveAs(uploadFolder + novoIme);
                    sqlComm.Parameters.AddWithValue("@Naziv", naziv);
                    sqlComm.Parameters.AddWithValue("@Slika", "~/images/upload/" + novoIme);
                    sqlComm.Parameters.AddWithValue("@Opis", opis);
                    sqlComm.Parameters.AddWithValue("@IdPozoriste", pozoriste);
                    sqlComm.Parameters.AddWithValue("@Datum", DateTime.Now.ToString("dd.MM.yyyy. HH:mm"));
                    sqlConn.Open();
                    sqlComm.ExecuteNonQuery();
                    TextBoxNaziv.Text = String.Empty;
                    TextBoxOpis.Text = String.Empty;
                    DropDownListPozoriste.SelectedValue = "0";
                    GridViewPredstava.DataBind();
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

        protected void GridViewPredstava_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewPredstava.EditIndex = e.NewEditIndex;
        }

        protected void GridViewPredstava_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string uploadFolder = Server.MapPath("~/images/upload/");
            FileUpload novaSlika = (FileUpload)GridViewPredstava.Rows[e.RowIndex].FindControl("FileUploadSlikaEdit");
            Image predhodnaSlika = (Image)GridViewPredstava.Rows[e.RowIndex].FindControl("Slika");
            if(novaSlika != null && novaSlika.HasFile)
            {
                string staraSlika = predhodnaSlika.ImageUrl;
                FileInfo podaciOFajlu = new FileInfo(Server.MapPath(staraSlika));
                if (podaciOFajlu.Exists) 
                {
                    File.Delete(Server.MapPath(staraSlika)); 
                }
                string imeFajla = novaSlika.PostedFile.FileName;
                string novoIme = String.Format("{0}_{1}", DateTime.Now.ToString("ddMMyyyy"), imeFajla);
                novaSlika.SaveAs(uploadFolder + novoIme);
                e.NewValues["Slika"] = "~/images/upload/" + novoIme;
            }
            else
            {
                e.NewValues["Slila"] = predhodnaSlika.ImageUrl;
            }

            DropDownList listaPozoriste = (DropDownList)GridViewPredstava.Rows[e.RowIndex].FindControl("DropDownListP");
            e.NewValues["IdPozoriste"] = listaPozoriste.SelectedValue;

            Label datum = (Label)GridViewPredstava.Rows[e.RowIndex].FindControl("LabelDatum");
            e.NewValues["Datum"] = DateTime.Now.ToString("dd.MM.yyyy HH:mm");
        }

        protected void GridViewPredstava_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Image Slika = (Image)GridViewPredstava.Rows[e.RowIndex].FindControl("Slika");
            string staraSlika = Slika.ImageUrl;
            FileInfo podaciOFajlu = new FileInfo(Server.MapPath(staraSlika));
            if(podaciOFajlu.Exists)
            {
                File.Delete(Server.MapPath(staraSlika));
            }
        }

        protected void GridViewPredstava_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Label idPozoriste = (Label)e.Row.FindControl("LabelIdPozoriste");
            DropDownList ddlPozoriste = (DropDownList)e.Row.FindControl("DropDownListP");
            if (idPozoriste != null && ddlPozoriste != null)
            {
                ddlPozoriste.Items.FindByValue(idPozoriste.Text).Selected = true;
            }
        }


    }
}