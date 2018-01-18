<%@ Page Title="" Language="C#" MasterPageFile="~/Glavna.Master" AutoEventWireup="true" CodeBehind="Anketa.aspx.cs" Inherits="Sajt.Anketa" enableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <asp:GridView ID="GridViewAnketa" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceGridViewAnketa" GridLines="None">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        
                        <table border="1">
                            <tr>
                                <td>
                                    <asp:Label ID="LabelPitanja" runat="server" Text='<%# Bind("Pitanja") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="RadioButtonOdgovor1" runat="server" Text='<%# Bind("Odgovor") %>' GroupName="odgovor" /><br />
                                    <asp:RadioButton ID="RadioButtonOdgovor2" runat="server" Text='<%# Bind("Odgovor2") %>' GroupName="odgovor"/>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="ButtonUnosOdgovora" runat="server" Text="Odgovor" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceGridViewAnketa" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Pitanja], [Odgovor], [Odgovor2], [Id] FROM [Anketa]"></asp:SqlDataSource>
    </div>
</asp:Content>
