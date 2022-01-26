using iTextSharp.text.pdf;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Reflection.Metadata;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;

namespace ecommerce_project
{
    public partial class Pdf_generate : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                //check whether user is logged in or not
                if (Session["username"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
            string Orderid = Session["Orderid"].ToString();
            Label1.Text = Orderid;
            findorderdate(Label2.Text);
            string Address = Session["address"].ToString();
            Label3.Text = Address;
            showgrid(Label1.Text);
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(Control)
        }
        //will generate PDF
        protected void Button1_Click(object sender, EventArgs e)
        {
            exportpdf();
        }
        //function for exporting PDF
        private void exportpdf()
        {
            //Document type i.e pdf
            Response.ContentType = "application/pdf";
            //generate pdf with following name
            Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
            //cache is not saved
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //class for writing content
            StringWriter sw = new StringWriter();
            //class for writing html
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            //function to render all content which is inside of panel control
            Panel1.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            //defines document page size

            //Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            iTextSharp.text.Document pdfDoc = new iTextSharp.text.Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            //class for getting it into pdf format
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            //open connection
            pdfDoc.Open();
            //Parse all html's panel data
            htmlparser.Parse(sr);
            //closeconnection
            pdfDoc.Close();

        }
        private void findorderdate(string Orderid)
        {
            SqlConnection con = new SqlConnection("Data Source=LAPTOP-4KV1GCMU; Initial Catalog=OnlineLaptopDb; Integrated Security=True");
            SqlCommand cmd = new SqlCommand("Select * from OrderDetails where orderid='" + Label1.Text + "'");
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Label2.Text = ds.Tables[0].Rows[0]["Orderdate"].ToString();
            }
            con.Close();
        }

        //display purchased item in gridview
        private void showgrid(string orderid)
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("sno");
            dt.Columns.Add("productid");
            dt.Columns.Add("productname");
            dt.Columns.Add("quantity");
            dt.Columns.Add("price");
            dt.Columns.Add("totalprice");
            SqlConnection scon = new SqlConnection("Data Source=LAPTOP-4KV1GCMU; Initial Catalog=OnlineLaptopDb;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("Select * from OrderDetails where orderid='" + Label1.Text + "'");
            cmd.Connection = scon;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            int totalrows = ds.Tables[0].Rows.Count;
            int i = 0;
            int grandtotal = 0;
            while (i < totalrows)
            {
                dr = dt.NewRow();
                dr["sno"] = ds.Tables[0].Rows[i]["sno"].ToString();
                dr["productid"] = ds.Tables[0].Rows[i]["productid"].ToString();
                dr["productname"] = ds.Tables[0].Rows[i]["productname"].ToString();
                dr["quantity"] = ds.Tables[0].Rows[i]["quantity"].ToString();
                dr["price"] = ds.Tables[0].Rows[i]["price"].ToString();
                int price = Convert.ToInt32(ds.Tables[0].Rows[i]["price"].ToString());
                int quantity = Convert.ToInt16(ds.Tables[0].Rows[i]["quantity"].ToString());
                int totalprice = price * quantity;
                dr["totalprice"] = totalprice;
                grandtotal = grandtotal + totalprice;
                dt.Rows.Add(dr);
                i = i + 1;
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Label4.Text = grandtotal.ToString();
        }
    }
}
