<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" Inherits="Final_Assignment.Tickets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    "Get Your Tickets!"
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>TICKETS! GET YOUR TICKETS</h2>
    <div id="content">
        <asp:GridView ID="gvTickets" runat="server"></asp:GridView>
        <p>Click to buy your tickets below:</p>
        <input type="button" value="Click Me!" id="btnBuyTickets" />
    </div><!--end content-->
    <div id="ticketPurchase" style="display:none">
        <p>If you have more than 4 adults contact us for group rates!</p>        
        <table>
            <tr>
                <td>
                    Adults:
                </td>
                <td>
                     <select id="selAdults" >
                        <option >0</option>
                        <option >1</option>
                        <option >2</option>
                        <option >3</option>
                        <option >4</option>                        
                    </select>
                </td>
                <td>
                    $15.00
                </td>
                <td>
                    <p id="totalAdults"style="display:none"></p>
                </td>
            </tr>
            <tr>
                <td>
                    Kids:
                </td>
                <td>
                     <select id="selChild" >
                        <option >0</option>
                        <option >1</option>
                        <option >2</option>
                        <option >3</option>
                        <option >4</option>                        
                    </select>
                </td>
                <td>
                    $5.00
                </td>
                <td>
                    <p id="totalChild"style="display:none"></p>
                </td>
            </tr>
            <tr>
                <td>
                    Seniors:
                </td>
                <td>
                     <select id="selSenior" >
                        <option >0</option>
                        <option >1</option>
                        <option >2</option>
                        <option >3</option>
                        <option >4</option>                        
                    </select>
                </td>
                <td>
                    $10.00
                </td>
                <td>
                    <p id="totalSenior"style="display:none"></p>
                </td>
            </tr>
            <tr>
                <td>
                    Family:
                </td>
                <td>
                     <select id="selFamily" >
                         <option >0</option>
                         <option >1</option>                                                
                    </select>
                </td>
                <td>
                    $35.00
                </td>
                <td>
                    <p id="totalFamily" style="display:none"></p>
                </td>
            </tr>
        </table>
        <p id="pTotal"></p>
        <input type="button" id="btnBuyTix" value="Buy em" />
        <p id="pPayment"></p>
        <p id="pError"></p>
    </div><!--end TicketPurchase-->
    <script src="js/tickets.js"></script>
</asp:Content>
