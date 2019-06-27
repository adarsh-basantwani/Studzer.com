<%@ Page Title="Room Requests" Language="C#" MasterPageFile="~/cba321/cba322.Master" AutoEventWireup="true" CodeBehind="RoomRequests.aspx.cs" Inherits="students1.cba321.Room.RoomRequests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="RoomId" 
        DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="RoomId" HeaderText="RoomId" InsertVisible="False" 
                ReadOnly="True" SortExpression="RoomId" />
            <asp:BoundField DataField="Date" HeaderText="Date" 
                SortExpression="Date" />
            <asp:BoundField DataField="RoomLocation" HeaderText="RoomLocation" 
                SortExpression="RoomLocation" />
            <asp:BoundField DataField="State" HeaderText="State" 
                SortExpression="State" />
            <asp:BoundField DataField="City" HeaderText="City" 
                SortExpression="City" />
            <asp:BoundField DataField="NearestLocation" HeaderText="NearestLocation" 
                SortExpression="NearestLocation" />
            <asp:BoundField DataField="NoOfPerson" HeaderText="NoOfPerson" 
                SortExpression="NoOfPerson" />
            <asp:BoundField DataField="RentPerHead" HeaderText="RentPerHead" 
                SortExpression="RentPerHead" />
               
            <asp:BoundField DataField="Gender" HeaderText="Gender" 
                SortExpression="Gender" />
            <asp:ImageField DataImageUrlField="UploadPhoto1" ControlStyle-Width="100"
        ControlStyle-Height = "100" HeaderText = "Photo 1">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
            </asp:ImageField>
        <asp:ImageField DataImageUrlField="UploadPhoto2" ControlStyle-Width="100"
        ControlStyle-Height = "100" HeaderText = "Photo 2">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
            </asp:ImageField>
            <asp:ImageField DataImageUrlField="UploadPhoto3" ControlStyle-Width="100"
        ControlStyle-Height = "100" HeaderText = "Photo 3">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
            </asp:ImageField><asp:BoundField DataField="LightBill" HeaderText="LightBill" 
                SortExpression="LightBill" />
            <asp:BoundField DataField="BathRoom" HeaderText="BathRoom" 
                SortExpression="BathRoom" />
            <asp:BoundField DataField="HotWater" HeaderText="HotWater" 
                SortExpression="HotWater" />
            <asp:BoundField DataField="Cooking" HeaderText="Cooking" 
                SortExpression="Cooking" />
            <asp:BoundField DataField="Parking" HeaderText="Parking" 
                SortExpression="Parking" />
            <asp:BoundField DataField="Wifi" HeaderText="Wifi" 
                SortExpression="Wifi" />
            <asp:BoundField DataField="MoreAboutRoom" HeaderText="MoreAboutRoom" 
                SortExpression="MoreAboutRoom" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" 
                SortExpression="UserId" />
       <asp:BoundField DataField="Status" HeaderText="Status" 
                SortExpression="Status" />
            <asp:BoundField DataField="Counter" HeaderText="Counter" 
                SortExpression="Counter" />
            <asp:BoundField DataField="Confirm" HeaderText="Confirm" 
                SortExpression="Confirm" />
            <asp:BoundField DataField="Disable" HeaderText="Disable" 
                SortExpression="Disable" />
            <asp:BoundField DataField="ContactNo1" HeaderText="ContactNo1" 
                SortExpression="ContactNo1" />
            <asp:BoundField DataField="ContactNo2" HeaderText="ContactNo2" 
                SortExpression="ContactNo2" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="New" HeaderText="New" SortExpression="New" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Room] WHERE [RoomId] = @RoomId" 
        InsertCommand="INSERT INTO [Room] ([Date], [RoomLocation], [State], [City], [NearestLocation], [NoOfPerson], [RentPerHead], [Gender], [UploadPhoto1], [UploadPhoto2], [UploadPhoto3], [LightBill], [BathRoom], [HotWater], [Cooking], [Parking], [Wifi], [MoreAboutRoom], [UserId], [Status], [Counter], [Confirm], [Disable], [ContactNo1], [ContactNo2], [Name], [New]) VALUES (@Date, @RoomLocation, @State, @City, @NearestLocation, @NoOfPerson, @RentPerHead, @Gender, @UploadPhoto1, @UploadPhoto2, @UploadPhoto3, @LightBill, @BathRoom, @HotWater, @Cooking, @Parking, @Wifi, @MoreAboutRoom, @UserId, @Status, @Counter, @Confirm, @Disable, @ContactNo1, @ContactNo2, @Name, @New)" 
        SelectCommand="SELECT [RoomId], [Date], [RoomLocation], [State], [City], [NearestLocation], [NoOfPerson], [RentPerHead], [Gender], [UploadPhoto1], [UploadPhoto2], [UploadPhoto3], [LightBill], [BathRoom], [HotWater], [Cooking], [Parking], [Wifi], [MoreAboutRoom], [UserId], [Status], [Counter], [Confirm], [Disable], [ContactNo1], [ContactNo2], [Name], [New] FROM [Room] WHERE ([Disable] = @Disable)" 
        
        
        
        UpdateCommand="UPDATE [Room] SET [Date] = @Date, [RoomLocation] = @RoomLocation, [State] = @State, [City] = @City, [NearestLocation] = @NearestLocation, [NoOfPerson] = @NoOfPerson, [RentPerHead] = @RentPerHead, [Gender] = @Gender, [UploadPhoto1] = @UploadPhoto1, [UploadPhoto2] = @UploadPhoto2, [UploadPhoto3] = @UploadPhoto3, [LightBill] = @LightBill, [BathRoom] = @BathRoom, [HotWater] = @HotWater, [Cooking] = @Cooking, [Parking] = @Parking, [Wifi] = @Wifi, [MoreAboutRoom] = @MoreAboutRoom, [UserId] = @UserId, [Status] = @Status, [Counter] = @Counter, [Confirm] = @Confirm, [Disable] = @Disable, [ContactNo1] = @ContactNo1, [ContactNo2] = @ContactNo2, [Name] = @Name, [New] = @New WHERE [RoomId] = @RoomId">
        <DeleteParameters>
            <asp:Parameter Name="RoomId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="Date" />
            <asp:Parameter Name="RoomLocation" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="NearestLocation" Type="String" />
            <asp:Parameter Name="NoOfPerson" Type="Int32" />
            <asp:Parameter Name="RentPerHead" Type="Int32" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="UploadPhoto1" Type="String" />
            <asp:Parameter Name="UploadPhoto2" Type="String" />
            <asp:Parameter Name="UploadPhoto3" Type="String" />
            <asp:Parameter Name="LightBill" Type="String" />
            <asp:Parameter Name="BathRoom" Type="String" />
            <asp:Parameter Name="HotWater" Type="String" />
            <asp:Parameter Name="Cooking" Type="String" />
            <asp:Parameter Name="Parking" Type="String" />
            <asp:Parameter Name="Wifi" Type="String" />
            <asp:Parameter Name="MoreAboutRoom" Type="String" />
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Counter" Type="String" />
            <asp:Parameter Name="Confirm" Type="String" />
            <asp:Parameter Name="Disable" Type="String" />
            <asp:Parameter Name="ContactNo1" Type="String" />
            <asp:Parameter Name="ContactNo2" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="New" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hfDisable" Name="Disable" PropertyName="Value" 
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="Date" />
            <asp:Parameter Name="RoomLocation" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="NearestLocation" Type="String" />
            <asp:Parameter Name="NoOfPerson" Type="Int32" />
            <asp:Parameter Name="RentPerHead" Type="Int32" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="UploadPhoto1" Type="String" />
            <asp:Parameter Name="UploadPhoto2" Type="String" />
            <asp:Parameter Name="UploadPhoto3" Type="String" />
            <asp:Parameter Name="LightBill" Type="String" />
            <asp:Parameter Name="BathRoom" Type="String" />
            <asp:Parameter Name="HotWater" Type="String" />
            <asp:Parameter Name="Cooking" Type="String" />
            <asp:Parameter Name="Parking" Type="String" />
            <asp:Parameter Name="Wifi" Type="String" />
            <asp:Parameter Name="MoreAboutRoom" Type="String" />
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Counter" Type="String" />
            <asp:Parameter Name="Confirm" Type="String" />
            <asp:Parameter Name="Disable" Type="String" />
            <asp:Parameter Name="ContactNo1" Type="String" />
            <asp:Parameter Name="ContactNo2" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="New" Type="String" />
            <asp:Parameter Name="RoomId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <asp:HiddenField ID="hfDisable" runat="server" />

</asp:Content>
