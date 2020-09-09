<%@ Page Title="" Language="C#" MasterPageFile="~/_LayoutMain.master" AutoEventWireup="true" CodeFile="chat.aspx.cs" Inherits="chat" %>

<%@ MasterType VirtualPath="~/_LayoutMain.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<%--<audio id="audioId" src="Tone/mix.wav" style="display: none; visibility: hidden;"></audio>--%>
    <script>
       // function PlayTone() {
         //   var player = document.getElementById('audioId');
           // setTimeout(function () {
             //   player.play();
               // setTimeout(function () {
                 //   player.pause();
                   // player.currentTime = 0;
              //  }, 5000);
           // }, 100);
      //  }

       // function PauseTone() {
         //   var pauser = document.getElementById('audioId');
          //  pauser.pause();
      //  }

        $(document).ready(function () {
            $(".online-content").slideUp();
            $(".notify-content").slideUp();
            $(".offline-content").slideUp();
            $(".main-body").slideUp();


            $(".NotifyPanel").click(function () {
                $(".notify-content").slideToggle();
                $(".online-content").slideUp();
                $(".offline-content").slideUp();
            });
            $(".OnlinePanel").click(function () {
                $(".online-content").slideToggle();
                $(".notify-content").slideUp();
                $(".offline-content").slideUp();
            });
            $(".OfflinePanel").click(function () {
                $(".offline-content").slideToggle();
                $(".notify-content").slideUp();
                $(".online-content").slideUp();

            });
        });
    </script>

    <div class="container">
        <div class="row" style="margin-bottom: 25px;">
            <div class="col-sm-15">
                <div class="col-md-8">
                    <div class="main" runat="server">
                        <div class="panel-body">
                            <div class="text-center hide-main">
                                <asp:UpdatePanel runat="server" UpdateMode="Conditional" RenderMode="Inline">
                                    <ContentTemplate>
                                        <div class="title" onclick="$('.main-body').slideToggle();"><i class="glyphicon glyphicon-chevron-down" style="float: right; margin-top: 5px;"></i><%= ExchangeTitle(LabelRecevier.Text.ToUpper())%><i class="glyphicon glyphicon-chevron-up" style="float: left; margin-top: 5px;"></i></div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                            <var style="float: right"></var>
                        </div>
                        <div class="main-body" id="id01">
                            <div class="main-content">
                                <div class="msgChat" style="max-height: 450px;">

                                    <asp:Panel runat="server" ID="chatPanel" DefaultButton="ButtonSend">
                                        <div style="vertical-align: auto; max-height: 100%;">
                                            <div>
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline">
                                                    <ContentTemplate>
                                                        <asp:DataList ID="DataList2" runat="server" HorizontalAlign="Center" RepeatLayout="Table">
                                                            <ItemTemplate>
                                                                <div class="<%# StyleChat(Eval("Sender").ToString()) %>  MainChatListClass">
                                                                    <asp:Label ID="LabelMsgSender" runat="server" Text='<%# Eval("Sender")%>' CssClass="UsenameMsg"></asp:Label><br />
                                                                    <asp:Label ID="LabelMsgChat" runat="server" CssClass="Msg-chat" Text='<%# Eval("ChatMsg")%>' maximunsize="280px" autosize="true"></asp:Label>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </asp:Panel>

                                </div>
                            </div>

                            <%-- section bottom --%>
                            <div class="staybottom">
                                <div class="panel-body">
                                    <asp:Panel ID="MsgPanel" runat="server" DefaultButton="ButtonSend">
                                        <asp:UpdatePanel runat="server" UpdateMode="Conditional" RenderMode="Inline">
                                            <ContentTemplate>
                                                <div class="form-group control-group">
                                                    <asp:TextBox ID="txtboxMsg" CssClass="txtbox form-control" runat="server" Height="45px" placeholder="Enter message" TextMode="SingleLine" ToolTip="Type for start chat" Font-Bold="False" Font-Names="Ebrima" Font-Size="Medium" AutoCompleteType="Disabled" autocomplete="off"></asp:TextBox>
                                                    <asp:Button ID="ButtonSend" runat="server" CssClass="btnsend btn btn-success" Height="45px" Text="Send ▶" ForeColor="White" Font-Size="Larger" TabIndex="1" OnClick="ButtonSend_Click" />
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </div>
                            </div>
                            <%-- End section bottom --%>
                        </div>
                    </div>
                </div>


                <div class="col-md-4">
                    <div class="side" runat="server">
                        <%--section side--%>
                        <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick1"></asp:Timer>
                        <asp:Panel ID="Panel1" runat="server" Height="100%">
                            <%--<div class="panel-danger">--%>
                            <asp:UpdatePanel runat="server" UpdateMode="Always" RenderMode="Block">
                                <ContentTemplate>
                                    <asp:Label ID="LabelSender" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="LabelRecevier" runat="server" Visible="False"></asp:Label>

                                    <%--section messages notification--%>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:MessengerConnection %>' SelectCommand="SELECT [Sender] FROM [Chat] WHERE (([RecevierSeen] = 0) AND ([Receiver] = @Receiver))">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="LabelSender" PropertyName="Text" Name="Receiver" Type="String"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger EventName="Tick" ControlID="Timer1" />
                                </Triggers>
                            </asp:UpdatePanel>

                            <div class="SidePanel">
                                <div class="text-center NotifyPanel">
                                    <div class="text-center">
                                        <b>
                                            <asp:UpdatePanel runat="server" UpdateMode="Conditional" RenderMode="Inline">
                                                <ContentTemplate><span class="CountNotify btn-danger"><%= DataList4.Items.Count %></span></ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            Notification 🔔</b>
                                    </div>
                                    <div class="notify-content" style="height: 300px;">
                                        <asp:UpdatePanel runat="server" UpdateMode="Conditional" RenderMode="Inline">
                                            <ContentTemplate>
                                                <div class="list-group">
                                                    <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource3" Width="100%" GridLines="Horizontal" CellPadding="5" CellSpacing="10" HorizontalAlign="Justify">
                                                        <ItemStyle Font-Names="Bahnschrift" Font-Size="Medium" ForeColor="#d9534a" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Black" />
                                                        <ItemTemplate>
                                                            <%# "📩&nbsp;"+MsgFrm %><asp:LinkButton ID="SenderLabel" runat="server" CssClass="btn btn-warning" OnClick="UsernameLabel_Click" Text='<%# Eval("Sender") %>' OnClientClick="$('.main-body').slideDown();" Height="40px" Width="100%" ForeColor="White" />
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger EventName="Tick" ControlID="Timer1" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                                <%--section_1   End "notification" />--%>


                                <%--section_2  "OnlineCSS" />--%>
                                <hr />
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:MessengerConnection %>' SelectCommand="SELECT [Username] FROM [UsersData] WHERE ([Username] <> @Username) AND Status = 1">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="LabelSender" PropertyName="Text" Name="Username" Type="String"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <div class="OnlinePanel" id="OnlinePanel">
                                    <div class="text-center">
                                        <b>
                                            <asp:UpdatePanel runat="server" UpdateMode="Conditional" RenderMode="Inline">
                                                <ContentTemplate><span class="CountOnline btn-success"><%= DataList1.Items.Count %></span></ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            Online Friends</b>
                                    </div>
                                    <div class="online-content" style="height: 300px">
                                        <asp:UpdatePanel runat="server" RenderMode="Inline" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:DataList ID="DataList1" runat="server" CellSpacing="2" CssClass="pp" DataSourceID="SqlDataSource1" Width="100%">
                                                    <ItemStyle Font-Names="Bahnschrift" Font-Size="Medium" ForeColor="BurlyWood" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="UsernameLabel" runat="server" CssClass="h4 btn btn-success" ForeColor="White" OnClick="UsernameLabel_Click" OnClientClick="$('.main-body').slideDown()" Text='<%# Eval("Username") %>' Width="100%" />
                                                        <%--<div class="OnlineCSS" />--%>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                                <%-- End section_2  "OfflineCSS" />--%>


                                <%--section_3  Offline--%>
                                <hr />
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:MessengerConnection %>' SelectCommand="SELECT [Username] FROM [UsersData] WHERE ([Username] <> @Username) AND (Status = 0  or Status is null)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="LabelSender" PropertyName="Text" Name="Username" Type="String"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <div class="OfflinePanel">
                                    <div class="text-center">
                                        <b>
                                            <asp:UpdatePanel runat="server" UpdateMode="Conditional" RenderMode="Inline">
                                                <ContentTemplate><span class="CountOffline btn-dark"><%= DataList3.Items.Count %></span></ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            Offline Friends</b>
                                    </div>
                                    <div class="offline-content" style="height: 300px">
                                        <asp:UpdatePanel runat="server" UpdateMode="Conditional" RenderMode="Inline">
                                            <ContentTemplate>
                                                <asp:DataList ID="DataList3" CssClass="pp" runat="server" DataSourceID="SqlDataSource2" Width="100%" GridLines="Horizontal" BorderStyle="None">
                                                    <ItemStyle Font-Names="Bahnschrift" Font-Size="Medium" ForeColor="LightSkyBlue" HorizontalAlign="Center" VerticalAlign="Middle" BorderStyle="None" BorderWidth="0" />
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' OnClick="UsernameLabel_Click" CssClass="h4 btn btn-secondary" OnClientClick="$('.main-body').slideDown()" Width="100%" ForeColor="White" />
                                                        <%--<div class="OfflineCSS" />--%>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger EventName="Tick" ControlID="Timer1" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                                <%--End section_2  "OfflineCSS" />--%>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>




<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server"></asp:Content>
