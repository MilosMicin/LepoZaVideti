<%@ Page Title="" Language="C#" MasterPageFile="~/Glavna.Master" AutoEventWireup="true" CodeBehind="Logovanje.aspx.cs" Inherits="Sajt.Registracija" enableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
		<div>
			<h3>Get in touch with Ecothunder!</h3>
			<p>This website template has been designed by <a href="http://www.freewebsitetemplates.com/">Free Website Templates</a> for you, for free. You can replace all this text with your own text. 
                You can remove any link to our website from this website template, you're free to use this website template without linking back to us. If you're having problems editing this website template, 
                then don't hesitate to ask for help on the <a href="http://www.freewebsitetemplates.com/forum/">Forum</a>.</p>			             				    	
		</div>
        <div>
            <asp:Login ID="Login1" runat="server" MembershipProvider="MojProvajder" VisibleWhenLoggedIn="false">

            </asp:Login>        
	    </div>
    </div>
</asp:Content>
