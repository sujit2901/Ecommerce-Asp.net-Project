using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_commmerce
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void userregister_Click(object sender, EventArgs e)
        {   
            string connString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\sujit sahu\\source\\repos\\E_commmerce\\E_commmerce\\App_Data\\Database1.mdf\";Integrated Security=True";
            using (SqlConnection sqlConnection=new SqlConnection(connString))
            {
                string query = $"insert into registerUser values('{name.Text}','{useremail.Text}','{userpassword.Text}','{phone.Text}')";
                using (SqlCommand cmd = new SqlCommand(query, sqlConnection)){
                    sqlConnection.Open();
                    try
                    {
                        int RowAffected= cmd.ExecuteNonQuery();
                       
                    }
                    catch {
                        Response.Write("");
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