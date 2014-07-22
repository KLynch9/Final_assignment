<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Final_Assignment.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Login
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
             <script>
                 $(document).ready(function () {

                     $("#btnForgotPassword").click(function () {

                         var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
                         var email = $("#txtEmail").val();

                         if (!emailRegex.test(email)) {
                             return alert("Email is not in the correct format");
                         }

                         $.ajax({
                             type: "POST",
                             url: "/Ajax.asmx/ForgotPassword",
                             contentType: "application/json",
                             data: "{'email': '" + email + "'}",
                             success: function (data) {
                                 var responseDiv = $("#Response");
                                 responseDiv.html(data.d);
                             },
                             error: function (msg) {
                                 var response = $("#Response");
                                 $(response).html(msg.responseText);
                             }
                         });
                     });
                 });
    </script>
     <div>
    <table>
        <tr>
            <td>
                Username:
            </td>
            <td>
                <asp:TextBox ID="txtUsername" runat="server" required="required"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Password:
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" required="required"></asp:TextBox>
            </td>
        </tr>
    </table>
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
         <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
         <br />
         <h3>Forgot your password?</h3>
         <h4>Enter your email below associated with an account to have your password reset.</h4>
         Email:<input id="txtEmail" type="email" />
         <input id="btnForgotPassword" type="button" value="Send" />
         <div id="Response">

         </div>
    </div>
</asp:Content>
