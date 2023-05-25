using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_commmerce
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user-email"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                string connString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\sujit sahu\\source\\repos\\E_commmerce\\E_commmerce\\App_Data\\Database1.mdf\";Integrated Security=True";
                using (SqlConnection sqlConnection = new SqlConnection(connString))
                {
                    
                    try
                    {
                        int userid = (int)Session["user-id"];
                        string incre = Request.QueryString["incre"];
                        int ProductId = Int32.Parse(Request.QueryString["id"]);
                       

                        if (incre == "true")
                        {
                            string query = $"update cart set quantity=quantity+1 Where Userid={userid} and ProductId={ProductId}";
                            Response.Write(query);
                            using (SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                            {
                                sqlConnection.Open();
                                int flag = sqlCommand.ExecuteNonQuery();
                                Response.Redirect("AddCart.aspx?product_id=0");


                            }
                        }
                        else
                        {
                            int quant = Int32.Parse(Request.QueryString["quant"]);
                            if (quant > 1)
                            {
                                string dec = $"update cart set quantity=quantity-1 Where Userid={userid} and ProductId={ProductId}";
                                Response.Write(dec);
                                using (SqlCommand sql = new SqlCommand(dec, sqlConnection))
                                {
                                    sqlConnection.Open();
                                    int flag = sql.ExecuteNonQuery();
                                    Response.Redirect("AddCart.aspx?product_id=0");


                                }
                            }
                            else
                            {
                                string del = $"delete cart Where Userid={userid} and ProductId={ProductId}";
                                Response.Write(del);
                                using (SqlCommand sqldel = new SqlCommand(del, sqlConnection))
                                {
                                    sqlConnection.Open();
                                    int flag = sqldel.ExecuteNonQuery();
                                    Response.Redirect("AddCart.aspx?product_id=0");


                                }
                            }

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
            }
        }
    }
}