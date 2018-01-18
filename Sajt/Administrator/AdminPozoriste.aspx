<%@ Page Title="" Language="C#" MasterPageFile="~/Glavna.Master" AutoEventWireup="true" CodeBehind="AdminPozoriste.aspx.cs" Inherits="Sajt.Administrator.AdminPozoriste" enableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 127px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <div>
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style1">Naziv pozorista:</td>
                    <td>
                        <asp:TextBox ID="TextBoxPozoriste" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
              
            </table>          
        </div>

        <asp:GridView ID="GridViewPozoriste" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceGridViewPozoriste" OnRowEditing="GridViewPozoriste_RowEditing" OnRowUpdating="GridViewPozoriste_RowUpdating">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv" />
                <asp:TemplateField HeaderText="Datum unosa">
                    <ItemTemplate>
                        <asp:Label ID="LabelDatum" runat="server" Text='<%# Bind("Datum") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceGridViewPozoriste" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Pozoriste] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Pozoriste] ([Naziv], [Datum]) VALUES (@Naziv, @Datum)" SelectCommand="SELECT * FROM [Pozoriste]" UpdateCommand="UPDATE [Pozoriste] SET [Naziv] = @Naziv, [Datum] = @Datum WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Naziv" Type="String"></asp:Parameter>
                <asp:Parameter Name="Datum" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Naziv" Type="String"></asp:Parameter>
                <asp:Parameter Name="Datum" Type="String"></asp:Parameter>
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
