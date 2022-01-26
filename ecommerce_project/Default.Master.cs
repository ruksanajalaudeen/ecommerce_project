
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ecommerce_project
{
    public partial class Default : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Counting No. Of Products Present in Shopping Cart
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            if (dt != null)
            {
                Label2.Text = dt.Rows.Count.ToString();
            }
            else
            {
                Label2.Text = "0";
            }
            Session["addproduct"] = "false";

            //Login Session
            if (Session["username"] != null)
            {
                Label1.Visible = true; 
                Label1.Text =  Session["username"].ToString();
               
                
            }
           

        }
        
        //Redirect to Cart Page

        

       
        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AddtoCart.aspx");
        }

        

        protected void logbutton_click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
            Response.Write("<script>alert('You have logged out successfully')</script>");
        }
    }
}