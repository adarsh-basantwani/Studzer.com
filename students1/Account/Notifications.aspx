<%@ Page Title="Notifications" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="students1.Account.Notifications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
           <h4> Sender:
            <asp:Label ID="SenderUserLabel" runat="server" 
                Text='<%# Eval("Name") %>' />
            <br />
            Date:
            <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='~/Services/ChatRoom/Chat.aspx?UserId=<%# Eval("SenderUser") %>&Status=Read'>Read Message</asp:HyperLink></h4>
            <br />
            <br />
        </ItemTemplate>
</asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT ChatList.Name, Chatter.SenderUser, Chatter.Date FROM Chatter INNER JOIN ChatList ON Chatter.SenderUser = ChatList.ContactNo WHERE (Chatter.ReceiverUser = @ReceiverUser) AND (Chatter.Status = @Status)">
        <SelectParameters>
            <asp:SessionParameter Name="ReceiverUser" SessionField="UserId" Type="String" />
            <asp:ControlParameter ControlID="HiddenField2" Name="Status" 
                PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField2" runat="server" />
  <script src="../../Scripts/main/jquery.js" type="text/javascript"></script>
    <script src="../../Scripts/main/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../Scripts/main/jquery.backstretch.js" type="text/javascript"></script>
    <script type="text/javascript">
        'use strict';

        /* ========================== */
        /* ::::::: Backstrech ::::::: */
        /* ========================== */
        // You may also attach Backstretch to a block-level element
        $.backstretch(
        [
            "../../images/background/blue.jpg"
        ],

        {
            duration: 4500,
            fade: 1500
        }
    );
    </script>

</asp:Content>