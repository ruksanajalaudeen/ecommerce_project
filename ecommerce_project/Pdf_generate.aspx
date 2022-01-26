<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pdf_generate.aspx.cs" Inherits="ecommerce_project.Pdf_generate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 120px;
        }
        .auto-style2 {
            height: 61px;
        }
        .auto-style3 {
            width: 40%;
            height: 149px;
        }
        .auto-style4 {
            height: 149px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
        <div>
            <%--Button to download invoice in PDF format --%>
            &nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True"
                Font-Size="X-Large" NavigateUrl="~/Default.aspx" ForeColor="Black"> Home </asp:HyperLink>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <%--Redirect to home page i.e Default page --%>          

            <%--Content inside the panel will going to reflect in PDF --%>
            <asp:Panel ID="Panel1" runat="server">
                <table border="1">
                    <%--Header Text --%>
                    <tr>
                        <td style="text-align:center" class="auto-style1">
                            <h2 style="text-align:center">Retail Invoice</h2>
                        </td>
                    </tr>
                    <%--Order NO. and Order date --%>
                    <tr>
                        <td>Order No.
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            <br />
                            <br />
                            Order Date:
                             <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>

                     <tr>
                    <td>
                        <table>
                            <tr>
                                <%--User Address --%>
                                <td class="auto-style3">Buyer Address:
                                    <br />
                                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                </td>
                                 <%--Seller Address --%>
                                <td class="auto-style4"> 
                                    <br />
                                    Seller Address:
                                    <br />
                                    DesktopBazar.com Pvt Ltd.
                                    <br />
                                    8/2, 2nd floor, 2nd cross, Sadar Patrappa Rd, Bengaluru, Karnataka 560002
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%--Gridview for displaying purchased product --%>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="1000px">
                            <Columns>
                                <asp:BoundField DataField="sno" HeaderText="SNo">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                <asp:BoundField DataField="productid" HeaderText="Product Id">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                <asp:BoundField DataField="productname" HeaderText="Product Name">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                <asp:BoundField DataField="quantity" HeaderText="Quantity">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                <asp:BoundField DataField="price" HeaderText="Price">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                <asp:BoundField DataField="totalprice" HeaderText="Total Price">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <%--Display Total payment --%>
                <tr>
                    <td class="auto-style2">Grand Total:
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                    <caption>
                        <br />
                        <br />
                        <br />
                        <br />
                        <%--PDF note --%>
                        <tr>
                            <td align="center">This is computer generated invoice and does not required signature.</td>
                        </tr>
                    </caption>
             </table>
            </asp:Panel>
            <asp:Button ID="Button1" runat="server" Text="Download Invoice" 
                BackColor="Silver" Font-Bold="true" Font-Size="X-Large" Height="49px" OnClick="Button1_Click" Width="360px" />
        </div>
            </center>
        </div>
    </form>
</body>
</html>
