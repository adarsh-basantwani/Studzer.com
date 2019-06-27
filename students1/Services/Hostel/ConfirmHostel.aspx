<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmHostel.aspx.cs" Inherits="students1.Services.Hostel.ConfirmHostel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Confirm Hostel</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Booking] WHERE [SrNo] = @SrNo" 
            InsertCommand="INSERT INTO [Booking] ([RoomStatus]) VALUES (@RoomStatus)" 
            SelectCommand="SELECT [RoomStatus], [SrNo] FROM [Booking]" 
            
            
            
            
            UpdateCommand="UPDATE Booking SET HostelStatus = @HostelStatus WHERE (HostelId = @HostelId) AND (ContactNo = @UserId)">
            <DeleteParameters>
                <asp:Parameter Name="SrNo" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="RoomStatus" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:QueryStringParameter Name="UserId" QueryStringField="UserId" />
                <asp:ControlParameter ControlID="hfStatus" Name="HostelStatus" 
                    PropertyName="Value" />
                <asp:QueryStringParameter Name="HostelId" QueryStringField="HostelId" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="hfStatus" runat="server" />
    
    
    </div>
    </form>
</body>
</html>
