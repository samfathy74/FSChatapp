using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ControlPanel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    private void AuthenticateData()
    {
        if (Login1.UserName.Trim()=="Root@2020" && Login1.Password.Trim()=="Root@2020") //true
        {
            Panel1.Visible = true;
            Panel1.Enabled = true;

            Panel2.Visible = true;
            Panel2.Enabled = true;

            Login1.Visible = false;
            Login1.Enabled = false;

            HtmlGenericControl FooterControl = (HtmlGenericControl)Page.Master.FindControl("ContentFooter");
            FooterControl.Visible = false;
            HtmlGenericControl header = (HtmlGenericControl)Page.Master.FindControl("main_header");
            header.Visible = false;
        }
        else //false
        {
            Login1.FailureText = "username or password incorrect";
            Login1.FailureTextStyle.ForeColor = System.Drawing.Color.Red;
        }
    }


    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        AuthenticateData();
    }
}