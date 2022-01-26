<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ecommerce_project.Default1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <%--Ads Banner Starts Here--%>
    <table>
                <tr style="width:1110px; height:310px;">
                

                    <td colspan="3">
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                       <asp:UpdatePanel ID="UpdatePanel1" runat="server"> 
                        <ContentTemplate>
                            
                            <asp:Timer ID="Timer2" runat="server" Interval="2000" OnTick="Timer2_Tick"></asp:Timer>
                            <asp:Image ID="Image2" runat="server" BackColor="White" BorderColor="Gray" BorderStyle="Double" Height="300px" Width="1140px" ImageAlign="Middle" />
                        </ContentTemplate>
                         </asp:UpdatePanel>
                    </td>
                </tr>

    
        <%--Product Category DropDownList & TextBox for Searching Products by name as well as by Category--%>
   
        <tr class=auto-style1 >
         <td style="text-align:right">
        <asp:DropDownList ID="ProductCategories" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="ProductCategories_SelectedIndexChanged" 
            BackColor="White" Font-Bold="True" Font-size= "Medium" ForeColor="Black"> </asp:DropDownList>
             <asp:TextBox ID="TextBox1" runat="server" Height="21px" Width="174px"></asp:TextBox>
            <asp:ImageButton ID="ImageButton2" runat="server" Height="28px" ImageUrl="~/Images/se.png" Width="39px" BackColor="White" OnClick="ImageButton2_Click1"  />
        </td>
            
 
        </tr>
    </table>
    <!--Displaying contents in the home-->
    <asp:DataList ID="DataList1" runat="server" DataKeyField="ProductId" DataSourceID="SqlDataSource1" Height="293px" Width="310px" RepeatColumns="4" RepeatDirection="Horizontal" 
        OnItemDataBound="DataList1_ItemDataBound"  OnItemCommand="DataList1_ItemCommand"  >
        <ItemTemplate>
            <table>
                <!--product name -->
                <tr>
                    <td style="text-align:center; background-color: whitesmoke">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Pname") %>' Font-Bold="True" Font-Names="Arial"></asp:Label>
                    </td>
                </tr>
                 <!--product image -->

                 <tr>
                    <td style="text-align:center; background-color:black">
                        <asp:Image  CssClass="All" ID="Image1" runat="server" Height="279px" Width="278px" BorderColor="White" BorderWidth="1px" ImageUrl='<%# Eval("Pimage") %>' />
                         
                        
                        <div class="all">
                    &nbsp;Stock:&nbsp;
                    <asp:Label CssClass="txtStock"  ID="Label5" runat="server" Text='<%# Eval("Pquantity") %>'
                        BackColor='<%# (int)Eval("Pquantity") <=10 ? System.Drawing.Color.Red : System.Drawing.Color.Green %>' >
                    </asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
               <asp:Label ID="Label6" runat="server" Text='<%# Eval("ProductId") %>'   
                   Visible="false" Height="2px" ></asp:Label>



                    </td>
                </tr>
                <!--product price -->
                 <tr>
                    <td style="text-align:center; background-color: whitesmoke">
                        <asp:Label ID="Label2" runat="server" Text="Price:  Rs." Font-Bold="True" ForeColor="Black" ></asp:Label>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Pprice") %>' Font-Bold="True" ForeColor="Black" ></asp:Label>

                    </td>
                </tr>
                 <tr>
                    <td style="text-align:center">Quantity
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                 <tr>
                    <td style="text-align:center">
                        <asp:ImageButton ID="ImageButton6" runat="server" Height="40px" ImageUrl="~/Images/cartimg.jpg" Width="244px" CommandArgument='<%# Eval("ProductId") %>' CommandName="AddToCart"  />
                    </td>
                </tr>
            </table>
           
            <br />
            <br />
        </ItemTemplate>

    </asp:DataList>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OnlineLaptopDbConnectionString2 %>" SelectCommand="SELECT [ProductId], [Pname], [Pimage], [Pprice] ,[Pquantity] FROM [Product1]"></asp:SqlDataSource>
</asp:Content>
