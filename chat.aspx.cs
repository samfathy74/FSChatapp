using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class chat : System.Web.UI.Page
{
    public string MsgFrm = "You have a message from";
    string conString = ConfigurationManager.ConnectionStrings["MessengerConnection"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Timeout == 0)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("Login.aspx");
        }
        else
        {
            if (Session["UserName"] != null)
            {
                Master.logout.Visible = true;
                Master.lblusername.Text = "Hello ," + Session["UserName"].ToString();
                Master.login.Visible = false;
                Master.imgprofile.Visible = true;
                Master.signup.Visible = false;
                LabelSender.Text = Session["UserName"].ToString();

                HtmlGenericControl FooterControl = (HtmlGenericControl)Page.Master.FindControl("ContentFooter");
                FooterControl.Visible = false;

                SqlConnection con = con = new SqlConnection(conString);
                SqlCommand cmd;
                cmd = new SqlCommand("select Avater from UsersData where Username='" + Session["UserName"].ToString() + "'", con);
                con.Open();
                SqlDataReader read = cmd.ExecuteReader();
                while (read.Read())
                {
                    Master.imgprofile.ImageUrl = read["Avater"].ToString();
                }
                con.Close();

            }
            else
            {
                Response.Redirect("Login.aspx");
            }


            if (!IsPostBack)
            {
                LoadChatList();
                txtboxMsg.Focus();
            }
            else
            {
                int count = CheckNewMsg();
                if (DataList4.Items.Count > 0)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "javascript:PlayTone()", true);
                    LoadChatList();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "javascript:PauseTone()", true);
                }

            }

            Page.Title = "Hi, " + LabelSender.Text;
        }
    }

    protected void UsernameLabel_Click(object sender, EventArgs e)
    {
        LabelRecevier.Text = ((LinkButton)sender).Text;
        LoadChatList();
        MsgPanel.Visible = true;
        txtboxMsg.Focus();
    }

    //صندوق الرسايل الجديد
    int CheckNewMsg()
    {
        int count = 0;
        count= DataList4.Items.Count;
        return count;
    }

    //عرض الشات 
    void LoadChatList()
    {
        con = new SqlConnection(conString);
        cmd = new SqlCommand("select Sender,ChatMsg from Chat where (Sender = @Sender and Receiver = @Receiver) or (Sender = @VSender and Receiver = @VReceiver) order by Id", con);
        cmd.Parameters.AddWithValue("@sender", LabelSender.Text);
        cmd.Parameters.AddWithValue("@Receiver", LabelRecevier.Text);
        cmd.Parameters.AddWithValue("@VSender", LabelRecevier.Text);
        cmd.Parameters.AddWithValue("@VReceiver", LabelSender.Text);
        con.Open();

        DataSet ds = new DataSet();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(ds);

        DataList2.DataSource = ds.Tables[0];
        DataList2.DataBind();
        // DataList2.;
        con.Close();
        SeenMsg();
    }

    // لو اليوزر شاف الرساله 
    void SeenMsg()
    {
        con = new SqlConnection(conString);
        cmd = new SqlCommand("update Chat set RecevierSeen = 1 where Receiver = @Receiver and Sender = @Sender", con);
        cmd.Parameters.AddWithValue("@Receiver", LabelSender.Text.Trim());
        cmd.Parameters.AddWithValue("@Sender", LabelRecevier.Text.Trim());
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

    }

    protected void ButtonSend_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtboxMsg.Text))
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "alert('Enter Message!'); ", true);
            txtboxMsg.Focus();
        }
        else if (string.IsNullOrWhiteSpace(LabelRecevier.Text))
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "alert('Choose Friend to begain chat!'); ", true);
            txtboxMsg.Focus();
        }
        else
        {
            try
            {
                con = new SqlConnection(conString);
                cmd = new SqlCommand("Insert into Chat (ChatMsg, Sender, Receiver,DateTime) values(@ChatMsg, @Sender, @Receiver,@DateTime)", con);
                cmd.Parameters.AddWithValue("@ChatMsg", txtboxMsg.Text);
                cmd.Parameters.AddWithValue("@Sender", LabelSender.Text.ToLower());
                cmd.Parameters.AddWithValue("@Receiver", LabelRecevier.Text.ToLower());
                cmd.Parameters.AddWithValue("@DateTime", DateTime.Now.ToString("dd/MM/yyyy hh:mm tt"));
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                txtboxMsg.Text = "";
                txtboxMsg.Focus();

                LoadChatList();
            }
            catch (Exception ex)
            {
                FormsAuthentication.SignOut();
                Response.Redirect("Login.aspx");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "alert('"+ex+"'); ", true);
            }
        }
    }

    protected void Timer1_Tick1(object sender, EventArgs e)
    {
        DataList1.DataBind();
        DataList3.DataBind();
        DataList4.DataBind();
        LoadChatList();
    }


    protected string StyleChat(string str)
    {
        if (string.Equals(Server.HtmlEncode(str), Server.HtmlEncode(LabelSender.Text), StringComparison.OrdinalIgnoreCase))
        {
            return "SenderClass";
        }
        return "ReceiverClass";
    }

    //condation for title conversation;
    protected string ExchangeTitle(string title)
    {
        if (String.IsNullOrWhiteSpace(title))
        {
            return "Welcome, " + LabelSender.Text.ToUpper();
        }
        return title;
    }
}