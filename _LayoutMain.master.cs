using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _LayoutMain : System.Web.UI.MasterPage
{
    string conString = ConfigurationManager.ConnectionStrings["MessengerConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    public Image imgprofile
    {
        get { return this.ImageProfile; }
    }

    public Label lblusername
    {
        get { return this.lbluser; }
    }

    public LinkButton logout
    {
        get { return this.linklogout; }
    }

    public LinkButton signup
    {
        get { return this.linksignup; }
    }

    public LinkButton login
    {
        get { return this.linklogin; }
    }

    protected void linklogout_Click(object sender, EventArgs e)
    {
        try
        {
            if (lbluser.Text != null || Session.Timeout != 0) 
            {
                SqlConnection con = new SqlConnection(conString);
                SqlCommand cmd = new SqlCommand("UPDATE UsersData SET Status = 0 WHERE Username='" + Session["UserName"].ToString() + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                FormsAuthentication.SignOut();
                Session.Abandon();
                HttpContext.Current.Session.Abandon();
                Session.RemoveAll();
                Response.Redirect("login.aspx");
            }
            else
            {
                FormsAuthentication.SignOut();
            }
        }
        catch (Exception ex)
        {
            Session.Timeout = 0;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "alert('error : " + ex + "'); ", true);
            Session["Name"] = null; //kill session
            Session.Abandon();
            //  Session.Clear();
            FormsAuthentication.SignOut();
            Session.RemoveAll();
            HttpContext.Current.Session.Abandon();
            Response.Redirect("Login.aspx");
        }


    }
}