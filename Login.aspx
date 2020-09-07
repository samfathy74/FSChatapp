<%@ Page Title="Login" Language="C#" MasterPageFile="~/_LayoutMain.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Style/CSSstyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <asp:Panel ID="PanelClicklogin" runat="server" DefaultButton="BtnLogin" GroupingText="Hi there, login to enter SFchat" HorizontalAlign="Left" Font-Names="Oleo Script Swash Caps">
                    <div class="row" style="text-align: center;">

                        <div class="col-md-6">
                            <asp:Image ID="Imagelogin2" CssClass="login_img" runat="server" onContextMenu="return false;" draggable="false" ImageUrl="~/icon/chat1.svg" />
                        </div>

                        <div class="col-md-6 login_form">
                            <div class="title-box-2"><asp:Label ID="Labellogin" runat="server" Font-Bold="True" Font-Names="Consolas" ForeColor="Brown" Visible="False" CssClass="alert-danger"></asp:Label></div>
                            <br />
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div><asp:TextBox ID="txtnamelogin" runat="server" BorderColor="Blue" BorderStyle="Solid" Font-Bold="false" Font-Names="Bauhaus 93" Font-Size="17px" ForeColor="Black" Height="40px" OnTextChanged="txtnamelogin_TextChanged" placeholder="username" Style="border-radius: 10px;padding: 10px;" ToolTip="enter username" ValidationGroup="login" Width="300px" autofoucs AutoCompleteType="Disabled"></asp:TextBox></div>
                                    <div><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnamelogin" Display="Dynamic" ErrorMessage="username required!" Font-Names="Consolas" Font-Size="14px" ForeColor="Brown" SetFocusOnError="True" ToolTip="username or required!" ValidationGroup="login" CssClass="alert-danger"></asp:RequiredFieldValidator></div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <div><asp:TextBox ID="txtpasswordlogin" runat="server" BorderColor="Blue" BorderStyle="Solid" Font-Bold="False" Font-Names="Bauhaus 93" Font-Size="17px" ForeColor="Black" Height="40px" placeholder="password" Style="border-radius: 10px;padding: 10px;" TabIndex="1" TextMode="Password" ToolTip="enter password" ValidationGroup="login" Width="300px" AutoCompleteType="Disabled"></asp:TextBox></div>
                                    <div><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtpasswordlogin" Display="Dynamic" ErrorMessage="password required!" Font-Names="Consolas" Font-Size="14px" ForeColor="Brown" SetFocusOnError="True" ToolTip="Password required!" ValidationGroup="login" CssClass="alert-danger"></asp:RequiredFieldValidator></div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <div><asp:Button ID="BtnLogin" runat="server" Font-Bold="True" Font-Names="Oleo Script Swash Caps" Font-Size="Large" ForeColor="White" OnClick="BtnLogin_Click" Style="border-radius: 10px;" TabIndex="2" Text="log in" ValidationGroup="login" Width="300px" CssClass="btn" BackColor="#4C1979" /></div>
                                    <div style="margin:20px;font-size:large;"><asp:Label ID="LabelMsgChatsignup0" runat="server" Font-Bold="True" ForeColor="#3333CC" Text="Don’t have an account?"></asp:Label>
                                        <asp:HyperLink ID="HyperLink1Signup0" runat="server" Font-Bold="True" NavigateUrl="~/Registration.aspx" Style="text-align: right; left: 0px; top: 0px;" TabIndex="3" ToolTip="go to signUp form" CssClass="alert-link">Sign Up</asp:HyperLink>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>

</asp:Content>
