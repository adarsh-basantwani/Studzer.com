<%@ Page Title="Registered Hostels" Language="C#" MasterPageFile="~/cba321/cba322.Master" AutoEventWireup="true" CodeBehind="RegisteredHostels.aspx.cs" Inherits="students1.cba321.Hostel.RegisteredHostels" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="HostelId" 
        DataSourceID="SqlDataSource1">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="HostelId" HeaderText="HostelId" 
            InsertVisible="False" ReadOnly="True" SortExpression="HostelId" />
        <asp:BoundField DataField="HostelLocation" HeaderText="HostelLocation" 
            SortExpression="HostelLocation" />
        <asp:BoundField DataField="NearestLocation" HeaderText="NearestLocation" 
            SortExpression="NearestLocation" />
        <asp:BoundField DataField="Gender" HeaderText="Gender" 
            SortExpression="Gender" />
        <asp:BoundField DataField="MessFacility" HeaderText="MessFacility" 
            SortExpression="MessFacility" />
        <asp:BoundField DataField="Scheme" HeaderText="Scheme" 
            SortExpression="Scheme" />
        <asp:ImageField DataImageUrlField="UploadPhoto1" ControlStyle-Width="100"
        ControlStyle-Height = "100" HeaderText = "Photo 1"></asp:ImageField>
        <asp:ImageField DataImageUrlField="UploadPhoto2" ControlStyle-Width="100"
        ControlStyle-Height = "100" HeaderText = "Photo 2"></asp:ImageField>
                <asp:ImageField DataImageUrlField="UploadPhoto3" ControlStyle-Width="100"
        ControlStyle-Height = "100" HeaderText = "Photo 3"></asp:ImageField><asp:BoundField DataField="BathRoom" HeaderText="BathRoom" 
            SortExpression="BathRoom" />
        <asp:BoundField DataField="HotWater" HeaderText="HotWater" 
            SortExpression="HotWater" />
        <asp:BoundField DataField="Parking" HeaderText="Parking" 
            SortExpression="Parking" />
        <asp:BoundField DataField="Wifi" HeaderText="Wifi" SortExpression="Wifi" />
        <asp:BoundField DataField="MessType" HeaderText="MessType" 
            SortExpression="MessType" />
        <asp:BoundField DataField="BreakFast" HeaderText="BreakFast" 
            SortExpression="BreakFast" />
        <asp:BoundField DataField="MessRent" HeaderText="MessRent" 
            SortExpression="MessRent" />
        <asp:ImageField DataImageUrlField="MessPhoto" ControlStyle-Width="100"
        ControlStyle-Height = "100" HeaderText = "Mess Photo"></asp:ImageField><asp:BoundField DataField="Counter" HeaderText="Counter" 
            SortExpression="Counter" />
        <asp:BoundField DataField="Disable" HeaderText="Disable" 
            SortExpression="Disable" />
        <asp:BoundField DataField="UserId" HeaderText="UserId" 
            SortExpression="UserId" />
        <asp:BoundField DataField="MoreAboutHostel" HeaderText="MoreAboutHostel" 
            SortExpression="MoreAboutHostel" />
        <asp:BoundField DataField="ActivationDate" HeaderText="ActivationDate" 
            SortExpression="ActivationDate" />
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:BoundField DataField="ContactNo1" HeaderText="ContactNo1" 
            SortExpression="ContactNo1" />
        <asp:BoundField DataField="ContactNo2" HeaderText="ContactNo2" 
            SortExpression="ContactNo2" />
        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
        <asp:BoundField DataField="New" HeaderText="New" SortExpression="New" />
    </Columns>
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Hostel] WHERE [HostelId] = @HostelId" 
        InsertCommand="INSERT INTO [Hostel] ([HostelLocation], [NearestLocation], [Gender], [MessFacility], [Scheme], [UploadPhoto1], [UploadPhoto2], [UploadPhoto3], [BathRoom], [HotWater], [Parking], [Wifi], [MessType], [BreakFast], [MessRent], [MessPhoto], [Counter], [Disable], [UserId], [MoreAboutHostel], [ActivationDate], [Name], [ContactNo1], [ContactNo2], [State], [City], [New]) VALUES (@HostelLocation, @NearestLocation, @Gender, @MessFacility, @Scheme, @UploadPhoto1, @UploadPhoto2, @UploadPhoto3, @BathRoom, @HotWater, @Parking, @Wifi, @MessType, @BreakFast, @MessRent, @MessPhoto, @Counter, @Disable, @UserId, @MoreAboutHostel, @ActivationDate, @Name, @ContactNo1, @ContactNo2, @State, @City, @New)" 
        SelectCommand="SELECT [HostelId], [HostelLocation], [NearestLocation], [Gender], [MessFacility], [Scheme], [UploadPhoto1], [UploadPhoto2], [UploadPhoto3], [BathRoom], [HotWater], [Parking], [Wifi], [MessType], [BreakFast], [MessRent], [MessPhoto], [Counter], [Disable], [UserId], [MoreAboutHostel], [ActivationDate], [Name], [ContactNo1], [ContactNo2], [State], [City], [New] FROM [Hostel]" 
        UpdateCommand="UPDATE [Hostel] SET [HostelLocation] = @HostelLocation, [NearestLocation] = @NearestLocation, [Gender] = @Gender, [MessFacility] = @MessFacility, [Scheme] = @Scheme, [UploadPhoto1] = @UploadPhoto1, [UploadPhoto2] = @UploadPhoto2, [UploadPhoto3] = @UploadPhoto3, [BathRoom] = @BathRoom, [HotWater] = @HotWater, [Parking] = @Parking, [Wifi] = @Wifi, [MessType] = @MessType, [BreakFast] = @BreakFast, [MessRent] = @MessRent, [MessPhoto] = @MessPhoto, [Counter] = @Counter, [Disable] = @Disable, [UserId] = @UserId, [MoreAboutHostel] = @MoreAboutHostel, [ActivationDate] = @ActivationDate, [Name] = @Name, [ContactNo1] = @ContactNo1, [ContactNo2] = @ContactNo2, [State] = @State, [City] = @City, [New] = @New WHERE [HostelId] = @HostelId">
        <DeleteParameters>
            <asp:Parameter Name="HostelId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="HostelLocation" Type="String" />
            <asp:Parameter Name="NearestLocation" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="MessFacility" Type="String" />
            <asp:Parameter Name="Scheme" Type="String" />
            <asp:Parameter Name="UploadPhoto1" Type="String" />
            <asp:Parameter Name="UploadPhoto2" Type="String" />
            <asp:Parameter Name="UploadPhoto3" Type="String" />
            <asp:Parameter Name="BathRoom" Type="String" />
            <asp:Parameter Name="HotWater" Type="String" />
            <asp:Parameter Name="Parking" Type="String" />
            <asp:Parameter Name="Wifi" Type="String" />
            <asp:Parameter Name="MessType" Type="String" />
            <asp:Parameter Name="BreakFast" Type="String" />
            <asp:Parameter Name="MessRent" Type="String" />
            <asp:Parameter Name="MessPhoto" Type="String" />
            <asp:Parameter Name="Counter" Type="String" />
            <asp:Parameter Name="Disable" Type="String" />
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="MoreAboutHostel" Type="String" />
            <asp:Parameter DbType="Date" Name="ActivationDate" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ContactNo1" Type="String" />
            <asp:Parameter Name="ContactNo2" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="New" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="HostelLocation" Type="String" />
            <asp:Parameter Name="NearestLocation" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="MessFacility" Type="String" />
            <asp:Parameter Name="Scheme" Type="String" />
            <asp:Parameter Name="UploadPhoto1" Type="String" />
            <asp:Parameter Name="UploadPhoto2" Type="String" />
            <asp:Parameter Name="UploadPhoto3" Type="String" />
            <asp:Parameter Name="BathRoom" Type="String" />
            <asp:Parameter Name="HotWater" Type="String" />
            <asp:Parameter Name="Parking" Type="String" />
            <asp:Parameter Name="Wifi" Type="String" />
            <asp:Parameter Name="MessType" Type="String" />
            <asp:Parameter Name="BreakFast" Type="String" />
            <asp:Parameter Name="MessRent" Type="String" />
            <asp:Parameter Name="MessPhoto" Type="String" />
            <asp:Parameter Name="Counter" Type="String" />
            <asp:Parameter Name="Disable" Type="String" />
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="MoreAboutHostel" Type="String" />
            <asp:Parameter DbType="Date" Name="ActivationDate" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ContactNo1" Type="String" />
            <asp:Parameter Name="ContactNo2" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="New" Type="String" />
            <asp:Parameter Name="HostelId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Text="Room Details" Font-Size="X-Large" ForeColor="Black"></asp:Label>
    <hr />
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SrNo" 
        DataSourceID="SqlDataSource2">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                ReadOnly="True" SortExpression="SrNo" />
            <asp:BoundField DataField="HostelId" HeaderText="HostelId" 
                SortExpression="HostelId" />
            <asp:BoundField DataField="NoOfRooms" HeaderText="NoOfRooms" 
                SortExpression="NoOfRooms" />
            <asp:BoundField DataField="PersonInEachRoom" HeaderText="PersonInEachRoom" 
                SortExpression="PersonInEachRoom" />
            <asp:BoundField DataField="RentPerHead" HeaderText="RentPerHead" 
                SortExpression="RentPerHead" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [HostelRoom] WHERE [SrNo] = @SrNo" 
        InsertCommand="INSERT INTO [HostelRoom] ([HostelId], [NoOfRooms], [PersonInEachRoom], [RentPerHead]) VALUES (@HostelId, @NoOfRooms, @PersonInEachRoom, @RentPerHead)" 
        SelectCommand="SELECT [SrNo], [HostelId], [NoOfRooms], [PersonInEachRoom], [RentPerHead] FROM [HostelRoom]" 
        UpdateCommand="UPDATE [HostelRoom] SET [HostelId] = @HostelId, [NoOfRooms] = @NoOfRooms, [PersonInEachRoom] = @PersonInEachRoom, [RentPerHead] = @RentPerHead WHERE [SrNo] = @SrNo">
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="HostelId" Type="Int32" />
            <asp:Parameter Name="NoOfRooms" Type="Int32" />
            <asp:Parameter Name="PersonInEachRoom" Type="Int32" />
            <asp:Parameter Name="RentPerHead" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="HostelId" Type="Int32" />
            <asp:Parameter Name="NoOfRooms" Type="Int32" />
            <asp:Parameter Name="PersonInEachRoom" Type="Int32" />
            <asp:Parameter Name="RentPerHead" Type="Int32" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

