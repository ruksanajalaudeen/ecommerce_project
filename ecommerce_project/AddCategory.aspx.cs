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
    public partial class AddCategory1 : System.Web.UI.Page
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=LAPTOP-4KV1GCMU; " +
            "Initial Catalog=OnlineLaptopDB; Integrated Security=True");
            conn.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from Category where CategoryName='" + TextBox1.Text.ToString() + "' ", conn);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            //Check whether the added category is already present or not
            if (dt.Rows.Count == 1)
            {
                Response.Write("<script>alert('This Category is Already Present');</script>");
            }
            else
            {

                SqlConnection conns = new SqlConnection("Data Source=LAPTOP-4KV1GCMU; " +
            "Initial Catalog=OnlineLaptopDB; Integrated Security=True");
                conns.Open();
                SqlCommand cmd = new SqlCommand("Insert into Category values (@Cname)", conns);
                cmd.Parameters.AddWithValue("@Cname", TextBox1.Text.Trim());
                cmd.ExecuteNonQuery();
                conns.Close();
                Response.Write("<script>alert('One Record Added');</script>");
                TextBox1.Text = "";
                ShowGrid();
            }
        }
        //Displays Category in GridView
        public void ShowGrid()
        {
            SqlConnection connn = new SqlConnection("Data Source=LAPTOP-4KV1GCMU; " +
            "Initial Catalog=OnlineLaptopDB; Integrated Security=True");
            connn.Open();
            SqlDataAdapter sda = new SqlDataAdapter("Select * from Category", connn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        //Cancelling GridView RowEdit
        protected void GridView1_RowCancellingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            ShowGrid();
        }
        //Deleting category
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int CId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            SqlConnection con1 = new SqlConnection("Data Source=LAPTOP-4KV1GCMU; " +
            "Initial Catalog=OnlineLaptopDB; Integrated Security=True");
            con1.Open();
            SqlCommand cmd1 = new SqlCommand("Delete from Category where CategoryId=@1", con1);
            cmd1.Parameters.AddWithValue("@1", CId);
            cmd1.ExecuteNonQuery();
            con1.Close();
            Response.Write("<script>alert('Category Deleted Successful');</script>");
            ShowGrid();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            ShowGrid();
        }
        //Updating category
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int cId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string CategoryName = (row.FindControl("TextBox2") as TextBox).Text;
            SqlConnection con2 = new SqlConnection("Data Source=LAPTOP-4KV1GCMU; " +
            "Initial Catalog=OnlineLaptopDB; Integrated Security=True");
            con2.Open();
            SqlCommand cmd1 = new SqlCommand("Update Category set CategoryName=@1 where CategoryId=@2", con2);
            cmd1.Parameters.AddWithValue("@1", CategoryName);
            cmd1.Parameters.AddWithValue("@2", cId);
            cmd1.ExecuteNonQuery();
            con2.Close();
            Response.Write("<script>alert('Cart Updated Successful');</script>");
            GridView1.EditIndex = -1;
        }
        //Calls when GridView page changes
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowGrid();
        }

    }
}