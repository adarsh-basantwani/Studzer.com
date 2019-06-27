<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="students1.Services.ChatRoom.AddUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add user</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [ChatList] WHERE [ContactNo] = @ContactNo" 
            InsertCommand="INSERT INTO ChatList(ContactNo, Name) VALUES (@ContactNo, @Name)" 
            SelectCommand="SELECT * FROM [ChatList] WHERE ([ContactNo] = @ContactNo)" 
            
            UpdateCommand="UPDATE [ChatList] SET [Name] = @Name WHERE [ContactNo] = @ContactNo">
            <DeleteParameters>
                <asp:Parameter Name="ContactNo" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="ContactNo" SessionField="UserId" Type="String" />
                <asp:SessionParameter Name="Name" SessionField="Name" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="ContactNo" SessionField="UserId" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="ContactNo" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            SelectCommand="SELECT [What], [Education], [Age], [City], [State] FROM [Users] WHERE ([ContactNo] = @ContactNo)">
            <SelectParameters>
                <asp:SessionParameter Name="ContactNo" SessionField="UserId" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
