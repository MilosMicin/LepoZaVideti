<%@ Page Title="" Language="C#" MasterPageFile="~/Glavna.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Sajt.Index" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
		<div id="section">
			<div>
				<h1>Earth-friendly!</h1>
				<p>This website template has been designed by <a href="http://www.freewebsitetemplates.com/">Free Website Templates</a> for you, for free. You can replace all this text with your own text. You can remove any link to our website from this website template, you're free to use this website template without linking back to us. If you're having problems editing this website template, then don't hesitate to ask for help on the <a href="http://www.freewebsitetemplates.com/forum/">Forum</a>.</p>
				<span>
					<a class="first" href="Register.aspx">Registrujte se</a>
                    <asp:LoginStatus ID="LoginStatus" runat="server" LoginText="Ulogujte se" LogoutText="Izlogujte se"/>   
					<%--<a href="Login.aspx">Ulogujte se</a>--%>
				</span>
			</div>
			<div id="figure">
				<img src="images/slika1.jpg"  />
				<span></span>
			</div>
			<%--<span class="background"></span>--%>
		</div>
		<div id="featured">
			<ul>
				<li class="first">     
                    <div class="slajd">
					    <img src="images/min-pozoriste.jpg" class="prvi"/>   
                        <img src="images/min-pozoriste2.jpg" />
                        <img src="images/min-pozoriste3.jpg" />
                    </div>                                 
					    <span></span>
					    <p>Lorem ipsum dolor sit amet,consectetur adipiscing elit. Cras lectus felis, auctor quis imperdiet vel, tempor non neque. Proin sed sapien quis magna lobortis</p>
					    <a class="link" href="powerearth.html">The power of Earth</a>                   
				</li>
				<li class="first">
					<div class="slajd">
					    <img src="images/min-gluma.jpg" alt="Image" class="drugi"/>   
                        <img src="images/min-gluma2.jpg" alt="Image"/>
                        <img src="images/min-gluma3.jpg" alt="Image"/>
                    </div> 
					<span></span>
					<p>Lorem ipsum dolor sit amet,consectetur adipiscing elit. Cras lectus felis, auctor quis imperdiet vel, tempor non neque. Proin sed sapien quis magna lobortis</p>
					<a class="link" href="earthmad.html">Earth No Mad</a>
				</li>
				<li class="first">
					<div class="slajd">
					    <img src="images/min-publika.jpg" alt="Image" class="treci"/>   
                        <img src="images/min-publika2.jpg" alt="Image"/>
                        <img src="images/min-publika3.jpg" alt="Image"/>
                    </div>
					<span></span>
					<p>Lorem ipsum dolor sit amet,consectetur adipiscing elit. Cras lectus felis, auctor quis imperdiet vel, tempor non neque. Proin sed sapien quis magna lobortis</p>
					<a class="link" href="osmosisbeats.html">Osmosis Beats</a>
				</li>
			</ul>
		</div>
	</div>
</asp:Content>
