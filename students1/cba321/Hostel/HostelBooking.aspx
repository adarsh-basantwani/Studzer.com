<%@ Page Title="Hostel Bookings" Language="C#" MasterPageFile="~/cba321/cba322.Master" AutoEventWireup="true" CodeBehind="HostelBooking.aspx.cs" Inherits="students1.cba321.Hostel.HostelBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>Hostel Bookings</h1>
<hr />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SrNo" 
        DataSourceID="SqlDataSource1" Width="100%">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                ReadOnly="True" SortExpression="SrNo" />
            <asp:BoundField DataField="HostelId" HeaderText="HostelId" 
                SortExpression="HostelId" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="ContactNo" HeaderText="ContactNo" 
                SortExpression="ContactNo" />
            <asp:BoundField DataField="HostelStatus" HeaderText="HostelStatus" 
                SortExpression="HostelStatus" />
            <asp:BoundField DataField="Rating" HeaderText="Rating" 
                SortExpression="Rating" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Booking] WHERE [SrNo] = @SrNo" 
        InsertCommand="INSERT INTO [Booking] ([RoomId], [Name], [ContactNo], [RoomStatus], [Rating]) VALUES (@RoomId, @Name, @ContactNo, @RoomStatus, @Rating)" 
        SelectCommand="SELECT SrNo, HostelId, Name, ContactNo, HostelStatus, Rating FROM Booking WHERE (HostelId IS NOT NULL)" 
        
        UpdateCommand="UPDATE [Booking] SET [RoomId] = @RoomId, [Name] = @Name, [ContactNo] = @ContactNo, [RoomStatus] = @RoomStatus, [Rating] = @Rating WHERE [SrNo] = @SrNo">
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="RoomId" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ContactNo" Type="String" />
            <asp:Parameter Name="RoomStatus" Type="String" />
            <asp:Parameter Name="Rating" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="RoomId" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ContactNo" Type="String" />
            <asp:Parameter Name="RoomStatus" Type="String" />
            <asp:Parameter Name="Rating" Type="Int32" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
