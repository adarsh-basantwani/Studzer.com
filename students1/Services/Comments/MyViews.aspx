<%@ Page Title="My Views" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyViews.aspx.cs" Inherits="students1.Services.Comments.MyViews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                <fieldset>
                <div align="right">
                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-warning" NavigateUrl="~/Services/Comments/Comments.aspx">Back to Conversation</asp:HyperLink>
                   </div> <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
                        DataKeyField="Id">
                        <ItemTemplate>
                        <h4> <b>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("Topic") %>'></asp:Label></b>&nbsp;:<br />
                       <asp:Label ID="Label3" runat="server" Text='<%#Eval("Comment") %>'></asp:Label><br />
                        <img src="../../images/like.png" alt="Not Available" height="30px" width="30px" /><asp:Label ID="Label2" runat="server" Text='<%#Eval("Love") %>'></asp:Label>
                        <br />
                        <a href='DeleteComment.aspx?Id=<%# Eval("Id") %>'>Delete</a></h4>
                            <br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        
                        
                        SelectCommand="SELECT [Id], [Comment], [Topic], [Love] FROM [Comment] WHERE ([Name] = @Name)">
                        <SelectParameters>
                            <asp:SessionParameter Name="Name" SessionField="Name" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
</fieldset>
</div></div></div></div>
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
