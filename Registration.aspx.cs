using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Data.SqlClient;
using System.Web.UI;
using System.Configuration;
using System.Web.Security;
using System.Net;
using System.Web.Script.Serialization;
using System.IO;

public partial class Registration : System.Web.UI.Page
{
    // read the coonection string from web.config
    string conString = ConfigurationManager.ConnectionStrings["MessengerConnection"].ConnectionString;

    public string IPAddress { get; set; }
    public string CountryName { get; set; }
    public string CityName { get; set; }
    public string RegionName { get; set; }
    public string CountryCode { get; set; }
    public string ZipCode { get; set; }
    public string TimeZone { get; set; }
    public string DevicesType { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        txtname.Focus();
        //CheckUsername();
        //CheckEmail();
    }

    //*****************************************//costractor to take value in session to display in other page;*************//
    protected void txtuname_TextChanged(object sender, EventArgs e)
    {
        CheckUsername();
        Session["UserName"] = txtuname.Text;
    }
    protected void txtemail_TextChanged(object sender, EventArgs e)
    {
        CheckEmail();
    }

    protected void btnsignup_Click(object sender, EventArgs e)
    {
        LabelSignup.Visible = true;
        try
        {
            if (string.IsNullOrWhiteSpace(txtname.Text) || string.IsNullOrWhiteSpace(txtuname.Text) || string.IsNullOrWhiteSpace(txtemail.Text) || string.IsNullOrWhiteSpace(txtpassword.Text) || string.IsNullOrWhiteSpace(txtcpassword.Text) || string.IsNullOrWhiteSpace(txtAge.Text) || ImgUpload.FileContent.Length <= 0 || string.IsNullOrWhiteSpace(ImgUpload.FileName))
            {
                LabelSignup.Text = "All fields must be filled";
            }

            else
            {
                if (txtemail.BackColor == Color.LightCoral || txtuname.BackColor == Color.LightCoral)
                {
                   // LabelSignup.Text = "there are username or email was used";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "alert('Error : there are username or email are used'); ", true);
                    txtuname.Focus();
                }
                else if (txtemail.BackColor == Color.SpringGreen || txtuname.BackColor == Color.SpringGreen)
                {
                    InsertData();
                }
                else
                {
                }
            }
        }
        catch (Exception e1)
        {
            LabelSignup.Text = e1.Message;
        }
    }

    //*******************method check data******************************//
    protected void CheckUsername()
    {
        SqlConnection con = new SqlConnection(conString);
        con.Open();
        //confirm from email and user on database!!
        SqlCommand cmd = new SqlCommand("select * from UsersData where Username='" + txtuname.Text.Trim() + "'", con);
        SqlDataReader read = cmd.ExecuteReader();
        if (string.IsNullOrWhiteSpace(txtuname.Text))
        {
            txtuname.BackColor = Color.White;
        }
        else
        {
            if (read.HasRows)
            {
                txtuname.BackColor = Color.LightCoral;
                txtuname.ToolTip = "Unavailable ❌";
            }
            else
            {
                txtuname.BackColor = Color.SpringGreen;
                txtuname.ToolTip = "Perfect 👌";
            }
        }
        con.Close();
    }

    protected void CheckEmail()
    {
        SqlConnection con = new SqlConnection(conString);
        //confirm from email and user on database!!
        SqlCommand cmd = new SqlCommand("select * from UsersData where Email='" + txtemail.Text.Trim() + "'", con);
        con.Open();
        SqlDataReader read = cmd.ExecuteReader();
        if (string.IsNullOrWhiteSpace(txtemail.Text))
        {
            txtemail.BackColor = Color.White;
        }
        else
        {
            if (read.HasRows)
            {
                txtemail.BackColor = Color.LightCoral;
                txtemail.ToolTip = "Unavailable ❌";
            }
            else
            {
                txtemail.BackColor = Color.SpringGreen;
                txtemail.ToolTip = "Perfect 👌";
            }
        }
        con.Close();
    }

    private void InsertData()
    {
        //get IP 
        string ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (ipaddress == "" || ipaddress == null)
        {
            ipaddress = Request.ServerVariables["REMOTE_ADDR"];
        }
        // Get Data by IP
        string APIKey = "0b125cbd194ae7f525cb15d5a10832c2dad87e17441dc89b4b61a291d28fcef8";
        string url = string.Format("http://api.ipinfodb.com/v3/ip-city/?key={0}&ip={1}&format=json", APIKey, ipaddress);
        WebClient client = new WebClient();
        string json = client.DownloadString(url);
        Registration location = new JavaScriptSerializer().Deserialize<Registration>(json);

        //Detected Device type
        HttpBrowserCapabilities brows = Request.Browser;
        if (brows.IsMobileDevice)
        {
            DevicesType = "Smart Mobile Device";
        }
        else
        {
            DevicesType = "Desktop Device";
        }

        //encrypt password MD5
        string EncryptionPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtpassword.Text.Trim(), "MD5");

        // Database
        SqlConnection con = new SqlConnection(conString);
        SqlCommand cmd = new SqlCommand("Insert into UsersData (Name,Username, Email, Password,Age,Avater,Ip_Address,CountryName,CityName,RegionName,CountryCode,ZipCode,TimeZone,Machein,TimeDate) values('" + txtname.Text.Trim() + "','" + txtuname.Text.Trim() + "', '" + txtemail.Text.Trim() + "', '" + EncryptionPassword + "','" + txtAge.Text.Trim() + "','" + "~/Avater/"+ ImgUpload.FileName.Trim()+ "','" + location.IPAddress + "','" + location.CountryName + "','" + location.CityName + "','" + location.RegionName + "','" + location.CountryCode + "','" + location.ZipCode + "','" + location.TimeZone + "','" + DevicesType + "','" + DateTime.UtcNow.ToString("dd/MM/yyyy hh:mm:ss tt") + "')", con);
        ImgUpload.SaveAs(Server.MapPath("~/Avater/" + Path.GetFileName(ImgUpload.FileName)));
        con.Open();

        bool Status = Convert.ToBoolean(cmd.ExecuteNonQuery());
        con.Close();

        if (Status)     //?
        {
            cmd = new SqlCommand("update UsersData set Status = 1 where Username = @Username", con);
            cmd.Parameters.AddWithValue("@Username", txtuname.Text); //Server.HtmlEncode()
            con.Open();
            cmd.ExecuteNonQuery();
            Response.Redirect("Chat.aspx");   //yes go online
            con.Close();
        }
        else
        {
            LabelSignup.Text = "An unexpected problem occurred";
        }
    }



    protected override void OnPreRender(EventArgs e) //to keep password in filed
    {
        txtpassword.Attributes.Add("value", txtpassword.Text);
        txtcpassword.Attributes.Add("value", txtcpassword.Text);
        base.OnPreRender(e);
    }
}
