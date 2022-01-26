<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ecommerce_project.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 30%;
            height: 45px;
        }
        .auto-style5 {
            height: 45px;
        }
        .example1 {
  border: 1px solid;
  border-radius: 25px;
 
  padding: 10px;
  box-shadow: 5px 10px 8px #888888;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div style="height:830px;">
           <br />
            <div style="text-align:center; align-content:center; font-size:larger; font-family:Arial"><b>Create Account</b></div>
            <br />
            <table class="example1" style="width:700px;height:702px;background-color:white" align="center">
                
               <%--First Name with Required and regular expression valitation--%>
                <tr>
                    <td align="center" style="width:50%">
                        <b>First Name</b>
                    </td>
                    <td style="vertical-align:top">
                        <asp:TextBox ID="TextBox1" runat="server" Backcolor="Transparent" Height="29px" Width="166px" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox1" Errormessage="First name is empty" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                          ControlToValidate="TextBox1" Errormessage="First name should be in Characters" ForeColor="Red" ValidationExpression="^[A-Za-Z]*$">*</asp:RegularExpressionValidator>
                   <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" --%>
                      

                    </td>
                </tr>
                <%--Last Name with Required and regular expression valitation--%>
                <tr>
                    <td align="center" class="auto-style4">
                        <b>Last Name</b>
                    </td>
                    <td style="vertical-align:top" class="auto-style5">
                        <asp:TextBox ID="TextBox2" runat="server" Backcolor="Transparent" Height="29px" Width="166px" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="TextBox2" Errormessage="Last name is empty" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="TextBox2" Errormessage="Last name should be in Characters" ForeColor="Red" ValidationExpression="^[A-Z][a-zA-Z]*$">*</asp:RegularExpressionValidator>--%>
                    </td>
                </tr>
                <%--Email with required field valitation--%>
                <tr>
                    <td align="center" style="width:50%">
                        <b>Email</b>
                    </td>
                    <td style="vertical-align:top">
                        <asp:TextBox ID="TextBox3" runat="server" Backcolor="Transparent" Height="29px" Width="166px"  
                            TextMode="Email" TabIndex="2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Errormessage="Email Id is empty"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <%--Gender with required field valitation--%>
                <tr>
                    <td align="center" style="width:50%">
                        <b>Gender</b>
                    </td>
                    <td style="vertical-align:top">
                        <asp:DropDownList ID="DropDownList1" runat="server" BackColor="Transparent" Height="30px" Width="166px" Font-Bold="true" TabIndex="3">
                            <asp:ListItem Value="Select Gender">Select Gender</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Select gender">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <%--Address with required field valitation--%>
                <tr>
                    <td align="Center" style="width:50%">
                        <b>Address  </b>
                    </td>
                    <td style="vertical-align:top">
                        <asp:TextBox ID="TextBox4" runat="server" BackColor="Transparent" Height="29px" Width="166px"  TextMode="MultiLine"
                            TabIndex="4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox4" ErrorMessage="Address is empty"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <%--PhoneNo with required field & Regular Expression valitation--%>
                <tr>
                    <td align="center" style="width:50%">
                        <b>Mobile Number</b>
                    </td>
                    <td style="vertical-align:top">
                        <asp:TextBox ID="TextBox5" runat="server" BackColor="Transparent" Height="29px" Width="166px" 
                            TextMode="Number" TabIndex="5"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                            ControlToValidate="TextBox5" Errormessage="Phone No is invalid" ForeColor="Red" ValidationExpression="[0-9]{10}">*</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox5" ErrorMessage="Phone No is Empty"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <%--Password with Required field Validator --%>
                <tr>
                    <td align="center" style="width:50%">
                        <b>Password</b>
                    </td>
                    <td style="vertical-align:top">
                        <asp:TextBox ID="TextBox6" runat="server" BackColor="Transparent" Height="29px" Width="166px" 
                            TextMode="Password" TabIndex="6"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox6" ErrorMessage="Password is Empty" ForeColor="Red">*</asp:RequiredFieldValidator>  
                    </td>
                </tr>
                <%--Confirm Password with Required Field and Compare Validator --%>
                <tr>
                    <td align="center" style="width:50%">
                        <b>Confirm Password</b>
                    </td>
                    <td style="vertical-align:top">
                        <asp:TextBox ID="TextBox7" runat="server" BackColor="Transparent" Height="29px" Width="166px" 
                            TextMode="Password" TabIndex="6"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox7" ErrorMessage="Password is invalide" 
                            ForeColor="Red">*</asp:RequiredFieldValidator>                    
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox6" ControlToValidate="TextBox7" 
                            ErrorMessage="Password not matched" ForeColor="Red">*</asp:CompareValidator>
                    </td>
                </tr>
                <%--Register Button --%>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="Button1" runat="server" Font-Size="Large" Text="Create" OnClick="Button1_Click" BackColor="#1F294A" forecolor="White"  Height="44px" Width="142px"/>
                        <hr />
                    </td>
                </tr>
                <%-- Validation summarry for Displaying all Valitations Error Message --%>
                <tr>
                    <td colspan="3">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Fix the following errors" Font-Bold="true" />
                    </td>
                </tr>
                <%--Lable for displaying register error message --%>
                <tr>
                    <td>
                        <asp:Label ID="Lable1" runat="server" Font-Bold="true" ForeColor="SkyBlue"></asp:Label>
                    </td>
                <%-- Redirects to default page if you are already registered --%>
                    <td align="right">
                        Already have an account<asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="true"  NavigateUrl="Login.aspx"> Click Here</asp:HyperLink>
                    </td>
                </tr>
            </table>
               
        </div>
  
</asp:Content>
