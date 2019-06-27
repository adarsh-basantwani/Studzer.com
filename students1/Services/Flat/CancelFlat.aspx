<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancelFlat.aspx.cs" Inherits="students1.Services.Flat.CancelFlat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cancel Flat</title>
</head>
<body>
    <form id="form1" runat="server">
     <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Room] WHERE [RoomId] = @RoomId" 
            InsertCommand="INSERT INTO [Room] ([Status]) VALUES (@Status)" 
            SelectCommand="SELECT [RoomId], [Status] FROM [Room]" 
            
             UpdateCommand="UPDATE [Flat] SET [Status] = @Status WHERE [FlatId] = @FlatId">
            <DeleteParameters>
                <asp:Parameter Name="RoomId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Status" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="hfStatus" Name="Status" PropertyName="Value" 
                    Type="String" />
                <asp:QueryStringParameter Name="FlatId" QueryStringField="FlatId" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Booking] WHERE [SrNo] = @SrNo" 
            InsertCommand="INSERT INTO [Booking] ([RoomStatus]) VALUES (@RoomStatus)" 
            SelectCommand="SELECT [RoomStatus], [SrNo] FROM [Booking]" 
            
             
             UpdateCommand="UPDATE Booking SET FlatStatus = @FlatStatus WHERE (FlatId = @FlatId) AND (ContactNo = @UserId)">
            <DeleteParameters>
                <asp:Parameter Name="SrNo" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="RoomStatus" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:QueryStringParameter Name="UserId" QueryStringField="UserId" />
                <asp:ControlParameter ControlID="hfStatus2" Name="FlatStatus" 
                    PropertyName="Value" />
                <asp:QueryStringParameter Name="FlatId" QueryStringField="FlatId" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="hfStatus" runat="server" />
        <asp:HiddenField ID="hfStatus2" runat="server" />
    
    </div>
    </form>
</body>
</html>
