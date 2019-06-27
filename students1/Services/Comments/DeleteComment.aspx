<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteComment.aspx.cs" Inherits="students1.Services.Comments.DeleteComment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Comment] WHERE [Id] = @Id" 
            InsertCommand="INSERT INTO [Comment] ([Id], [Name], [Comment], [Love], [Topic]) VALUES (@Id, @Name, @Comment, @Love, @Topic)" 
            SelectCommand="SELECT * FROM [Comment]" 
            UpdateCommand="UPDATE [Comment] SET [Name] = @Name, [Comment] = @Comment, [Love] = @Love, [Topic] = @Topic WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Comment" Type="String" />
                <asp:Parameter Name="Love" Type="Int32" />
                <asp:Parameter Name="Topic" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Comment" Type="String" />
                <asp:Parameter Name="Love" Type="Int32" />
                <asp:Parameter Name="Topic" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
