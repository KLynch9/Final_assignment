<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Final_Assignment.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="initialContent">
        <div id="gridview" style="width:650px">
            <h1>Welcome Admin</h1>
                <asp:UpdatePanel runat="server" ID="updatePanelAdmin" ChildrenAsTriggers="true">
                    <ContentTemplate>
                        <asp:GridView ID="gvUsers" runat="server" >

                        </asp:GridView>
                        <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
        </div>
        <!--end Gridview div-->
        <div id="adminAccess">
            <p>Allow user Admin access:</p>
            <select id="ddlUsers"></select>
            <input id="btnAddAdmin" type="submit" value="Add Admin" />
        </div><!--end admin div-->
    </div><!--end initialContent-->
    <div id="Edit">
        To Edit Webpage text click here <input id="btnEditText" type="button" value="Edit" />
    </div><!--end edit-->
    <div id="webEdits" style="display:none">
        <table> 
            <tr>
                <td>
                    Choose Which Paragraph To Edit: <select id="ddlParagraphs"></select>
                </td>
            </tr>           
            <tr>
                <td>
                    Edit Text: <textarea id="txtEditParagraph" rows="4" cols="50"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <input id="btnSubmitParagraph" type="button" value="Submit Text"/>
                </td>
            </tr>

        </table>
    </div>
    <script src="js/admin.js"></script>
</asp:Content>
