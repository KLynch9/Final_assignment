<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Animals.aspx.cs" Inherits="Final_Assignment.Animals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Our Animals
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Xml ID="Xml1" runat="server" TransformSource="/Animals.xsl"></asp:Xml>
</asp:Content>
