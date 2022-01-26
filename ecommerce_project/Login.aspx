<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ecommerce_project.Login" %>
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
     <div style="height:500px">
         <br />
         <div style="text-align:center; align-content:center; font-size:larger; font-family:Arial"><b>Login  </b></div>
      <br />   <table class="example1" style="height:420px;width:565px;background-color:white;margin:0 auto">
                <%-- Usename with required field validator --%>
                <tr>
                    <td align="center" style="width:50%">
                        <b>Username</b>
                    </td>
                    <td>
         
                        <asp:TextBox ID="TextBox1" runat="server" BackColor="Transparent" Height="29px" Width="166px" Font-Bold="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Email Id"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <%-- Password with Required Field Validator --%>
                <tr>
                    <td align="center" style="width:50%">
                        <b>Password</b>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" BackColor="Transparent" Height="29px" Width="166px" Font-Bold="true" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Password is Required"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <%-- Button to Login and redirect to Defalt page --%>
                <tr>
                    <td colspan="2" align="center">

                        <asp:Button ID="Button1" runat="server" Height="41px" Text="Login" Width="133px" OnClick="Button1_Click" BackColor="#1F294A" Font-Bold="True" ForeColor="White" /><hr />

                    </td>
                </tr>
                 <%--Lable for displaying register error message --%>
                <tr>
                    <td>
                        <asp:Label ID="Lable1" runat="server" Font-Bold="true" ForeColor="SkyBlue"></asp:Label>
                    </td>
                 <%-- Redirecting to register page --%>
                    <td align="right">
                        New to LaptopStore?
                        <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="true"  ForeColor="#1f294a" OnClick="LinkButton1_Click" CausesValidation="false">Register Here</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>

     =-

</asp:Content>
