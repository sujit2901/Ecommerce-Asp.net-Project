using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.NetworkInformation;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_commmerce.Admin
{
    public partial class AddProduct : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Admin_login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            String connString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\sujit sahu\\source\\repos\\E_commmerce\\E_commmerce\\App_Data\\Database1.mdf\";Integrated Security=True";
            using (SqlConnection sqlConnection=new SqlConnection(connString))
            {   String category = Prod_cat.Text;
                int price = Int32.Parse(prod_price.Text);
                int stock = Int32.Parse(prod_stock.Text);
     
                
                    Random rnd = new Random();  
                    string filename = Path.GetFileName(FileUpload1.FileName);
                    string folderPath = Server.MapPath("assets/images/product/"); // set the folder path where you want to save the file
                    string Image = "Img" + rnd.Next(1000) + filename;
                    string ImagePath = "assets/images/product/" + Image;
                    string filePath = folderPath + Image;
                    FileUpload1.PostedFile.SaveAs(filePath);
                    // file has been saved to the specified folder
               



                
                string query = $"insert into Product  values ('{Prod_name.Text}','{category}',{price},{stock},'{Prod_desc.Text}','{ImagePath}')";
              
                using (SqlCommand sqlCommand=new SqlCommand( query, sqlConnection))
                {   
                    sqlConnection.Open();
                    try
                    {
                        int rowsAffected = sqlCommand.ExecuteNonQuery();

                        // Check the number of rows affected by the query
                        if (rowsAffected > 0)
                        {
                            // The data was inserted successfully
                        }
                        else
                        {
                            // No data was inserted
                        }
                    }
                    catch {
                        Response.Write("Data not interested");
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