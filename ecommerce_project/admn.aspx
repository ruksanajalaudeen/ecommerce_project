<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admn.aspx.cs" Inherits="ecommerce_project.AdminHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!--bootstrap code-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <!-- end-->


    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
        <%--<div class="row" style="background-color:orange">--%>
           
    <div class="row">

           <div class="col-12"> <header style="background-color:antiquewhite; width:fit-content; height:50px"> ADMINISTRATOR </header></div>


        </div>
                
    <div class="row">
            <div class="col-3">
                <!--side section menu items-->
   
                   <asp:Menu ID="Menu2" runat="server" DynamicHorizontalOffset="1" StaticSubMenuIndent="40px">
                       <Items>
                            <asp:MenuItem Text="All Products" Value="All Products"></asp:MenuItem>
                           
                           <asp:MenuItem Text="Update Category" Value="Update Category"></asp:MenuItem>
                           <asp:MenuItem Text="Add Product" Value="Add Product"></asp:MenuItem>
                           <asp:MenuItem Text="Update Product" Value="Update Product"></asp:MenuItem>
                           <asp:MenuItem Text="Update Status" Value="Update Status"></asp:MenuItem>
                           <asp:MenuItem Text="Logout" Value="Logout"></asp:MenuItem>
                       </Items>
                       <StaticHoverStyle  BorderColor="White" BorderStyle="Solid" ForeColor="#3333CC" Height="20px" />
                            <StaticMenuItemStyle Font-Bold="true" Font-Size="Large" ForeColor="#3333CC" HorizontalPadding="60px" />
                            <StaticSelectedStyle BackColor="#FF5050" BorderColor="#FF6666" BorderStyle="Inset" ForeColor="#666666" Height="40px" />
                   </asp:Menu>
                   <br />
           </div>
        <div class="col-4" ></div>
        <div class="col-5">

            <!--content by priya-->




        </div>
       
  
            
           
            
           
          
           
        </div>
    </form>
</body>
</html>
