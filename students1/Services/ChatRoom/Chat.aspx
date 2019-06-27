<%@ Page Title="Chat" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Chat.aspx.cs" Inherits="students1.Services.ChatRoom.Chat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
body
{
    margin: 0;
    padding: 0;
    height: 100%;
}
.modal
{
    
}
#divImage
{
    display: none;
    z-index: 1000;
    position: fixed;
    top: 0;
    left: 0;
    background-color: White;
    height: 550px;
    width: 600px;
    padding: 3px;
    border: solid 1px black;
}
</style>
<script type="text/javascript">
    function LoadDiv(url) {
        var img = new Image();
        var bcgDiv = document.getElementById("divBackground");
        var imgDiv = document.getElementById("divImage");
        var imgFull = document.getElementById("imgFull");
        var imgLoader = document.getElementById("imgLoader");
        imgLoader.style.display = "block";
        img.onload = function () {
            imgFull.src = img.src;
            imgFull.style.display = "block";
            imgLoader.style.display = "none";
        };
        img.src = url;
        var width = document.body.clientWidth;
        if (document.body.clientHeight > document.body.scrollHeight) {
            bcgDiv.style.height = document.body.clientHeight + "px";
        }
        else {
            bcgDiv.style.height = document.body.scrollHeight + "px";
        }
        imgDiv.style.left = (width - 650) / 2 + "px";
        imgDiv.style.top = "20px";
        bcgDiv.style.width = "100%";

        bcgDiv.style.display = "block";
        imgDiv.style.display = "block";
        return false;
    }
    function HideDiv() {
        var bcgDiv = document.getElementById("divBackground");
        var imgDiv = document.getElementById("divImage");
        var imgFull = document.getElementById("imgFull");
        if (bcgDiv != null) {
            bcgDiv.style.display = "none";
            imgDiv.style.display = "none";
            imgFull.style.display = "none";
        }
    }
</script></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
<div class="col-lg-10 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                    <legend>Profile</legend>
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlFriendInfo">
    <ItemTemplate>
    <table>
    <tr>
    <td>
        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl='<%# Eval("Photo")%>'
                Width="200px" Height="200px" Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);" />
    </td>
    <td>
       <table style="font-size:large">
       <tr><td>
                                <asp:Label runat="server" ID="lblName" Text="Name:" />&nbsp;&nbsp;
                           </td><td>
                                <asp:Label ID="NameLabel" runat="server" 
                                    Text='<%# Eval("Name") %>' />
                               </td></tr>
                             <tr><td>
                                <asp:Label runat="server" ID="lblAge" Text="Age:" />&nbsp;&nbsp;
                             </td><td>
                                <asp:Label ID="AgeLabel" runat="server" Text='<%# Eval("Age") %>' />
                               </td></tr>
                             <tr><td>
                                <asp:Label runat="server" ID="lblEmailId" Text="EmailId:"  />&nbsp;&nbsp;
                             </td><td>
                             <asp:Label ID="EmailIdLabel" runat="server" Text='<%# Eval("EmailId") %>' />
                               </td></tr>
                              <tr><td>
                                <asp:Label runat="server" ID="lblWhat" Text="Work:" />&nbsp;&nbsp;
                             </td><td>
                                <asp:Label ID="WhatLabel" runat="server" Text='<%# Eval("What") %>' />
                              </td></tr>
                            <tr><td>
                                <asp:Label runat="server" ID="lblEducation" Text="Education:" />&nbsp;&nbsp;
                                </td><td>
                                <asp:Label ID="EducationLabel" runat="server" Text='<%# Eval("Education") %>' />
                          </td></tr>
                              <tr><td>
                                <asp:Label runat="server" ID="lblCity" Text="City:" />&nbsp;&nbsp;
                                </td><td>
                                <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                               </td></tr>
                               <tr><td>
                                <asp:Label runat="server" ID="lblState" Text="State:" />&nbsp;&nbsp;
                            </td><td>
                                <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                               </td></tr></table></td>
                           
    </tr>
    </table>
    </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlFriendInfo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
                            SelectCommand="SELECT [Name], [Photo], [EmailId], [What], [Education], [Age], [City], [State] FROM [Users] WHERE ([ContactNo] = @ContactNo)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ContactNo" QueryStringField="UserId" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <hr />
                                <div class="form-group">
                                <asp:Label runat="server" ID="lblMessage" Text="Message" CssClass="col-lg-4 control-label" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtmsg" ErrorMessage="RequiredFieldValidator" 
        ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                                <div class="col-lg-8">
                                <asp:TextBox ID="txtmsg" runat="server" CssClass="form-control" TextMode="MultiLine" />
                                </div></div>
    <div class="form-group">
                            <div class="col-lg-5 col-lg-offset-4">
                       <asp:Button ID="btnSend" runat="server" onclick="btnSend_Click" Text="Send" CssClass="btn btn-primary" /></div></div>
    <asp:SqlDataSource ID="sqlMsg" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        InsertCommand="INSERT INTO Chatter(Message, SenderUser, ReceiverUser, Date, Status) VALUES (@Message, @SenderUser, @ReceiverUser, @Date, @Status)" 
        
                            
                            
                            SelectCommand="SELECT Id, SenderUser, ReceiverUser, Message, Date FROM Chatter WHERE (SenderUser = @SenderUser) AND (ReceiverUser = @ReceiverUser) OR (SenderUser = @SenderUser2) AND (msgto = @ReceiverUser2)">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtmsg" Name="Message" PropertyName="Text" />
            <asp:SessionParameter Name="SenderUser" SessionField="UserId" />
            <asp:QueryStringParameter Name="ReceiverUser" QueryStringField="UserId" />
            <asp:ControlParameter ControlID="hfdate" Name="Date" PropertyName="Value" />
            <asp:ControlParameter ControlID="hfNotRead" Name="Status" 
                PropertyName="Value" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="SenderUser" SessionField="UserId" />
            <asp:QueryStringParameter Name="ReceiverUser" QueryStringField="UserId" />
            <asp:QueryStringParameter Name="SenderUser2" QueryStringField="UserId" />
            <asp:SessionParameter Name="ReceiverUser2" SessionField="UserId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <hr />
    <asp:Label ID="lbl" runat="server" Font-Names="Arial" Font-Size="Large"></asp:Label>
    <asp:HiddenField ID="hfdate" runat="server" />
    <asp:HiddenField ID="hfNotRead" runat="server" />
    <asp:HiddenField ID="hfRead" runat="server" />
    <asp:SqlDataSource ID="sqlUpdateStatus" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        InsertCommand="INSERT INTO [Chatter] ([Status], [SenderUser], [ReceiverUser], [Message], [Date]) VALUES (@Status, @SenderUser, @ReceiverUser, @Message, @Date)" 
        
                            
                            
                            
                            SelectCommand="SELECT [Status], [Id], [SenderUser], [ReceiverUser], [Message], [Date] FROM [Chatter]" 
                            DeleteCommand="DELETE FROM [Chatter] WHERE [Id] = @Id" 
                            UpdateCommand="UPDATE Chatter SET Status = @Status WHERE (SenderUser = @SenderUser) AND (ReceiverUser = @ReceiverUser)">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="SenderUser" Type="String" />
            <asp:Parameter Name="ReceiverUser" Type="String" />
            <asp:Parameter Name="Message" Type="String" />
            <asp:Parameter DbType="Date" Name="Date" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="hfRead" Name="Status" PropertyName="Value" 
                Type="String" />
            <asp:QueryStringParameter Name="SenderUser" QueryStringField="UserId" 
                Type="String" />
            <asp:SessionParameter Name="ReceiverUser" SessionField="UserId" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlCheck" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
                            
                            
                            SelectCommand="SELECT * FROM [ChatList] WHERE ([ContactNo] = @ContactNo)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ContactNo" QueryStringField="UserId" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
             </fieldset>
                </div>
            </div>
        </div></div>
      <div id="divBackground" style="display: none;position: absolute;top: 0px;left: 0px;background-color: black;z-index: 100;opacity: 0.8;filter: alpha(opacity=60);-moz-opacity: 0.8;min-height: 100%;">
</div>
<div id="divImage">
<table style="height: 100%; width: 100%">
    <tr>
        <td valign="middle" align="center">
            <img id="imgLoader" alt="" src="../../images/loader.gif" />
            <img id="imgFull" alt="" src="" style="display: none; height: 500px; width: 590px" />
        </td>
    </tr>
    <tr>
        <td align="center" valign="bottom">
            <input id="btnClose" type="button" value="close" onclick="HideDiv()" class="btn-primary" />
        </td>
    </tr>
</table>
</div>
    
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
