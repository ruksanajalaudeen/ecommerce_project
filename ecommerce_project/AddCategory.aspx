<%@ Page Title="" Language="C#" MasterPageFile="~/AdminHome.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="ecommerce_project.AddCategory1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-3"></div>
        <div class="col-4">
  
    <div class="card1">
    <center>
        <div class="navbar" style="border-width:3px;  height:460px">
            <table align="center" style="width:386px; height:410px">
                <%--Header Text --%>
                <tr>
                    <td colspan="2" align="center">
                        <h2>
                            Add Category
                        </h2>
                        <hr />
                    </td>
                </tr>
                <%--Category with Required field Validation --%>
                <tr>
                    <td>
                        <b style="font-size: 21px; font-weight: bold">  Category: &nbsp;&nbsp;&nbsp;</b>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Height="44px" Width="230px" CausesValidation="true" 
                            placeholder="Category name" BorderColor="#333333" BorderWidth="2px" Font-Bold="true" Font-Size="Medium"
                            ForeColor="Black" BackColor="Transparent"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                            ForeColor="Red" ErrorMessage="Enter Category Name">*</asp:RequiredFieldValidator>
                    </td>
                </tr>

                <%--Button to add Category --%>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="Button1" runat="server" Text="Add" Height="44px" Width="80px" 
                            Font-Bold="true" Font-Size="Medium"
                            BackColor="#006699" BorderColor="Black" BorderWidth="2px" OnClick="Button1_Click" BorderStyle="Solid" ForeColor="White"   />
                    </td>
                </tr>
                
                <%--GridView to Display Category as well as can edit and delete --%>
                <tr>
                    <td colspan="2" align="center">

                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="button" BorderColor="#333333" BorderWidth="2px" 
                            DataKeyNames="CategoryId" EmptyDataText="No Record To Display"
                            Font-Bold="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancellingEdit"
                            OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"
                            PageSize="4" Width="257px">
                            <Columns>
                                <asp:TemplateField HeaderText="Category">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("CategoryName") %>' Font-Bold="true"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:CommandField CausesValidation="false" HeaderText="Operation" ShowDeleteButton="true" ShowEditButton="true" >
                                    <ItemStyle HorizontalAlign="Center" /> </asp:CommandField>

                            </Columns>
                            <HeaderStyle BorderColor="#333333" BorderWidth="3px" Font-Size="Large" />
                        </asp:GridView>
                        <%--<<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineLaptopDbConnectionString5 %>" SelectCommand="SELECT [CategoryName] FROM [Category]"></asp:SqlDataSource>--%>
</table>
</div>
        </div></div></div>
</asp:Content>
