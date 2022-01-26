<%@ Page Title="" Language="C#" MasterPageFile="~/AdminHome.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ecommerce_project.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 38px;
        }
        .card2 {
width:650px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  text-align: center;
  background-color:whitesmoke;
  padding-left:30px;
  border-radius: 25px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-3"></div>
        <div class="col-4">
  
    <div class="card2">
    <div class="navbar" style="border-width:3px;border-color:#a93131;height:auto">
            <table style="width:600px;height:400px;background-color:whitesmoke" align="center">
                <%-- Header text --%>
                <tr>
                    <td align="center" width="50%" colspan="2">
                        <h2>Add Product</h2>
                        <hr />
                    </td>
                </tr>
                <%-- Category DropDownList With RequiredFieldValidator --%>
                <tr>
                    <td align="center" width="50%">
                        <h4>Category</h4>
                    </td>
                    <td width="50%">
                        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource2" 
                            DataTextField="CategoryName" DataValuField="CategoryId" Height="33px" Width="165px" DataValueField="CategoryName"><asp:ListItem>Select</asp:ListItem></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineLaptopDbConnectionString6 %>" SelectCommand="SELECT [CategoryName] FROM [Category]"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" Display="Dynamic" 
                            ErrorMessage="Category is Mandatory" ForeColor="Red" InitialValue="select">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <%-- ProductName With Required Field Validator --%>
                <tr>
                    <td align="center" width="50%">
                        <h4>ProductName</h4>
                       
                    </td>
                    <td width="50%">
                        <asp:TextBox ID="txtName" runat="server" OnTextChanged="txtName_TextChanged"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="txtName" Display="Dynamic" 
                            ErrorMessage="Product Name is Mandatory" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <%-- Product Des with Required Field Validator --%>
                <tr>
                    <td align="center" width="50%">
                        <h4>Product Description</h4>
                    </td>
                    <td width="50%">
                        <asp:TextBox ID="txtDes" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDes" Display="Dynamic" 
                            ErrorMessage="Description is Mandatory" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <%-- Product Image Upload with required field Validator  --%>
                <tr>
                    <td align="center" width="50%" class="auto-style1">
                        <h4>Image</h4>
                    </td>
                    <td width="50%" class="auto-style1">
                        <asp:FileUpload ID="imageUploaded" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="imageUploaded" Display="Dynamic"
                            ErrorMessage="Image is mandatory" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <%-- Product Price Wiht RequiredField Validator --%>
                <tr>
                    <td align="center" width="50%">
                        <h4>Product Price</h4>
                    </td>
                    <td width="50%">
                        <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtprice" Display="Dynamic"
                            ErrorMessage="Price is mandatory" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtprice" Display="Dynamic"
                            ErrorMessage="Price is Invalid" ForeColor="Red" ValidationExpression="^\d{0,8}(\.\d{1,4})?$" ></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <%-- Product Quantity With RequiredfieldValidator and Regular Expression --%>
                <tr>
                    <td align="center" width="50%">
                        <h4>Product Quantity</h4>
                    </td>
                    <td width="50%">
                        <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtQuantity" Display="Dynamic"
                            ErrorMessage="Quantity is mandatory" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidation2" runat="server" ControlToValidate="txtQuantity" Display="Dynamic"
                            ErrorMessage="Quantity is Invalid" ForeColor="Red" ValidationExpression="[0-9]"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <%-- Button to add Product Details --%>
                <tr>
                    <td align="center" width="50%" colspan="2">
                        <asp:Button ID="buttonsubmit" runat="server" Text="Add" Font-Bold="true" ForeColor="White" Height="36px" Width="88px" OnClick="buttonsubmit_Click" BackColor="#006699" BorderColor="Black" BorderStyle="Solid" />
                    </td>
                </tr>
                <%--Lable to display product added or not --%>
                <tr>
                    <td align="center" width="50%" colspan="2">
                        <asp:Label ID="lable1" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <%-- Validation msg for displaying all error messages --%>
                <tr>
                    <td colspan="2" align="center">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Fix the Folliwing Errors" />
                    </td>
                </tr>
            </table>
        </div>
        </div></div></div>
        <%-- DataSource to populate DropDownList of Product --%>
        <div>
        </div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineLaptopDbConnectionString %>" 
                SelectCommand ="SELECT * FROM [Category]"></asp:SqlDataSource>

</asp:Content>
