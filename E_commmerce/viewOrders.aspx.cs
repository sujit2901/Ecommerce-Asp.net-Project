using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_commmerce
{
    public partial class viewOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user-email"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {



                string conString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\sujit sahu\\source\\repos\\E_commmerce\\E_commmerce\\App_Data\\Database1.mdf\";Integrated Security=True";
                using (SqlConnection sqlConn = new SqlConnection(conString))
                {
                    int orderid = Int32.Parse(Request.QueryString["orderid"]);
                    int userid = (int)Session["user-id"];
                    string total = $"SELECT Total FROM orders WHERE (orderId ={orderid})";

                    using (SqlCommand sql = new SqlCommand(total, sqlConn))
                    {

                        try
                        {
                            sqlConn.Open();
                            SqlDataReader dr = sql.ExecuteReader();
                            if (dr.Read())
                            {
                                Label1.Text = (String)dr[0];

                            }
                        }
                        catch
                        {

                        }
                        finally
                        {
                            sqlConn.Close();
                        }


                    }


                }

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment; filename=Invoice.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            DataList1.RenderControl(hw);
            GridView1.RenderControl(hw);
            Label1.RenderControl(hw);

            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10, 10, 0, 0);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            Response.Close();
        }
    }
}