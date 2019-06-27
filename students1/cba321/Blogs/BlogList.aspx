<%@ Page Title="Blog List" Language="C#" MasterPageFile="~/cba321/cba322.Master" AutoEventWireup="true" CodeBehind="BlogList.aspx.cs" Inherits="students1.cba321.Blogs.BlogList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" 
        DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:ImageField DataImageUrlField="Photo" ControlStyle-Width="100"
        ControlStyle-Height = "100" HeaderText = "Photo">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
            </asp:ImageField><asp:BoundField DataField="Qualification" HeaderText="Qualification" 
                SortExpression="Qualification" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Blog] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Blog] ([Name], [Photo], [Qualification]) VALUES (@Name, @Photo, @Qualification)" 
        SelectCommand="SELECT [Id], [Name], [Photo], [Qualification] FROM [Blog]" 
        UpdateCommand="UPDATE [Blog] SET [Name] = @Name, [Photo] = @Photo, [Qualification] = @Qualification WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Photo" Type="String" />
            <asp:Parameter Name="Qualification" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Photo" Type="String" />
            <asp:Parameter Name="Qualification" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
