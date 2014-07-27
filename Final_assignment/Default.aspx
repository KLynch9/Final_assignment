<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Final_Assignment.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    Home    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="js/default.js"></script>
	  <div id="content">
        <div class="content_item">
		  <h1>Welcome To The Chestermere Zoo Website</h1> 
          <p>Today at the zoo.</p> 
            To get your weather for today type your zip code below.<br />
            <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
            <asp:Button ID="btnGetWeather" runat="server" Text="Get Temp" OnClick="btnGetWeather_Click" /><br />
            <asp:Label ID="lblWeather" runat="server" Text="" ForeColor="White"></asp:Label><br />    
            <asp:Label ID="lblCity" runat="server" Text="" ForeColor="White"></asp:Label><br />   
             <asp:Image ID="imgWeather" runat="server" />
            				 
		  <div class="content_imagetext">              
		    <div class="content_image">                
		      <img src="images/image1.jpg" alt="image1"/>                
	        </div>               		  
              <p id="welcomeText"></p>
		  </div><!--close content_imagetext-->	
          <div class="content_container">
		    <p id="featuredAnimals"></p>
		  	<div class="button_small">
		      <a href="Animals.aspx">Read more</a>
		    </div><!--close button_small-->
		  </div><!--close content_container-->
          <div class="content_container">
		    <p id="tix"></p>          
		  	<div class="button_small">
		      <a href="#">Read more</a>
		    </div><!--close button_small-->		  
		  </div><!--close content_container-->			  
		</div><!--close content_item-->
      </div><!--close content-->   
    
</asp:Content>
