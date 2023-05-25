using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_commmerce
{
    public partial class WebForm1 : System.Web.UI.Page
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
                                totalsum.InnerHtml = "&#x20b9; " + (int)dr[0];

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
                int ProductId = Int32.Parse(Request.QueryString["product_id"]);
                if (ProductId>0){
                    
                    int UserId = (int)Session["user-id"];
                    int uid = (UserId * 1000) + ProductId;
                    string connString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\sujit sahu\\source\\repos\\E_commmerce\\E_commmerce\\App_Data\\Database1.mdf\";Integrated Security=True";
                    using (SqlConnection sqlConnection = new SqlConnection(connString))
                    {
                        string query = $"insert into cart values ({uid},{UserId},{ProductId},1)";

                        using (SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                        {
                            try
                            {
                                sqlConnection.Open();
                                int flag = sqlCommand.ExecuteNonQuery();
                                Response.Redirect("AddCart.aspx?product_id=0");
                                
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
    }
}