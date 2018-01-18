<%@ Page Title="" Language="C#" MasterPageFile="~/Glavna.Master" AutoEventWireup="true" CodeBehind="AdminPredstava.aspx.cs" Inherits="Sajt.Administrator.AdminPredstava" enableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 113px;
        }
        .auto-style2 {
            width: 314px;
        }
        .auto-style3 {
            width: 113px;
            height: 94px;
        }
        .auto-style4 {
            width: 314px;
            height: 94px;
        }
        .auto-style5 {
            height: 94px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <div>

            <table style="width:100%;">
                <tr>
                    <td class="auto-style1">Naziv:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBoxNaziv" runat="server"></asp:TextBox>
                    </td>
                    <td>Pozorište:</td>
                </tr>
                <tr>
                    <td class="auto-style1">Slika:</td>
                    <td class="auto-style2">
                        <asp:FileUpload ID="FileUploadSlikaPredstava" runat="server" />
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListPozoriste" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSourceListaPozorista" DataTextField="Naziv" DataValueField="Id">
                            <asp:ListItem Value="0" Text="Izaberi" />
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceListaPozorista" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Pozoriste]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Opis predstave:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBoxOpis" runat="server" TextMode="MultiLine" Height="62px" Width="294px"></asp:TextBox>
                    </td>
                    <td class="auto-style5"></td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        &nbsp;</td>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Unesi" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>

        </div>
        
            <asp:GridView ID="GridViewPredstava" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowEditing="GridViewPredstava_RowEditing" OnRowUpdating="GridViewPredstava_RowUpdating" OnRowDeleting="GridViewPredstava_RowDeleting" OnRowDataBound="GridViewPredstava_RowDataBound" AllowPaging="True" DataSourceID="SqlDataSourceGridViewPredstava">
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id" Visible="False"></asp:BoundField>
                    <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv"></asp:BoundField>
                    <asp:TemplateField HeaderText="Slika">
                        <ItemTemplate>
                            <asp:Image ID="Slika" runat="server" width="80" ImageUrl='<%# Bind("Slika") %>'/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Image ID="Slika" runat="server" width="80" ImageUrl='<%# Bind("Slika") %>'/>
                            <asp:FileUpload ID="FileUploadSlikaEdit" runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis"></asp:BoundField>
                    
                    <asp:TemplateField HeaderText="Pozoriste">
                        <ItemTemplate>
                            <asp:Label ID="LabelIdPozoriste" runat="server" Text='<%# Bind("IdPozoriste") %>' Visible="false" ></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownListP" runat="server" AppendDataBoundItems="true" Enabled="false" DataSourceID="SqlDataSourceListaPozoristeEdit" DataTextField="Naziv" DataValueField="Id" >
                                <asp:ListItem Value="0" Text="Izaberi..." />
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceListaPozoristeEdit" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Pozoriste]"></asp:SqlDataSource>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="LabelIdPozoriste" runat="server" Text='<%# Bind("IdPozoriste") %>' Visible="false" ></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownListP" runat="server" AppendDataBoundItems="true"  DataSourceID="SqlDataSourceListaPozoristeEdit" DataTextField="Naziv" DataValueField="Id">
                                <asp:ListItem Value="0" Text="Izaberi..." />
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceListaPozoristeEdit" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Pozoriste]"></asp:SqlDataSource>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="LabelDatum" runat="server" Text='<%# Bind("Datum") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceGridViewPredstava" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Predstava] WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [Predstava] ([Naziv], [Slika], [Opis], [IdPozoriste], [Datum]) VALUES (@Naziv, @Slika, @Opis, @IdPozoriste, @Datum)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Predstava]" UpdateCommand="UPDATE [Predstava] SET [Naziv] = @Naziv, [Slika] = @Slika, [Opis] = @Opis, [IdPozoriste] = @IdPozoriste, [Datum] = @Datum WHERE [Id] = @original_Id">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Naziv" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Slika" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Opis" Type="String"></asp:Parameter>
                    <asp:Parameter Name="IdPozoriste" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Datum" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Naziv" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Slika" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Opis" Type="String"></asp:Parameter>
                    <asp:Parameter Name="IdPozoriste" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Datum" Type="String"></asp:Parameter>
                    <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        
    </div>
</asp:Content>
