<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Final_Assignment.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        $(document).ready(function () {
            $('#btnCheck').click(function () {
                var user = $('#ContentPlaceHolder1_txtUser').val();
                if (user == '' || user == undefined) {
                    return alert("please enter username");
                }
                $.ajax({
                    type: "POST",
                    url: "/Ajax.asmx/CheckUser",
                    contentType: "application/json",
                    data: '{ "user" : "' + user + '"}',
                    success: function (data) {
                        var userName = $("#usernameCheck");
                        userName.html(data.d);
                    },
                    error: function (data) {
                        var error = $("#error");
                        $(error).html(data.responseText);
                    }
                });
            });
        });
    </script>
<div id="error">

</div>
    <asp:Label ID="lblresult" runat="server" Text=""></asp:Label>
<div>
    <table>
        <tr>
            <td>
                First Name:
            </td>
            <td>
                <asp:TextBox ID="txtFirstName" runat="server" required="required"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Last Name:
            </td>
            <td>
                <asp:TextBox ID="txtLastName" runat="server" required="required"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Address:
            </td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" required="required"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                City:
            </td>
            <td>
                <asp:TextBox ID="txtCity" runat="server" required="required"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Email:
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" required="required" TextMode="Email"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Username:
            </td>
            <td>
                <asp:TextBox ID="txtUser" runat="server" required="required"></asp:TextBox>
                <input type="submit" id="btnCheck" value="Check user" />
                <span id="usernameCheck" style="color:white;"></span>
            </td>
        </tr>
        <tr>
            <td>
                Password:
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" required="required" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:Button ID="btnSubmit" runat="server" Text="Register" OnClick="btnSubmit_Click"/> 
</div>
</asp:Content>
