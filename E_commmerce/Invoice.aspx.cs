using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PuppeteerSharp;

using System.Runtime.Remoting.Contexts;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.html;
using Org.BouncyCastle.OpenSsl;
using System.IO.Ports;
using System.IO;

namespace E_commmerce
{
    public partial class Invoice : System.Web.UI.Page
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
                    int userid = (int)Session["user-id"];
                    string total = $"SELECT SUM(Quantity*Price) as total FROM cart INNER JOIN Product ON cart.ProductId=Product.Id WHERE (UserID ={userid})";

                    using (SqlCommand sql = new SqlCommand(total, sqlConn))
                    {

                        try
                        {
                            sqlConn.Open();
                            SqlDataReader dr = sql.ExecuteReader();
                            if (dr.Read())
                            {
                                Label1.Text = "Total Amount: &#x20b9; " + (int)dr[0];

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
        protected void Button1_Click(object sender, EventArgs e)
        {
            Random rnd = new Random();
            int userid = (int)Session["user-id"];
            string insertord = "";

            string conString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\sujit sahu\\source\\repos\\E_commmerce\\E_commmerce\\App_Data\\Database1.mdf\";Integrated Security=True";
            using (SqlConnection sqlConnection = new SqlConnection(conString))
            {
                string query = $"SELECT [Name], [Quantity],[Price] FROM [cart] INNER JOIN Product ON cart.ProductId=Product.Id WHERE ([UserID] = {userid})";
                
                using (SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                {
                    try
                    {
                        sqlConnection.Open();
                        SqlDataReader dr = sqlCommand.ExecuteReader();
                        int uid = rnd.Next(100000);
                        while (dr.Read())
                        {

                            string param = " (" + uid + "," + userid + ",'" + dr[0] + "'," + dr[2] + "," + dr[1] + ",'" + Label1.Text + "'),";
                            insertord += param;


                        }

                    }
                    catch
                    {

                    }
                    finally
                    {
                        sqlConnection.Close();
                    }
                }
                string newStr = insertord.Substring(0, insertord.Length - 1);
                string ord = "insert into orders values" + newStr;
              
                using (SqlCommand sql = new SqlCommand(ord, sqlConnection))
                {
                    try
                    {
                        sqlConnection.Open();
                        sql.ExecuteNonQuery();
                        
                    }
                    catch
                    {

                    }
                    finally
                    {
                        sqlConnection.Close();
                    }

                }
                string del = $"delete from cart where UserId={userid}";
                using (SqlCommand sqlCommand1 = new SqlCommand(del, sqlConnection))
                {
                    try
                    {
                        sqlConnection.Open();
                        sqlCommand1.ExecuteNonQuery();
                        Response.Redirect("orders.aspx");
                    }
                    catch { }
                    finally { sqlConnection.Close(); }

                }
            }

            
            
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
           
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