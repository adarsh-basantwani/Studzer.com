<%@ Page Title="Read Blog" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="students1.Services.Blogs.Blog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <tabel><tr><td>
            Name:</td><td>
            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
            </td></tr><tr><td></td><td></td></tr>
            <tr><td>
            Qualification:</td>
            <td>
            <asp:Label ID="QualificationLabel" runat="server" 
                Text='<%# Eval("Qualification") %>' />
             </td></tr></tabel>
             <center>
                 <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Photo") %>' Width="200px" Height="200px" />
             </center
             <br />
            <asp:Label ID="DetailsLabel" runat="server" Text='<%# Eval("Details") %>' />
            
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT [Name], [Qualification], [Details], [Photo], [Counter], [Id] FROM [Blog] WHERE ([Id] = @Id)" 
        DeleteCommand="DELETE FROM [Blog] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Blog] ([Name], [Qualification], [Details], [Photo], [Counter]) VALUES (@Name, @Qualification, @Details, @Photo, @Counter)" 
        UpdateCommand="UPDATE [Blog] SET [Counter] = @Counter WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Qualification" Type="String" />
            <asp:Parameter Name="Details" Type="String" />
            <asp:Parameter Name="Photo" Type="String" />
            <asp:Parameter Name="Counter" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="HiddenField2" Name="Counter" 
                PropertyName="Value" Type="String" />
            <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Button ID="Button1" runat="server" Text="Back" CssClass="btn btn-primary" 
        onclick="Button1_Click" />
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
