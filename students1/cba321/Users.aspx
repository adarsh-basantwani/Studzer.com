<%@ Page Title="Users" Language="C#" MasterPageFile="~/cba321/cba322.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="students1.cba321.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="UserId" 
        DataSourceID="SqlDataSource1" OnRowDataBound = "OnRowDataBound">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" 
                SortExpression="Name" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" 
                SortExpression="Gender" />
            <asp:BoundField DataField="ContactNo" HeaderText="ContactNo" 
                SortExpression="ContactNo" />
                <asp:BoundField DataField="Password" HeaderText="Password" 
                SortExpression="Password" />
                <asp:BoundField DataField="Password" HeaderText="Password" />
                <asp:ImageField DataImageUrlField="Photo" ControlStyle-Width="100"
        ControlStyle-Height = "100" HeaderText = "Profile Photo">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
            </asp:ImageField><asp:BoundField DataField="EmailId" HeaderText="EmailId" 
                SortExpression="EmailId" />
            <asp:BoundField DataField="What" HeaderText="What" 
                SortExpression="What" />
            <asp:BoundField DataField="Education" HeaderText="Education" 
                SortExpression="Education" />
            <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="SecurityQuestion" HeaderText="SecurityQuestion" 
                SortExpression="SecurityQuestion" />
            <asp:BoundField DataField="Answer" HeaderText="Answer" 
                SortExpression="Answer" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Users] WHERE [UserId] = @UserId" 
        InsertCommand="INSERT INTO [Users] ([Name], [Gender], [ContactNo], [Password], [Photo], [EmailId], [What], [Education], [Age], [City], [State], [SecurityQuestion], [Answer]) VALUES (@Name, @Gender, @ContactNo, @Password, @Photo, @EmailId, @What, @Education, @Age, @City, @State, @SecurityQuestion, @Answer)" 
        SelectCommand="SELECT [UserId], [Name], [Gender], [ContactNo], [Password], [Photo], [EmailId], [What], [Education], [Age], [City], [State], [SecurityQuestion], [Answer] FROM [Users]" 
        UpdateCommand="UPDATE [Users] SET [Name] = @Name, [Gender] = @Gender, [ContactNo] = @ContactNo, [Password] = @Password, [Photo] = @Photo, [EmailId] = @EmailId, [What] = @What, [Education] = @Education, [Age] = @Age, [City] = @City, [State] = @State, [SecurityQuestion] = @SecurityQuestion, [Answer] = @Answer WHERE [UserId] = @UserId">
        <DeleteParameters>
            <asp:Parameter Name="UserId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="ContactNo" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Photo" Type="String" />
            <asp:Parameter Name="EmailId" Type="String" />
            <asp:Parameter Name="What" Type="String" />
            <asp:Parameter Name="Education" Type="String" />
            <asp:Parameter Name="Age" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="SecurityQuestion" Type="String" />
            <asp:Parameter Name="Answer" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="ContactNo" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Photo" Type="String" />
            <asp:Parameter Name="EmailId" Type="String" />
            <asp:Parameter Name="What" Type="String" />
            <asp:Parameter Name="Education" Type="String" />
            <asp:Parameter Name="Age" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="SecurityQuestion" Type="String" />
            <asp:Parameter Name="Answer" Type="String" />
            <asp:Parameter Name="UserId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>
