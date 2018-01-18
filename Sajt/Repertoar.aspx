<%@ Page Title="" Language="C#" MasterPageFile="~/Glavna.Master" AutoEventWireup="true" CodeBehind="Repertoar.aspx.cs" Inherits="Sajt.Repertoar" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content"> 
        <asp:GridView ID="GridViewRepertoar" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="None" AllowPaging="True">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        
                        
                        <table border="1">
                            <tr>
                                <td rowspan="2">
                                    <asp:Image ID="Slika" runat="server" Width="150" ImageUrl='<%# Bind("Slika") %>' /> 
                                </td>
                                <td style="text-align:center">
                                    <b><asp:Label ID="Naziv" runat="server" Text='<%# Bind("Naziv") %>' /></b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Opis" runat="server" Text='<%# Bind("Opis") %>' />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Naziv], [Slika], [Opis] FROM [Predstava]"></asp:SqlDataSource>
    </div>
</asp:Content>
