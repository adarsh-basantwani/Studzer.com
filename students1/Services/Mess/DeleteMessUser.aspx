<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteMessUser.aspx.cs" Inherits="students1.Services.Mess.DeleteMessUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delete Mess User</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Room] WHERE [RoomId] = @RoomId" 
            InsertCommand="INSERT INTO [Room] ([Confirm], [Disable], [UserId]) VALUES (@Confirm, @Disable, @UserId)" 
            SelectCommand="SELECT [RoomId], [Confirm], [Disable], [UserId] FROM [Room]" 
            
            
            
            UpdateCommand="UPDATE Booking SET MessStatus = @MessStatus WHERE (MessId = @MessId) AND (ContactNo = @UserId)">
            <DeleteParameters>
                <asp:Parameter Name="RoomId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Confirm" Type="String" />
                <asp:Parameter Name="Disable" Type="String" />
                <asp:Parameter Name="UserId" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:QueryStringParameter Name="UserId" QueryStringField="UserId" 
                    Type="String" />
                <asp:ControlParameter ControlID="hfStatus" Name="MessStatus" 
                    PropertyName="Value" />
                <asp:QueryStringParameter Name="MessId" QueryStringField="MessId" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="hfStatus" runat="server" />
    </div>
    </form>
</body>
</html>
