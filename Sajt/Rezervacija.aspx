<%@ Page Title="" Language="C#" MasterPageFile="~/Glavna.Master" AutoEventWireup="true" CodeBehind="Rezervacija.aspx.cs" Inherits="Sajt.Rezervacija" enableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 86px;
        }
        .auto-style2 {
            width: 199px;
        }
        .auto-style3 {
            width: 279px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1">Ime:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBoxIme" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style3">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxIme" ErrorMessage="Unos imena je obavezaan" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBoxIme" ErrorMessage="Ime mora poceti velikim slovom" ValidationExpression="^[A-Z]{1}[a-z]{2,40}$" ForeColor="Red">Unesite ime</asp:RegularExpressionValidator>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Prezime:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBoxPrezime" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style3">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPrezime" ErrorMessage="Unos prezimena je obavezaan" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxPrezime" ErrorMessage="Prezime mora poceti velikim slovom" ValidationExpression="^[A-Z]{1}[a-z]{2,40}$" ForeColor="Red">Unesite prezime</asp:RegularExpressionValidator>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Email:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style3">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Unos emaila je obavezaan" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Unesite pravilno email adresu" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Unesite email</asp:RegularExpressionValidator>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Pozoriste:</td>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td class="auto-style3">
                        Predstava</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:DropDownList ID="DropDownListIzaberiPozoriste" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSourcePozoriste" DataTextField="Naziv" DataValueField="Id" AutoPostBack="True">
                            <asp:ListItem Value="0" Text="Izaberite..." />
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourcePozoriste" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Pozoriste]"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownListIzaberiPozoriste" Text="*" ErrorMessage="Obavezno" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style3">
                        <asp:RadioButtonList ID="RadioButtonListIzaberiPredstavu" runat="server" DataSourceID="SqlDataSourcePredstava" DataTextField="Naziv" DataValueField="Id"></asp:RadioButtonList>
                        <asp:SqlDataSource ID="SqlDataSourcePredstava" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="UslovPozoriste" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListIzaberiPozoriste" PropertyName="SelectedValue" Name="paramUslov" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </td>
                    
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td class="auto-style3" >
                        
                    </td>
                    <td>
                        <asp:Button ID="ButtonUnesi" runat="server" Text="Button" OnClick="ButtonUnesi_Click" /></td>
                </tr>
            </table>
        </div>
        <div id ="Prikaz" runat="server">
        </div>
        <div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        </div>
    </div>
</asp:Content>
