<%@ Page Title="" Language="C#" MasterPageFile="~/Glavna.Master" AutoEventWireup="true" CodeBehind="Administrator.aspx.cs" Inherits="Sajt.Administrator.Administrator" enableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 164px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <div>
            <table style="width: 100%;">
            <tr>
                <td class="auto-style1">
                    <span>
                        <a href="AdminKorisnici.aspx">Korisnici</a>
                    </span>
                </td>
                <td class="auto-style1">
                    <span>
                        <a href="AdminPozoriste.aspx">Pozorista</a>
                    </span>
                </td>
                <td class="auto-style1">
                    <span>
                        <a href="AdminPredstava.aspx">Predstave</a>
                    </span>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <span>
                        <a href="AdminRezervacije.aspx">Rezervacije</a>
                    </span>
                </td>
                <td class="auto-style1">
                    <span>
                        <a href="AdminAnketa.aspx">Anketa</a>
                    </span>
                </td>
                <td class="auto-style1">
                    <span>
                        <a href="Student.aspx">O studentu</a>
                    </span>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        </div>
    </div>
</asp:Content>
