<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LikeComment.aspx.cs" Inherits="students1.Services.Comments.LikeComment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Like View</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HiddenField ID="HiddenField1" runat="server" />
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Comment] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Comment] ([Love]) VALUES (@Love)" 
        SelectCommand="SELECT [Id], [Love] FROM [Comment] WHERE ([Id] = @Id)" 
        UpdateCommand="UPDATE [Comment] SET [Love] = @Love WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Love" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="Love" PropertyName="Value" 
                Type="String" />
            <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
