<%@ Page Title="My Friends" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="students1.Services.ChatRoom.UserList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
<div class="col-lg-7 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                    <div class="form-group">
                    <asp:Label ID="lblSearch" runat="server" Text="Search" CssClass="col-lg-4 control-label"></asp:Label>
                    <div class="col-lg-8">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
                    </div></div>
                    <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-4">
                        <asp:Button ID="btn" runat="server" Text="Search" CssClass="btn btn-primary" 
                            onclick="btn_Click" />
                            <asp:Button ID="btn1" runat="server" Text="Remove Me from Roommate Chat" 
                            CssClass="btn btn-warning" onclick="btn1_Click" />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            DeleteCommand="DELETE FROM [ChatList] WHERE [ContactNo] = @ContactNo" 
                            InsertCommand="INSERT INTO [ChatList] ([ContactNo], [Name]) VALUES (@ContactNo, @Name)" 
                            SelectCommand="SELECT * FROM [ChatList]" 
                            UpdateCommand="UPDATE [ChatList] SET [Name] = @Name WHERE [ContactNo] = @ContactNo">
                            <DeleteParameters>
                                <asp:SessionParameter Name="ContactNo" SessionField="UserId" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="ContactNo" Type="Int32" />
                                <asp:Parameter Name="Name" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Name" Type="String" />
                                <asp:Parameter Name="ContactNo" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div></div>
                        <asp:Panel ID="Panelall" runat="server">
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlUsers">
                            <ItemTemplate>
                            <table style="box-shadow:0px 0px 10px black;border-radius:15px;width:350px;padding:15px" >
                            <tr>
                            <td>
                            Name:</td>
                            <td>
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                            </td>
                            </tr>
                                <tr><td>
                                Age:</td><td>
                                <asp:Label ID="AgeLabel" runat="server" Text='<%# Eval("Age") %>' />
                                </td></tr>
                                <tr><td>
                                City:</td><td>
                                <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                                </td></tr>
                                <tr><td></td><td>
                                <a href='Chat.aspx?UserId=<%# Eval("ContactNo") %>'>Message</a>
                                </td></tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlUsers" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT ChatList.Name, ChatList.ContactNo, Users.Age, Users.City FROM ChatList INNER JOIN Users ON ChatList.ContactNo = Users.ContactNo WHERE (Users.Gender = @Gender) AND (ChatList.ContactNo &lt;&gt; @ContactNo)">
                            <SelectParameters>
                                <asp:SessionParameter Name="Gender" SessionField="Gender" />
                                <asp:SessionParameter Name="ContactNo" SessionField="UserId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </asp:Panel>
                        <asp:Panel ID="Panelsearch" runat="server" Visible="false">
                        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlSearch">
                            <ItemTemplate>
                            <table style="box-shadow:0px 0px 10px black;border-radius:15px;width:350px;padding:15px" >
                            <tr>
                            <td>
                            Name:</td>
                            <td>
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                            </td>
                            </tr>
                                <tr><td>
                                Age:</td><td>
                                <asp:Label ID="AgeLabel" runat="server" Text='<%# Eval("Age") %>' />
                                </td></tr>
                                <tr><td>
                                City:</td><td>
                                <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                                </td></tr>
                                <tr><td></td><td>
                                <a href='Chat.aspx?UserId=<%# Eval("ContactNo") %>'>Message</a>
                                </td></tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlSearch" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            
                                
                                
                                SelectCommand="SELECT ChatList.Name, ChatList.ContactNo, Users.Age, Users.City FROM ChatList INNER JOIN Users ON ChatList.ContactNo = Users.ContactNo WHERE (Users.Gender = @Gender) AND (ChatList.ContactNo &lt;&gt; @ContactNo) AND (Users.Education LIKE '%' + @Education + '%') OR (Users.City LIKE '%' + @City + '%') OR (Users.Age LIKE '%' + @Age + '%') OR (Users.Name LIKE '%' + @Name + '%')">
                            <SelectParameters>
                                <asp:SessionParameter Name="Gender" SessionField="Gender" />
                                <asp:SessionParameter Name="ContactNo" SessionField="UserId" />
                                <asp:ControlParameter ControlID="txtSearch" Name="Education" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtSearch" Name="City" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtSearch" Name="Age" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtSearch" Name="Name" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </asp:Panel>
                        </fieldset>
                    </div>
                    </div>
                   </div> </div>
                    
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
