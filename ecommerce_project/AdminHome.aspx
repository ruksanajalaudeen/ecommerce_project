<%@ Page Title="" Language="C#" MasterPageFile="~/AdminHome.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="ecommerce_project.AdminHome1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <style>
      .cardhome{
width:860px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  text-align: center;
  background-color:whitesmoke;
  padding-left:10px;
  border-radius: 25px;
  height:530px;
  padding-right:5px;
}
      </style>  
    <div class="row">
        <div class="col-3"></div>
        <div class="col-4">
  
    <div class="cardhome">
        <br />
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/admin.jpg" Height="490px" Width="840px" />
        </div></div></div>


</asp:Content>
