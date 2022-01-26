using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce_project
{
    public partial class Default1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=LAPTOP-4KV1GCMU;Initial Catalog=OnlineLaptopDb;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["addproduct"] = "false";
            if (!IsPostBack)
            {
                Drp_ProductCategory();
            }

        }

        protected void Timer2_Tick(object sender, EventArgs e)
        {
            Random ran = new Random();
            int i = ran.Next(1, 6);
            Image2.ImageUrl = "~/Images/" + i.ToString() + ".jpg";

        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Random ran = new Random();
            int i = ran.Next(1, 6);
            Image2.ImageUrl = "~/Images/" + i.ToString() + ".jpg";
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            
                Session["addproduct"] = "true";
                if (e.CommandName == "AddToCart")
                {
                    DropDownList list = (DropDownList)(e.Item.FindControl("DropDownList1"));
                    Response.Redirect("AddtoCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + list.SelectedItem.ToString());

                }
        }

        

        

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {


            Label productID = e.Item.FindControl("Label6") as Label;
            Label stock = e.Item.FindControl("Label5") as Label;
            ImageButton btn = e.Item.FindControl("ImageButton6") as ImageButton;
            SqlDataAdapter sda = new SqlDataAdapter("Select * from Product1 where ProductId=  '" + productID.Text + "' ", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            String stockdata = "";
            if (dt.Rows.Count > 0)
            {
                stockdata = dt.Rows[0]["Pquantity"].ToString();

            }
            con.Close();
            if (stockdata == "0")
            { 
                stock.Text = "Out of Stock";
                btn.Enabled = false;
                btn.ImageUrl = "Images/sol.jpg";
            }
            else
            {
                stock.Text = stockdata;
            }

        }
        
        //Displays Product Categories in DropDownList
        public void Drp_ProductCategory()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Category", con);
            ProductCategories.DataSource = cmd.ExecuteReader();
            ProductCategories.DataTextField = "CategoryName";
            ProductCategories.DataValueField = "CategoryId";
            ProductCategories.DataBind();
            ProductCategories.Items.Insert(0, "Product Category");
            con.Close();
        }
        // Displaying Products based on selected Category
        protected void ProductCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strQuery = "";
            string selectedProduct = ProductCategories.SelectedItem.Text;
            if (selectedProduct == "Product Category")
            {
                strQuery = "";
            }
            else
            {
                strQuery = "where Pcategory = '" + selectedProduct + "' ";
            }
            SqlDataAdapter sda = new SqlDataAdapter("Select * from Product1 " + strQuery + " ", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            try
            {
                if (selectedProduct == dt.Rows[0][6].ToString())
                {

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('No product found in the specified category')</script>");
            }
            DataList1.DataSourceID = null;
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }

        
        //searching product based on dropdown list
        protected void ImageButton2_Click1(object sender, ImageClickEventArgs e)
        {
            SqlDataAdapter sda = new SqlDataAdapter("Select * from Product1 where (Pname like '%" + TextBox1.Text + "%') or (Pcategory like '%" + TextBox1.Text + "%')", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DataList1.DataSourceID = null;
            DataList1.DataSource = dt;
            DataList1.DataBind();

        }
    }

}
