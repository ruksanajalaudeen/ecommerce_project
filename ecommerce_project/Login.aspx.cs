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
    public partial class Login : System.Web.UI.Page
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
            SqlDataAdapter sda = new SqlDataAdapter("select * from Records3 where Fname='" + TextBox1.Text + "' and Password='" + TextBox2.Text+ "' ", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            
            if (TextBox1.Text == "Admin" & TextBox2.Text == "123")
            {
                Session["admin"] = TextBox1.Text;
                Response.Redirect("AdminHome.aspx");
            }
            else if (dt.Rows.Count == 1)
            {
                Session["username"] = TextBox1.Text;
                Session["buyitems"] = null;
                fillSavedCart();
                Response.Redirect("Default.aspx");
            }
            else
            {
                Lable1.ForeColor = System.Drawing.Color.Red;
                Lable1.Text = "Login Failed";
            }
        }
        //Redirects you to Register Page
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
        //After User logedin it will all cart items which were addedby the user & storing it in a Session
        private void fillSavedCart()
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("sno");
            dt.Columns.Add("pid");
            dt.Columns.Add("pname");
            dt.Columns.Add("pimage");
            dt.Columns.Add("pdesc");
            dt.Columns.Add("pprice");
            dt.Columns.Add("pquantity");
            dt.Columns.Add("pcategory");
            dt.Columns.Add("ptotalprice");
            String mycon = "Data Source=LAPTOP-4KV1GCMU;Initial Catalog=OnlineLaptopDb; Integrated Security= True";
            SqlConnection scon = new SqlConnection(mycon);
            String myquery = "select * from CartDetailsss where Username='" + Session["username"].ToString() + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = scon;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                int i = 0;
                int counter = ds.Tables[0].Rows.Count;
                while (i < counter)
                {
                    dr = dt.NewRow();
                    dr["sno"] = 1 + 1;
                    dr["pid"] = ds.Tables[0].Rows[i]["ProductId"].ToString();
                    dr["pname"] = ds.Tables[0].Rows[i]["Pname"].ToString();
                    dr["pimage"] = ds.Tables[0].Rows[i]["Pimage"].ToString();
                    dr["pdesc"] = ds.Tables[0].Rows[0]["Pdesc"].ToString();
                    dr["pprice"] = ds.Tables[0].Rows[i]["Pprice"].ToString();
                    dr["pquantity"] = ds.Tables[0].Rows[i]["Pquantity"].ToString();
                    dr["pcategory"] = ds.Tables[0].Rows[0]["Pcategory"].ToString();
                    int price = Convert.ToInt32(ds.Tables[0].Rows[i]["pprice"].ToString());
                    int quantity = Convert.ToInt16(ds.Tables[0].Rows[i]["pquantity"].ToString());
                    int totalprice = price * quantity;
                    dr["ptotalprice"] = totalprice;
                    dt.Rows.Add(dr);
                    i = i + 1;
                }
            }
            else
            {
                Session["buyitems"] = null;
            }
            Session["buyitems"] = dt;
        }

    }
}
    

  