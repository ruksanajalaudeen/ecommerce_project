﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce_project
{
    public partial class PlaceOrder : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=LAPTOP-4KV1GCMU; " +
           "Initial Catalog=OnlineLaptopDB; Integrated Security=True");
        bool isTrue = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //check whether user is logged in or not
                if (Session["username"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }

        }
        //save order details into table, decrease the quantity of product, save the payment details and clear the cart item
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["buyitems"] != null && Session["Orderid"] != null)
            {
                DataTable dt = (DataTable)Session["buyitems"];
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    string pId = dt.Rows[i]["pid"].ToString();
                    int pQuantity = Convert.ToInt16(dt.Rows[i]["pquantity"]);
                    SqlDataAdapter sda = new SqlDataAdapter("Select Pquantity from Product1 where ProductId='" + pId + "'", con);
                    DataTable dtble = new DataTable();
                    sda.Fill(dtble);
                    int quantity = Convert.ToInt16(dtble.Rows[0][0]);
                    if (quantity > 0)
                    {
                        //insert order details in table
                        con.Open();
                        SqlCommand cmd = new SqlCommand("Insert into OrderDetails(orderid,sno,productId,productname,price,quantity,orderdate,status) values('"
                            + Session["Orderid"] + "'," + dt.Rows[i]["sno"] + "," + dt.Rows[i]["pid"] + ",'" + dt.Rows[i]["pname"] + "'," + dt.Rows[i]["pprice"]
                            + "," + dt.Rows[i]["pquantity"] + ",'" + DateTime.Now.ToString("dd-MM-yyyy") + "','pending')", con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                decreaseQuantity();
                Payment();
                clearCart();
                Session["buyitems"] = null;
                Response.Redirect("Pdf_generate.aspx");
            }
            else
            {
                Response.Redirect("AddtoCart.aspx");
            }
        }
        //Insert payment details into table
        public void Payment()
        {
            if (isTrue == true)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into CardDetails(Fname,Lname,CardNo,ExpiryDate,CVV,BillingAddr) values (@Fname,@Lname,@CardNo,@ExpiryDate,@CVV,@BillingAddr)", con);
                cmd.Parameters.AddWithValue("@Fname", TextBox1.Text);
                cmd.Parameters.AddWithValue("@Lname", TextBox2.Text);
                cmd.Parameters.AddWithValue("@CardNo", TextBox3.Text);
                cmd.Parameters.AddWithValue("@ExpiryDate", TextBox4.Text);
                cmd.Parameters.AddWithValue("@CVV", TextBox5.Text);
                cmd.Parameters.AddWithValue("@BillingAddr", TextBox6.Text);

                cmd.ExecuteNonQuery();
                con.Close();

            }
            Session["address"] = TextBox6.Text;
        }
        //Decrease the product quantity after purchasing the product
        public void decreaseQuantity()
        {
            DataTable dt = (DataTable)Session["buyitems"];
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int pId = Convert.ToInt16(dt.Rows[i]["pid"]);
                int pQuantity = Convert.ToInt16(dt.Rows[i]["pquantity"]);
                SqlDataAdapter sda = new SqlDataAdapter("Select Pquantity from Product1 where ProductId='" + pId + "'", con);
                DataTable dtble = new DataTable();
                sda.Fill(dtble);
                int quantity = Convert.ToInt16(dtble.Rows[0][0]);
                if (quantity > 0)
                {
                    int reducedQuantity = quantity - pQuantity;
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update Product1 set Pquantity='" + reducedQuantity + "' where ProductId ='" + pId + "' ", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    isTrue = true;
                }
                else
                {
                    isTrue = false;
                }
            }
        }
        public void clearCart()
        {
            if (Session["username"] != null)
            {
                DataTable dt = (DataTable)Session["buyitems"];
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    int pId = Convert.ToInt16(dt.Rows[i]["pid"]);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Delete from CartDetails where ProductId='" + pId + "'and Email='" + Session["username"] + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        
    }
}