<%@ Page Title="" Language="C#" MasterPageFile="~/AdminHome.Master" AutoEventWireup="true" CodeBehind="UpdateStatus.aspx.cs" Inherits="ecommerce_project.UpdateStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
         .card3 {
width:800px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  text-align: center;
  background-color:whitesmoke;
  padding-left:30px;
  border-radius: 25px;
 
}
    </style>
   
    <div class="row">
        <div class="col-3"></div>
        <div class="col-4">
  
    <div class="card3">
    <div align="center" class="navbar" style="height: auto">
        <%--Display List of Order --%>
        <div align="right" >
            <br />
            <asp:LinkButton ID="AllOrder" runat="server" OnClick="AllOrder_Click" BorderStyle="None" Font-Bold="True" Font-Size="Large" Font-Underline="True" ForeColor="Black">Show All Order List</asp:LinkButton>
            &nbsp;
            <br />
        </div>
        
        <%--Data Selection --%>
        <b> Select Date:</b>
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Date" Height="29px" Width="168px"></asp:TextBox>
        &nbsp;

        <%--Button to Process the data --%>
        <asp:Button ID="Button1" runat="server" Text="Submit" BackColor="#006699" OnClick="Button1_Click" CssClass="button" Font-Bold="true" Height="29px" Width="92px" ForeColor="White" BorderColor="Black" BorderStyle="Solid" />
        <br />
        <br />
        <div style="width:800px; padding-right:5px">
        <%--Display Order Details Based on Selected Date --%>
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#666666" BorderStyle="None" BorderWidth="12px" CellPadding="3" GridLines="Vertical"
            OnRowDataBound="GridView1_RowDataBound" Width="650px"> <AlternatingRowStyle BackColor="#DCDCDC" /> 
            <Columns>
                               <asp:TemplateField HeaderText="Product Status">
                    <ItemTemplate>
                        <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" GroupName="Pstatus" Text="Pending" />
                        &nbsp; <asp:RadioButton ID="RadioButton2" runat="server" GroupName="Pstatus" Text="Complete" />
                    </ItemTemplate>
                    <ItemStyle  HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#006699" Font-Bold="true" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="true" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
            </div>
        <br />

        <%--Button To Update Order Status --%>
        <center> <asp:Button ID="Button2" runat="server"  Text="Update Status" OnClick="Button2_Click" CssClass="button" Font-Bold="true" Height="37px" Width="159px" BackColor="#006699" BorderColor="Black" BorderStyle="Solid" ForeColor="White" />
   </center>     <br />
        
        <br />
    </div>
        </div></div>
</asp:Content>
