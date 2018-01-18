<%@ Page Title="" Language="C#" MasterPageFile="~/Glavna.Master" AutoEventWireup="true" CodeBehind="AdminRezervacije.aspx.cs" Inherits="Sajt.Administrator.AdminRezervacije" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <asp:GridView ID="GridViewRezervacije" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceRezervacije">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                <asp:BoundField DataField="Ime" HeaderText="Ime" SortExpression="Ime"></asp:BoundField>
                <asp:BoundField DataField="Prezime" HeaderText="Prezime" SortExpression="Prezime"></asp:BoundField>
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                <asp:TemplateField HeaderText="Pozoriste">
                    <ItemTemplate>
                        <asp:Label ID="Pozoriste" runat="server" Text='<%# Bind("IdPozoriste") %>' Visible="false"></asp:Label><br />
                        <asp:DropDownList ID="DropDownListPozoriste" runat="server" Enabled="false" DataSourceID="SqlDataSourceSelectPozoriste" DataTextField="Naziv" DataValueField="Id"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceSelectPozoriste" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Pozoriste]"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Predstava">
                    <ItemTemplate>
                        <asp:Label ID="Predstava" runat="server" Text='<%# Bind("IdPredstava") %>' Visible="false"></asp:Label><br />
                        <asp:DropDownList ID="DropDownListPredstava" runat="server" Enabled="false" DataSourceID="SqlDataSourceSelectPredstava" DataTextField="Naziv" DataValueField="Id"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceSelectPredstava" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Id], [Naziv] FROM [Predstava]"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceRezervacije" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Prijava] WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [Prijava] ([Ime], [Prezime], [Email], [IdPredstava], [IdPozoriste], [Datum]) VALUES (@Ime, @Prezime, @Email, @IdPredstava, @IdPozoriste, @Datum)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Prijava]" UpdateCommand="UPDATE [Prijava] SET [Ime] = @Ime, [Prezime] = @Prezime, [Email] = @Email, [IdPredstava] = @IdPredstava, [IdPozoriste] = @IdPozoriste, [Datum] = @Datum WHERE [Id] = @original_Id">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Ime" Type="String"></asp:Parameter>
                <asp:Parameter Name="Prezime" Type="String"></asp:Parameter>
                <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                
                <asp:Parameter Name="Datum" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Ime" Type="String"></asp:Parameter>
                <asp:Parameter Name="Prezime" Type="String"></asp:Parameter>
                <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                <asp:Parameter Name="IdPredstava" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="IdPozoriste" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="Datum" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
