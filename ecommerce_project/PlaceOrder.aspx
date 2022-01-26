<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="ecommerce_project.PlaceOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .table
        {
            border-radius:5%;
        }
        #Button1
        {
            border-radius: 11% 11% 11% 11% / 61% 64% 64% 66%
        }
        .example1 {
  border: 1px solid;
  border-radius: 25px;
 
  padding: 10px;
  box-shadow: 5px 10px 8px #888888;
}
    </style>


    <div>
            <table class="example1" align="center" style="margin-top:50px; width:531px; height:563px;" bgcolor="white">
                <%--Header Text--%>
                <tr>
                    <td colspan="2" align="center" style="vertical-align:top">
                        <asp:Label ID="Label1" runat="server" Text="Payment Details" Font-Bold="True" Font-Size="X-Large" ForeColor="Black"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <%--First name with required and regular expression validation --%>
                    <td colspan="2" align="center" style="vertical-align:top">
                        <asp:TextBox ID="TextBox1" runat="server" BorderColor="Black" BorderWidth="2px"
                            Font-Bold="true" Font-Size="Medium" Height="44px" Width="300px" placeholder="First Name"></asp:TextBox></td>
                     <td>   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is empty" 
                            ControlToValidate="TextBox1" ForeColor="Red">*</asp:RequiredFieldValidator>
                       <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ErrorMessage="First Name must be in characters" ControlToValidate="TextBox1" ForeColor="Red" ValidationExpression="^[A-Za-z]$">*</asp:RegularExpressionValidator>--%>

                    </td>
                </tr>
                <tr>
                    <%--Last name with required and regular expression validation --%>
                    <td colspan="2" align="center" style="vertical-align:top">
                        <asp:TextBox ID="TextBox2" runat="server" BorderColor="Black" BorderWidth="2px"
                            Font-Bold="true" Font-Size="Medium" Height="44px" Width="300px" placeholder="Last Name"></asp:TextBox></td> 
                    <td>   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is empty" 
                            ControlToValidate="TextBox2" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                            ErrorMessage="Last Name must be in characters" ControlToValidate="TextBox2" ForeColor="Red" ValidationExpression="^[A-Za-z]$">*</asp:RegularExpressionValidator>--%>

                       <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Last Name must be in characters" ControlToValidate="TextBox2" ForeColor="Red" ValidationExpression="^[A-Za-z]$">*</asp:RegularExpressionValidator>--%>

                    </td>
                </tr>
                <%--Payment Card Logo--%>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Image ID="Image1" runat="server" BorderColor="Black" BorderWidth="2px" ImageUrl="~/Images/Pay.jpg" Width="410px" />
                    </td>
                </tr>
                <%--16 digits card number --%>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Label ID="Label2" runat="server" Text="Card Number" Font-Bold="True" Font-Size="Large" ForeColor="Black"></asp:Label>
                    </td>
                </tr>
                <%--16 digits card number with required and required expression validator --%>
                <tr>
                      <td  colspan="2" align="center" style="vertical-align:top">
                        <asp:TextBox ID="TextBox3" runat="server" BorderColor="Black" BorderWidth="2px"
                            Font-Bold="true" Font-Size="Medium" Height="44px" Width="442px" placeholder="16 digits"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Card Number is empty" ControlToValidate="TextBox3"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                            ErrorMessage="Card Number must be of 16 digits" ControlToValidate="TextBox3" ForeColor="Red" ValidationExpression="[0-9]{16}">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <%--Expiry Date of card --%>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label3" runat="server" Text="Expiry Date" Font-Bold="True" Font-Size="Large" ForeColor="Black"></asp:Label>
                    </td>
                </tr>

               
                 <%--Expiry Date of card with required field validtion --%>
                 <tr>
                      <td align="center" colspan="2" style="vertical-align:top">
                        <asp:TextBox ID="TextBox4" runat="server" BorderColor="Black" BorderWidth="2px"
                            Font-Bold="true" Font-Size="Medium" Height="44px" Width="188px" placeholder="MMYYYY(Eg:012022)"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ErrorMessage="Expiry Date is empty" ControlToValidate="TextBox4" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
                          </tr>

                   <%--CVV Number of card --%>
                <td align="center">
                    <asp:Label ID="Label4" runat="server" Text="CVV" Font-Bold="True" Font-Size="Large" ForeColor="Black"></asp:Label>
                </td>

                 <%--CVV number of card with required and regular expression validator --%>
                <tr>
                      <td align="center" style="vertical-align:top">
                        <asp:TextBox ID="TextBox5" runat="server" BorderColor="Black" BorderWidth="2px" 
                            
                            Font-Bold="true" Font-Size="Medium" Height="44px" Width="188px" placeholder="3 Digits"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="CVV is empty"
                            ControlToValidate="TextBox5" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                            ErrorMessage="CVV number must be of 3 digits" ControlToValidate="TextBox5"
                            ForeColor="Red" ValidationExpression="[0-9]{3}">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                  <%--Billing Address with required field validtion --%>
                 <tr>
                      <td colspan="2" align="center" style="vertical-align:top">
                        <asp:TextBox ID="TextBox6" runat="server" BorderColor="Black" BorderWidth="2px"
                            Font-Bold="true" Font-Size="Medium" Height="50px" Width="442px" placeholder="Billing Address" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Address is empty" 
                            ControlToValidate="TextBox6" ForeColor="Red">*</asp:RequiredFieldValidator>
               </td>
                          </tr>
                <%--Submit button to save payment details in table --%>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="Button1" runat="server" Text="Submit" BackColor="#1F294A" BorderColor="White" 
                            BorderWidth="1px" Font-Bold="true" Font-Size="Large" ForeColor="White" Height="44px" Width="188px" OnClick="Button1_Click"  />
                      
                    </td>
                </tr>

                <%-- Validation Summary for displaying all error messages--%>
                <tr>
                    <td colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="true"
                            ForeColor="Red" HeaderText="Fix the following errors" />
                    </td>
                </tr>

               <tr>
                <td colspan="2" align="center">
                     
                   
                    <div style="text-align:left"><asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" NavigateUrl="~/AddtoCart.aspx" Font-Underline="False" ForeColor="Black" >Back</asp:HyperLink>
                   </div>
                </td>
                    </tr>
                
            </table>

        </div>

    <br />
</asp:Content>
