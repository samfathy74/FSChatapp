using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI.WebControls;
public partial class Login : System.Web.UI.Page
{
    // read the coonection string from web.config
    string conString = ConfigurationManager.ConnectionStrings["MessengerConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
      if(User.Identity.IsAuthenticated)
      {
            Response.Redirect("Chat.aspx");
      }
    }
    //******************************************************button login***************************************************************//
    
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(conString);
        con.Open();
        if (Page.IsValid||!string.IsNullOrWhiteSpace(txtnamelogin.Text)||!string.IsNullOrWhiteSpace(txtpasswordlogin.Text))
        {
            //encrypt password MD5
            string DecryptionPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtpasswordlogin.Text.Trim(), "MD5");

            // declare the command that will be used to execute the select statement sql
            SqlCommand cmd = new SqlCommand("SELECT count(*) FROM UsersData WHERE Username =@Username AND Password=@Password", con);
            cmd.Parameters.AddWithValue("@Username", txtnamelogin.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", DecryptionPassword);


            bool UserAndPasswordExist = Convert.ToBoolean(cmd.ExecuteScalar());
            con.Close();

            if (UserAndPasswordExist)     //?
            {
                cmd = new SqlCommand("update UsersData set Status = 1 where Username = @Username", con);
                cmd.Parameters.AddWithValue("@Username", txtnamelogin.Text.Trim()); 
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("Chat.aspx");   //yes go online
            }
            else
            {
                Labellogin.Visible = true;
                Labellogin.Text = "Username or Password Incorrect";     //no
            }

            con.Close();
        }
        else
        {
            Labellogin.Visible = true;
            Labellogin.Text = "Username or Password required";
        }
    }
    //*****************************************************TextBox****************************************************************//
    protected void txtnamelogin_TextChanged(object sender, EventArgs e)
    {
        Session["UserName"] = txtnamelogin.Text;
    }

}