<%@ Page Title="" Language="C#" MasterPageFile="~/Glavna.Master" AutoEventWireup="true" CodeBehind="AdminAnketa.aspx.cs" Inherits="Sajt.Administrator.AdminAnketa" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 109px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <div>
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style1">Pitanje:</td>
                    <td>
                        <asp:TextBox ID="TextBoxPitanje" runat="server" TextMode="MultiLine" Height="50px" Width="233px"></asp:TextBox>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style1">Odgovor1:</td>
                    <td>
                        <asp:TextBox ID="TextBoxOdgovor1" runat="server"></asp:TextBox>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style1">Odgovor2:</td>
                    <td>
                        <asp:TextBox ID="TextBoxOdgovor2" runat="server"></asp:TextBox>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                    </td>
                    
                </tr>
            </table>
        </div>

        <asp:GridView ID="GridViewAnketa" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceGridViewAnketa" OnRowUpdating="GridViewAnketa_RowUpdating">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                <asp:BoundField DataField="Pitanja" HeaderText="Pitanja" SortExpression="Pitanja"></asp:BoundField>
                <asp:BoundField DataField="Odgovor" HeaderText="Odgovor" SortExpression="Odgovor"></asp:BoundField>
                <asp:BoundField DataField="Odgovor2" HeaderText="Odgovor2" SortExpression="Odgovor2"></asp:BoundField>
                <asp:TemplateField HeaderText="Datum">
                    <ItemTemplate>
                        <asp:Label ID="LabelDatum" runat="server" Text='<%# Bind("Datum") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceGridViewAnketa" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Anketa] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Anketa] ([Pitanja], [Odgovor], [Odgovor2], [Datum]) VALUES (@Pitanja, @Odgovor, @Odgovor2, @Datum)" SelectCommand="SELECT * FROM [Anketa]" UpdateCommand="UPDATE [Anketa] SET [Pitanja] = @Pitanja, [Odgovor] = @Odgovor, [Odgovor2] = @Odgovor2, [Datum] = @Datum WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Pitanja" Type="String"></asp:Parameter>
                <asp:Parameter Name="Odgovor" Type="String"></asp:Parameter>
                <asp:Parameter Name="Odgovor2" Type="String"></asp:Parameter>
                <asp:Parameter Name="Datum" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Pitanja" Type="String"></asp:Parameter>
                <asp:Parameter Name="Odgovor" Type="String"></asp:Parameter>
                <asp:Parameter Name="Odgovor2" Type="String"></asp:Parameter>
                <asp:Parameter Name="Datum" Type="String"></asp:Parameter>
                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
