using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sajt.Administrator
{
    public partial class AdminKorisnici : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            TextBox tbIme = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxIme");
            TextBox tbPrezime = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxPrezime");
            TextBox tbUserName = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("UserName");
            CheckBoxList cblUloga = (CheckBoxList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("CheckBoxListUloga");

            string konekcijaStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string sqlProcedure = "InsertKorisnik";
            SqlConnection sqlConn = new SqlConnection(konekcijaStr);
            SqlCommand sqlComm = new SqlCommand(sqlProcedure);
            sqlComm.CommandType = CommandType.StoredProcedure;
            sqlComm.Connection = sqlConn;

            try
            {
                MembershipUser mUser = Membership.GetUser(tbUserName.Text);
                if (mUser != null)
                {
                    sqlComm.Parameters.AddWithValue("@Id", mUser.ProviderUserKey);
                    sqlComm.Parameters.AddWithValue("@Ime", tbIme.Text);
                    sqlComm.Parameters.AddWithValue("@Prezime", tbPrezime.Text);
                    sqlConn.Open();
                    sqlComm.ExecuteNonQuery();
                    Roles.AddUserToRole(tbUserName.Text, cblUloga.SelectedValue);
                }
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
    }
}