<%@ Page Title="Blog List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BlogsList.aspx.cs" Inherits="students1.Services.Blogs.BlogsList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server">
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <div id="banner">
<h1>There are no Blogs available currently..</h1>
</div>
</div>
</div>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" 
        DataSourceID="SqlDataSource1">
        <ItemTemplate>
        <tabel><tr><td>
            Name:</td><td>
            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
            </td></tr>
            <tr><td>
            Qualification:</td>
            <td>
            <asp:Label ID="QualificationLabel" runat="server" 
                Text='<%# Eval("Qualification") %>' />
             </td></tr><tr><td>Read By&nbsp;<asp:Label ID="Label1" runat="server" 
                Text='<%# Eval("Counter") %>' />&nbsp;People
            </td><td></td></tr>
             <tr><td></td><td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='~/Services/Blogs/Blog.aspx?Id=<%# Eval("Id") %>'>Read Blog</asp:HyperLink>
             </td></tr>
            </tabel>
        </ItemTemplate>
    </asp:DataList>
    </asp:Panel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT Id, Name, Qualification, Counter FROM Blog">
    </asp:SqlDataSource>
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
