<%@ Page Title="Registered Flats" Language="C#" MasterPageFile="~/cba321/cba322.Master" AutoEventWireup="true" CodeBehind="RegisteredFlats.aspx.cs" Inherits="students1.cba321.Flat.RegisteredFlats" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="FlatId" 
        DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="FlatId" HeaderText="FlatId" InsertVisible="False" 
                ReadOnly="True" SortExpression="FlatId" />
            <asp:BoundField DataField="ActivationDate" HeaderText="ActivationDate" 
                SortExpression="ActivationDate" />
            <asp:BoundField DataField="OwnerName" HeaderText="OwnerName" 
                SortExpression="OwnerName" />
            <asp:BoundField DataField="ContactNo1" HeaderText="ContactNo1" 
                SortExpression="ContactNo1" />
            <asp:BoundField DataField="ContactNo2" HeaderText="ContactNo2" 
                SortExpression="ContactNo2" />
            <asp:BoundField DataField="FlatLocation" HeaderText="FlatLocation" 
                SortExpression="FlatLocation" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" 
                SortExpression="Gender" />
            <asp:BoundField DataField="State" HeaderText="State" 
                SortExpression="State" />
        <asp:BoundField DataField="City" HeaderText="City" 
                SortExpression="City" />
            <asp:BoundField DataField="NearestLocation" HeaderText="NearestLocation" 
                SortExpression="NearestLocation" />
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
            </asp:ImageField><asp:BoundField DataField="FlatType" HeaderText="FlatType" 
                SortExpression="FlatType" />
            <asp:BoundField DataField="BathRoom" HeaderText="BathRoom" 
                SortExpression="BathRoom" />
            <asp:BoundField DataField="Floor" HeaderText="Floor" 
                SortExpression="Floor" />
            <asp:BoundField DataField="Rent" HeaderText="Rent" 
                SortExpression="Rent" />
            <asp:BoundField DataField="SecurityDeposit" HeaderText="SecurityDeposit" 
                SortExpression="SecurityDeposit" />
            <asp:BoundField DataField="FlatArea" HeaderText="FlatArea" 
                SortExpression="FlatArea" />
            <asp:BoundField DataField="LightBill" HeaderText="LightBill" 
                SortExpression="LightBill" />
            <asp:BoundField DataField="Parking" HeaderText="Parking" 
                SortExpression="Parking" />
            <asp:BoundField DataField="MoreAboutFlat" HeaderText="MoreAboutFlat" 
                SortExpression="MoreAboutFlat" />
            <asp:BoundField DataField="Status" HeaderText="Status" 
                SortExpression="Status" />
            <asp:BoundField DataField="Counter" HeaderText="Counter" 
                SortExpression="Counter" />
            <asp:BoundField DataField="Confirm" HeaderText="Confirm" 
                SortExpression="Confirm" />
            <asp:BoundField DataField="Disable" HeaderText="Disable" 
                SortExpression="Disable" />
            <asp:BoundField DataField="Scheme" HeaderText="Scheme" 
                SortExpression="Scheme" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" 
                SortExpression="UserId" />
            <asp:BoundField DataField="New" HeaderText="New" SortExpression="New" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Flat] WHERE [FlatId] = @FlatId" 
        InsertCommand="INSERT INTO [Flat] ([ActivationDate], [OwnerName], [ContactNo1], [ContactNo2], [FlatLocation], [Gender], [State], [City], [NearestLocation], [UploadPhoto1], [UploadPhoto2], [UploadPhoto3], [FlatType], [BathRoom], [Floor], [Rent], [SecurityDeposit], [FlatArea], [LightBill], [Parking], [MoreAboutFlat], [Status], [Counter], [Confirm], [Disable], [Scheme], [UserId], [New]) VALUES (@ActivationDate, @OwnerName, @ContactNo1, @ContactNo2, @FlatLocation, @Gender, @State, @City, @NearestLocation, @UploadPhoto1, @UploadPhoto2, @UploadPhoto3, @FlatType, @BathRoom, @Floor, @Rent, @SecurityDeposit, @FlatArea, @LightBill, @Parking, @MoreAboutFlat, @Status, @Counter, @Confirm, @Disable, @Scheme, @UserId, @New)" 
        SelectCommand="SELECT FlatId, ActivationDate, OwnerName, ContactNo1, ContactNo2, FlatLocation, Gender, State, City, NearestLocation, UploadPhoto1, UploadPhoto2, UploadPhoto3, FlatType, BathRoom, Floor, Rent, SecurityDeposit, FlatArea, LightBill, Parking, MoreAboutFlat, Status, Counter, Confirm, Disable, UserId, New FROM Flat" 
        
        
        
        UpdateCommand="UPDATE [Flat] SET [ActivationDate] = @ActivationDate, [OwnerName] = @OwnerName, [ContactNo1] = @ContactNo1, [ContactNo2] = @ContactNo2, [FlatLocation] = @FlatLocation, [Gender] = @Gender, [State] = @State, [City] = @City, [NearestLocation] = @NearestLocation, [UploadPhoto1] = @UploadPhoto1, [UploadPhoto2] = @UploadPhoto2, [UploadPhoto3] = @UploadPhoto3, [FlatType] = @FlatType, [BathRoom] = @BathRoom, [Floor] = @Floor, [Rent] = @Rent, [SecurityDeposit] = @SecurityDeposit, [FlatArea] = @FlatArea, [LightBill] = @LightBill, [Parking] = @Parking, [MoreAboutFlat] = @MoreAboutFlat, [Status] = @Status, [Counter] = @Counter, [Confirm] = @Confirm, [Disable] = @Disable, [Scheme] = @Scheme, [UserId] = @UserId, [New] = @New WHERE [FlatId] = @FlatId">
        <DeleteParameters>
            <asp:Parameter Name="FlatId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ActivationDate" DbType="Date" />
            <asp:Parameter Name="OwnerName" Type="String" />
            <asp:Parameter Name="ContactNo1" Type="String" />
            <asp:Parameter Name="ContactNo2" Type="String" />
            <asp:Parameter Name="FlatLocation" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="NearestLocation" Type="String" />
            <asp:Parameter Name="UploadPhoto1" Type="String" />
            <asp:Parameter Name="UploadPhoto2" Type="String" />
            <asp:Parameter Name="UploadPhoto3" Type="String" />
            <asp:Parameter Name="FlatType" Type="String" />
            <asp:Parameter Name="BathRoom" Type="String" />
            <asp:Parameter Name="Floor" Type="String" />
            <asp:Parameter Name="Rent" Type="String" />
            <asp:Parameter Name="SecurityDeposit" Type="String" />
            <asp:Parameter Name="FlatArea" Type="String" />
            <asp:Parameter Name="LightBill" Type="String" />
            <asp:Parameter Name="Parking" Type="String" />
            <asp:Parameter Name="MoreAboutFlat" Type="String" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Counter" Type="String" />
            <asp:Parameter Name="Confirm" Type="String" />
            <asp:Parameter Name="Disable" Type="String" />
            <asp:Parameter Name="Scheme" Type="String" />
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="New" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ActivationDate" DbType="Date" />
            <asp:Parameter Name="OwnerName" Type="String" />
            <asp:Parameter Name="ContactNo1" Type="String" />
            <asp:Parameter Name="ContactNo2" Type="String" />
            <asp:Parameter Name="FlatLocation" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="NearestLocation" Type="String" />
            <asp:Parameter Name="UploadPhoto1" Type="String" />
            <asp:Parameter Name="UploadPhoto2" Type="String" />
            <asp:Parameter Name="UploadPhoto3" Type="String" />
            <asp:Parameter Name="FlatType" Type="String" />
            <asp:Parameter Name="BathRoom" Type="String" />
            <asp:Parameter Name="Floor" Type="String" />
            <asp:Parameter Name="Rent" Type="String" />
            <asp:Parameter Name="SecurityDeposit" Type="String" />
            <asp:Parameter Name="FlatArea" Type="String" />
            <asp:Parameter Name="LightBill" Type="String" />
            <asp:Parameter Name="Parking" Type="String" />
            <asp:Parameter Name="MoreAboutFlat" Type="String" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Counter" Type="String" />
            <asp:Parameter Name="Confirm" Type="String" />
            <asp:Parameter Name="Disable" Type="String" />
            <asp:Parameter Name="Scheme" Type="String" />
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="New" Type="String" />
            <asp:Parameter Name="FlatId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>