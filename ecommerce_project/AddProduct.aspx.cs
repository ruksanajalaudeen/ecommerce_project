using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce_project
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Check whether Admin is logged in or not
                if (Session["admin"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
              
            }
        }
        protected void buttonsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=LAPTOP-4KV1GCMU;Initial Catalog=OnlineLaptopDb;Integrated Security=True");
            if (imageUploaded.HasFile)
            {
                string filename = imageUploaded.PostedFile.FileName;
                string filepath = "Images/" + imageUploaded.FileName;
                imageUploaded.PostedFile.SaveAs(Server.MapPath("~/Images/") + filename);
                con.Open();
                //SqlCommand cmd = new SqlCommand("Insert into Product1 values('" + txtName.Text.ToString() + "','" + txtDes.Text.ToString() + "','" + Convert.ToInt32(txtprice.Text) + "','" + txtQuantity.Text.ToString() + "','" + filepath + "','" + DropDownList1.SelectedItem.Text + "')", con);
                SqlCommand cmd = new SqlCommand("Insert into Product1 values('" + txtName.Text + "','" + txtDes.Text + "','" + filepath + "','" + Convert.ToInt32(txtprice.Text) + "','" + txtQuantity.Text + "','" + DropDownList1.SelectedItem.Text + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('One product added.');</script>");
                //Response.Redirect("Default.aspx");
            }
        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}