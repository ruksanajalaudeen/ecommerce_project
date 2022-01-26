using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce_project
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                //Check is User is Already Login or Not
                if (Session["username"] != null)
                {
                    Response.Redirect("Default.aspx");
                }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=LAPTOP-4KV1GCMU;Initial Catalog=OnlineLaptopDb;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into Records3" + "(Fname,Lname,Email,Gender,Address,Phone,Password) values (@Fname,@Lname,@Email,@Gender,@Address,@Phone,@Password)", con);
            cmd.Parameters.AddWithValue("@Fname", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Lname", TextBox2.Text);
            cmd.Parameters.AddWithValue("@Email", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Gender", DropDownList1.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@Address", TextBox4.Text);
            cmd.Parameters.AddWithValue("@Phone", TextBox5.Text);
            cmd.Parameters.AddWithValue("@Password", TextBox6.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Lable1.Text = "Registered Successfully";
            ClearText();
        }
        //Clearing all fields after user is registerd
        private void ClearText()
        {
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            TextBox3.Text = string.Empty;
            TextBox4.Text = string.Empty;
            TextBox5.Text = string.Empty;
            TextBox6.Text = string.Empty;
        }
    }
}
