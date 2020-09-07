<%@ Page Title="Register" Language="C#" MasterPageFile="~/_LayoutMain.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=PreviewImage.ClientID%>').prop('src', e.target.result)
                };
                reader.readAsDataURL(input.files[0]);
                document.getElementById('<%=PreviewImage.ClientID%>').style.display = "block";
            }
        }
    </script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="margin: auto;">
        <div class="row">
            <div class="col-sm-12">
                <asp:Panel ID="Panel1" runat="server" DefaultButton="btnsignup" GroupingText="Hi there, signup to enter SFchat" HorizontalAlign="Left" Font-Names="'Oleo Script Swash Caps'">

                    <div class="row" style="text-align: center;">
                        <div class="col-md-6">
                            <asp:Image ID="ImageSignup" CssClass="signup_img" runat="server" OnContextMenu="return false;" draggable="false" ImageUrl="~/icon/4433.jpg" ImageAlign="Middle" />
                        </div>
                        <div class="col-md-6 signip_form">
                            <div class="title-box-2">
                                <asp:Label ID="LabelSignup" runat="server" Font-Bold="False" Font-Names="Consolas" ForeColor="Brown" Visible="False" CssClass="alert-danger"></asp:Label>
                            </div>
                            <br />


                            <div class="change-font">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline">
                                    <ContentTemplate>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div>
                                                    <asp:TextBox ID="txtname" runat="server" Style="border-radius: 10px;" Height="40px" Width="350px" Font-Bold="False" ValidationGroup="signup1" BorderColor="Blue" Font-Size="17px" ToolTip="enter your name" placeholder="enter name as John Duo" AutoCompleteType="Disabled" />
                                                </div>
                                                <div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname" CssClass="alert-danger" Display="Dynamic" ErrorMessage="full name required." Font-Bold="False" Font-Italic="False" Font-Names="Consolas" Font-Size="14px" ForeColor="Brown" SetFocusOnError="True" Style="text-align: center" ToolTip="Enter your correct full name." ValidationGroup="signup1"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtname" CssClass="alert-danger" Display="Dynamic" EnableTheming="True" ErrorMessage="enter first and last name where at least 3 characters " Font-Bold="False" Font-Names="Consolas" Font-Size="14px" ForeColor="Brown" SetFocusOnError="True" ValidationExpression="([A-Za-z\u0600-\u06FF]){3,}\s([A-Za-z\u0600-\u06FF]){3,}" ValidationGroup="signup1"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div>
                                                    <asp:TextBox ID="txtuname" runat="server" BorderColor="Blue" BorderStyle="Solid" Font-Bold="False" Font-Names="Bauhaus 93" Font-Size="17px" ForeColor="Black" Height="40px" placeholder="enter unique username" Style="border-radius: 10px;" TabIndex="1" ToolTip="enter unique username" ValidationGroup="signup1" Width="350px" AutoPostBack="True" OnTextChanged="txtuname_TextChanged" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>
                                                <div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtuname" Display="Dynamic" ErrorMessage="username is required!" Font-Names="Consolas" Font-Size="14px" ForeColor="Brown" SetFocusOnError="True" ToolTip="username is required!" ValidationGroup="signup1" CssClass="alert-danger"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtuname" CssClass="alert-danger" Display="Dynamic" EnableTheming="True" ErrorMessage="username have a length of at least of 4 digit" Font-Bold="False" Font-Names="Consolas" Font-Size="14px" ForeColor="Brown" SetFocusOnError="True" ValidationExpression="[a-zA-Z0-9|_|. ]{4,}$" ValidationGroup="signup1"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div>
                                                    <asp:TextBox ID="txtemail" Style="border-radius: 10px;" BorderStyle="Solid" runat="server" ForeColor="Black" Height="40px" Width="350px" Font-Bold="False" Font-Names="Bauhaus 93" TextMode="Email" ValidationGroup="signup1" Font-Size="17px" OnTextChanged="txtemail_TextChanged" placeholder="enter unique and valid e-mail" ToolTip="enter unique e-mail" AutoPostBack="True" TabIndex="1" BorderColor="Blue" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>
                                                <div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtemail" ErrorMessage="Please enter a valid email address" Font-Bold="False" Font-Names="Consolas" Font-Size="14px" ForeColor="Brown" SetFocusOnError="True" ValidationGroup="signup1" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" Display="Dynamic" EnableTheming="True" ErrorMessage="Please enter a valid email address" Font-Bold="False" Font-Italic="False" Font-Names="Consolas" Font-Size="14px" ForeColor="Brown" SetFocusOnError="True" ToolTip="Please enter a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="signup1" CssClass="alert-danger"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                        </div>



                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div>
                                                    <span style="color: red; font-variant: small-caps;"><mark>note:</mark> A password must have a length of at least of <b>10</b><br />
                                                        and containing at least<br />
                                                        <b>1</b> uppercase, <b>1</b> lowercase, <b>1</b> digit, <b>1</b> special character<br />
                                                        <br />
                                                    </span>
                                                    <asp:TextBox ID="txtpassword" Style="border-radius: 10px;" BorderStyle="Solid" runat="server" ForeColor="Black" Height="40px" Width="350px" Font-Bold="False" Font-Names="Bauhaus 93" TextMode="Password" ValidationGroup="signup1" Font-Size="17px" placeholder="enter strong password" ToolTip="enter unique password" TabIndex="3" BorderColor="Blue" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>
                                                <div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpassword" ErrorMessage="password required" Font-Bold="False" Font-Names="Consolas" Font-Size="14px" ForeColor="Brown" SetFocusOnError="True" ValidationGroup="signup1" Display="Dynamic" CssClass="alert-danger"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtpassword" EnableTheming="True" ErrorMessage="review note  ↑" Font-Bold="False" Font-Names="Consolas" ForeColor="Brown" SetFocusOnError="True" ValidationExpression="^(?=.{10,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$" ValidationGroup="signup1" Width="500px" Display="Dynamic" Font-Size="14px" CssClass="alert-danger"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div>
                                                    <asp:TextBox ID="txtcpassword" Style="border-radius: 10px;" BorderStyle="Solid" runat="server" ForeColor="Black" Height="40px" Font-Bold="False" Font-Names="Bauhaus 93" TextMode="Password" ValidationGroup="signup1" Font-Size="17px" placeholder="enter confirm of password" ToolTip="enter confirm password" TabIndex="4" BorderColor="Blue" Width="350px" AutoCompleteType="Disabled"></asp:TextBox>
                                                </div>
                                                <div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtcpassword" ErrorMessage="Password not match." Font-Bold="False" Font-Names="Consolas" Font-Size="14px" ForeColor="Brown" SetFocusOnError="True" ValidationGroup="signup1" Display="Dynamic" CssClass="alert-danger"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpassword" ControlToValidate="txtcpassword" CultureInvariantValues="True" ErrorMessage="Password not match." Font-Bold="False" Font-Italic="False" Font-Names="Consolas" ForeColor="Brown" SetFocusOnError="True" ToolTip="Password not match." ValidationGroup="signup1" Display="Dynamic" Font-Size="14px" CssClass="alert-danger"></asp:CompareValidator>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div>
                                                    <asp:TextBox ID="txtAge" runat="server" BorderColor="Blue" Font-Bold="False" Font-Names="Bauhaus 93" Font-Size="17px" Height="40px" max="70" min="20" placeholder="your age" step="1" Style="border-radius: 10px;" TabIndex="5" TextMode="Number" ToolTip="enter real age" type="number" ValidationGroup="signup1" Width="350px" AutoCompleteType="Disabled" />
                                                </div>
                                                <div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAge" Display="Dynamic" ErrorMessage="age is required" Font-Bold="False" Font-Names="Consolas" Font-Size="14px" ForeColor="Brown" SetFocusOnError="True" ValidationGroup="signup1" Width="160px" CssClass="alert-danger"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>



                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div>
                                            <div>
                                                <asp:Image ID="PreviewImage" CssClass="center-block PreviewImg" runat="server" Width="80px" BorderStyle="None" onContextMenu="return false;" draggable="false" AlternateText="Profile Picture" ToolTip="Profile Picture" />
                                                <label class="lblupfile" for="ImgUpload" style="color: red; font-weight: normal;">select profile picture</label>
                                            </div>
                                            <asp:FileUpload ID="ImgUpload" CssClass="form-control" runat="server" value="Choose a Profile Picture" Height="40px" Width="350px" Style="border-color: Blue; font-family: Bauhaus 93; font-weight: normal; border-radius: 10px; border-width: 2px;" accept=".png,.jpg,.jpeg,.gif,.ico" onchange="ImagePreview(this);" TabIndex="6" ToolTip="Choose picture for Profile" />
                                        </div>
                                        <div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ImgUpload" Display="Dynamic" ErrorMessage="Choose a Profile Picture" Font-Names="Consolas" Font-Size="14px" ForeColor="Brown" SetFocusOnError="True" ToolTip="Choose a Profile Picture" ValidationGroup="signup1" CssClass="alert-danger"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="ImgUpload" Display="Dynamic" ErrorMessage="This extention is not vaild" Font-Names="consol" ForeColor="Red" SetFocusOnError="True" ValidationExpression="(.*?)\.(jpg|jpeg|png|gif|ico|JPG|JPEG|PNG|GIF|ICO)$" ValidationGroup="signup1"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div class="col-md-12">
                                <div class="form-group">
                                    <div style="margin-top: 40px;">
                                        <asp:Button ID="btnsignup" runat="server" Font-Bold="False" Font-Size="20px" ForeColor="White" Height="40px" Text="sign up" Width="350px" OnClick="btnsignup_Click" Style="border-radius: 10px; text-align: center" TabIndex="7" BackColor="#4C1979" BorderColor="White" BorderStyle="Solid" BorderWidth="1px" ValidationGroup="signup1" />
                                    </div>
                                    <div style="margin: 20px; font-size: large;">
                                        <div>
                                            <asp:Label ID="LabelMsgChatsignup" runat="server" Font-Bold="false" ForeColor="#3333CC" Text=" Already a member ?"></asp:Label>
                                            <asp:HyperLink ID="HyperLink1login" runat="server" Font-Bold="False" NavigateUrl="~/login.aspx" Style="text-align: right" TabIndex="8" ToolTip="go to login form" CssClass="alert-link ">log in</asp:HyperLink>
                                        </div>
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
