<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Final_Assignment.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
        <h1>Welcome Admin</h1>
            <asp:UpdatePanel runat="server" ID="updatePanelAdmin" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:GridView ID="gvUsers" runat="server">

                    </asp:GridView>
                    <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" />
                </ContentTemplate>
            </asp:UpdatePanel>
    </div>
    <!--end Gridview div-->
    <div>
        <p>Allow user Admin access:</p>
        <select id="ddlUsers"></select>
        <input id="btnAddAdmin" type="submit" value="Add Admin" />
    </div>
    <script type="text/javascript">
        $(document).ready(function() {            
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/Ajax.asmx/GetUsers',
                data: '{}',
                dataType:"json",
                success: function (msg) {
                    $("#ddlUsers").get(0).options.length = 0;
                    $("#ddlUsers").get(0).options[0] = new Option("Select User", "-1");
                    
                    $(msg.d).each(function (index) {                                                
                        $("#ddlUsers").get(0).options[$("#ddlUsers").get(0).options.length] = new Option(msg.d[index],index)
                    });
                },
                error: function (msg) {
                    alert('Failed to load'+msg);
                }
            });
        });  
    </script>  
</asp:Content>
