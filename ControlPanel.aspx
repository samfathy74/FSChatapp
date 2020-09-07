<%@ Page Title="Control Panel" Language="C#" MasterPageFile="~/_LayoutMain.master" AutoEventWireup="true" CodeFile="ControlPanel.aspx.cs" Inherits="ControlPanel" %>

<%@ MasterType VirtualPath="~/_LayoutMain.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />

    <div style="text-align: center; text-align-last: center;">
        <div class="row">
            <div class="col-sm-12">
                <asp:Login ID="Login1" runat="server" CssClass="btn btn-dark" Style="background-color: #009999; border-collapse: collapse; min-width: 40%; border-radius: 20px;" BackColor="#009999" Font-Names="Bahnschrift Light,Medium" Font-Size="Medium" ForeColor="#FFFFCC" Height="330px" InstructionText="this page is specific for only admins" LoginButtonType="Button" OnAuthenticate="Login1_Authenticate" PasswordLabelText="Password :" UserNameLabelText="User Name :" Width="470px" LoginButtonStyle-CssClass="btn btn-danger">
                    <CheckBoxStyle Font-Names="Bahnschrift Light" Font-Size="Medium" VerticalAlign="Bottom" HorizontalAlign="Center" />
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <LabelStyle HorizontalAlign="Right" />
                    <LoginButtonStyle Font-Names="Verdana" />
                    <TextBoxStyle Font-Size="Medium" ForeColor="Black" Font-Names="bahnschrift light, medium" Height="30px" Width="200px" />
                    <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="Medium" ForeColor="White" VerticalAlign="Middle" Font-Names="Bauhaus 93" />
                    <ValidatorTextStyle Font-Size="Large" />
                </asp:Login>
            </div>
        </div>

    </div>
    <br />
    <br />
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server" Visible="false">
    <asp:Panel ID="Panel1" runat="server" Visible="false" ScrollBars="Auto" Width="100%" Height="100%" Enabled="False" GroupingText="Users Data" CssClass="text-center">
        <asp:DetailsView runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="Id" Height="600px" Width="100%" PagerStyle-ForeColor="Black" Font-Size="15px" CellPadding="2" CellSpacing="2" BackColor="Black" Font-Bold="True" Font-Names="Bahnschrift" DataSourceID="SqlDataSource1" HorizontalAlign="Center" BorderColor="#11545F" CssClass="btn-info" ForeColor="Crimson">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                <asp:BoundField DataField="Avater" HeaderText="Avater" SortExpression="Avater" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="Ip_Address" HeaderText="Ip_Address" SortExpression="Ip_Address" />
                <asp:BoundField DataField="CountryName" HeaderText="CountryName" SortExpression="CountryName" />
                <asp:BoundField DataField="CityName" HeaderText="CityName" SortExpression="CityName" />
                <asp:BoundField DataField="RegionName" HeaderText="RegionName" SortExpression="RegionName" />
                <asp:BoundField DataField="CountryCode" HeaderText="CountryCode" SortExpression="CountryCode" />
                <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
                <asp:BoundField DataField="TimeZone" HeaderText="TimeZone" SortExpression="TimeZone" />
                <asp:BoundField DataField="Machein" HeaderText="Machein" SortExpression="Machein" />
                <asp:BoundField DataField="TimeDate" HeaderText="TimeDate" SortExpression="TimeDate" />
            </Fields>
            <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
            <PagerStyle BorderColor="#666633" BorderStyle="Solid" BorderWidth="2px" ForeColor="#CC9900" Font-Bold="True" Font-Size="20px" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:DetailsView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:messengerconnection %>" SelectCommand="SELECT * FROM [UsersData]"></asp:SqlDataSource>
    </asp:Panel>
    <br />
    <br />

    <asp:Panel ID="Panel2" CssClass="text-center" runat="server" Visible="false" ScrollBars="Auto" Width="100%" Height="100%" Enabled="False" GroupingText="Chats Data">
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" Height="300px" Width="100%" PagerStyle-ForeColor="Black" Font-Size="15px" CellPadding="2" CellSpacing="2" BackColor="Black" Font-Bold="True" Font-Names="Bahnschrift" BorderColor="#11545F" CssClass="btn-primary" ForeColor="Crimson">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="ChatMsg" HeaderText="ChatMsg" SortExpression="ChatMsg" />
                <asp:BoundField DataField="Sender" HeaderText="Sender" SortExpression="Sender" />
                <asp:BoundField DataField="Receiver" HeaderText="Receiver" SortExpression="Receiver" />
                <asp:BoundField DataField="RecevierSeen" HeaderText="RecevierSeen" SortExpression="RecevierSeen" />
                <asp:BoundField DataField="DateTime" HeaderText="DateTime" SortExpression="DateTime" />
            </Fields>
            <PagerSettings Position="TopAndBottom" Mode="NumericFirstLast" />
            <PagerStyle BorderColor="#003366" BorderStyle="Solid" BorderWidth="2px" Font-Size="20px" ForeColor="#CC9900" VerticalAlign="Middle" HorizontalAlign="Center" Font-Underline="False" Font-Bold="True" />
        </asp:DetailsView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:messengerconnection %>" SelectCommand="SELECT * FROM [chat]"></asp:SqlDataSource>

    </asp:Panel>
</asp:Content>

