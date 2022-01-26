<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="AddtoCart.aspx.cs" Inherits="ecommerce_project.AddtoCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
      <style>
       .example1 {
  border: 1px solid;
  border-radius: 25px;
 
  padding: 10px;
  box-shadow: 5px 10px 8px #888888;
}
    </style>
  
    <div align=center>

        <br />
        <div  style="text-align:center"><h3>Your Cart</h3></div>
      
        <div class="example1" style="background-color:whitesmoke; width:950px">
            <br />
            <!--Displying items in the grid view-->

        <asp:GridView runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="Black" EmptyDataText="No items in the cart." ShowFooter="True" ID="GridView1" OnRowDeleting="GridView1_RowDeleting" BorderStyle="Solid">
            <Columns>
                <asp:BoundField DataField="sno" HeaderText="No.">
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="pid" HeaderText="Product Id">
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:ImageField DataImageUrlField="pimage" HeaderText="Image">
                    <ControlStyle Height="180px" Width="230px" />
                    <ItemStyle HorizontalAlign="Left" />
                </asp:ImageField>
                <asp:BoundField DataField="pname" HeaderText="Product Name" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="pdesc" HeaderText="Description" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="pprice" HeaderText="Price">
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="pquantity" HeaderText="Quantity">
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="ptotalprice" HeaderText="Total price">
                <ItemStyle HorizontalAlign="Right"   />
                </asp:BoundField>
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <FooterStyle Height="70px" Backcolor="white" BorderColor="Black" BorderStyle="Solid" />
            <HeaderStyle BackColor="White" BorderColor="Black" ForeColor="Black" BorderStyle="Solid" />
        </asp:GridView>
        <br />
        <div align=center>
        <asp:Button ID="Button1" runat="server" Text="Proceed to Buy" BackColor="#1B002A" Font-Bold="True" ForeColor="White" Height="44px" Width="175px" OnClick="Button1_Click" />
 </div><br /></div>
            </div> 
    <br />
</asp:Content>

