using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_commmerce
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user-email"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                
                string email = (string)Session["user-email"];
                string connString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\sujit sahu\\source\\repos\\E_commmerce\\E_commmerce\\App_Data\\Database1.mdf\";Integrated Security=True";
                using (SqlConnection sqlConnection = new SqlConnection(connString))
                {
                    string query = "select * from registerUser where Email='" + email + "'";
                  
                    using (SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                    {

                        try
                        {
                            sqlConnection.Open();
                            SqlDataReader dr = sqlCommand.ExecuteReader();
                            if (dr.Read())
                            {
                                Prof_Name.Text = (string)dr[1];
                                Prof_email.Text = (string)dr[2];
                                Prof_phone.Text = (string)dr[4];


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

        protected void Prof_update_Click(object sender, EventArgs e)
        {

        }

        protected void Prof_logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("user_logout.aspx");

        }
    }
}