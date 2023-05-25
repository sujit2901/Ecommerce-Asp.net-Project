using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_commmerce
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            string user = useremail.Text;
            string pass=userpassword.Text;
            string connString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\sujit sahu\\source\\repos\\E_commmerce\\E_commmerce\\App_Data\\Database1.mdf\";Integrated Security=True"; 
            using (SqlConnection sqlConnection=new SqlConnection(connString))
            {
                String str = "select * from registerUser Where email='" + user + "' and password='" + pass + "'";
                using (SqlCommand sqlCommand=new SqlCommand(str,sqlConnection))
                {
                    
                    try
                    {
                        Response.Write(str);
                       
                        sqlConnection.Open();

                        SqlDataReader dr = sqlCommand.ExecuteReader();
                        if (dr.Read())
                        {

                                Session["user-id"] = dr[0];
                                Session["name"] = dr[1];
                                Session["phone"] = dr[4];
                                Session["user-email"] = user;
                                Response.Write(str);
                                Response.Redirect("profile.aspx");

                        
                        }

                    }
                    catch {
                        Response.Write("user name not Found");
                    }
                    finally { 
                        sqlConnection.Close();
                    }  

                }
            }
        }
    }
}