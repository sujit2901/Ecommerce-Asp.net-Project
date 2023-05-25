using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_commmerce.Admin
{
    public partial class Admin_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Response.Redirect("home.aspx");
            }
            

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            String user = username.Text;
            String pass=password.Text;  
            String connString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\sujit sahu\\source\\repos\\E_commmerce\\E_commmerce\\App_Data\\Database1.mdf\";Integrated Security=True";
            using (SqlConnection connection=new SqlConnection(connString))
            {
                String str = "select count(*) from Admin Where Username='"+user+"' and password='"+pass+"'";
                using (SqlCommand sqlCommand=new SqlCommand(str, connection))
                {
                    try
                    {
                        connection.Open();
                        SqlDataReader dr = sqlCommand.ExecuteReader();
                        if (dr.Read())
                        { int count = (int)dr[0];
                            if (count== 1)
                            {
                                Session["username"] = user;
                                Response.Redirect("home.aspx");
                                
                            }
                            else
                            {
                                notify.InnerHtml = "<div aria-live='polite' aria-atomic='true' class='position-relative'>  <div class='toast-container top-0 end-0 p-3' style='padding-left: 80vw!important;'><div style='opacity: inherit;' class='toast align-items-center me-auto text-light bg-danger border-0' role='alert' aria-live='assertive' aria-atomic='true'> <div class='d-flex'>    <div class='toast-body text-light'>     Invalid username or Password.    </div>   <button type='button' class='btn-close btn-close-white me-2 m-auto' data-bs-dismiss='toast' aria-label='Close'></button> </div></div></div></div>";


                            }
                        }

                    }
                    catch {
                        notify.InnerHtml = "<div aria-live='polite' aria-atomic='true' class='position-relative'>  <div class='toast-container top-0 end-0 p-3' style='padding-left: 80vw!important;'><div style='opacity: inherit;' class='toast align-items-center me-auto text-light bg-danger border-0' role='alert' aria-live='assertive' aria-atomic='true'> <div class='d-flex'>    <div class='toast-body text-light'>     User Not Found.    </div>   <button type='button' class='btn-close btn-close-white me-2 m-auto' data-bs-dismiss='toast' aria-label='Close'></button> </div></div></div></div>";


                    }
                    finally { 
                        connection.Close();
                    } 
                }
            }
        }
    }
}