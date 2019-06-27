<%@ Page Title="Mess Requests" Language="C#" MasterPageFile="~/cba321/cba322.Master" AutoEventWireup="true" CodeBehind="MessRequests.aspx.cs" Inherits="students1.cba321.Mess.MessRequests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="MessId" 
        DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="MessId" HeaderText="MessId" InsertVisible="False" 
                ReadOnly="True" SortExpression="MessId" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" 
                SortExpression="UserId" />
            <asp:BoundField DataField="ActivationDate" HeaderText="ActivationDate" 
                SortExpression="ActivationDate" />
            <asp:BoundField DataField="MessType" HeaderText="MessType" 
                SortExpression="MessType" />
            <asp:BoundField DataField="MessLocation" HeaderText="MessLocation" 
                SortExpression="MessLocation" />
            <asp:BoundField DataField="NearestLocation" HeaderText="NearestLocation" 
                SortExpression="NearestLocation" />
            <asp:BoundField DataField="MonthlyPrice" HeaderText="MonthlyPrice" 
                SortExpression="MonthlyPrice" />
            <asp:BoundField DataField="TiffinFacility" HeaderText="TiffinFacility" 
                SortExpression="TiffinFacility" />
               
            <asp:BoundField DataField="FullChapati" HeaderText="FullChapati" 
                SortExpression="FullChapati" />
            <asp:BoundField DataField="FullSabji" HeaderText="FullSabji" 
                SortExpression="FullSabji" />
            <asp:BoundField DataField="FullRice" HeaderText="FullRice" 
                SortExpression="FullRice" />
            <asp:BoundField DataField="FullDal" HeaderText="FullDal" 
                SortExpression="FullDal" />
            <asp:BoundField DataField="FullSalad" HeaderText="FullSalad" 
                SortExpression="FullSalad" />
            <asp:BoundField DataField="FullMonthlyPrice" HeaderText="FullMonthlyPrice" 
                SortExpression="FullMonthlyPrice" />
            <asp:BoundField DataField="HalfChapati" HeaderText="HalfChapati" 
                SortExpression="HalfChapati" />
            <asp:BoundField DataField="Halfsabji" HeaderText="Halfsabji" 
                SortExpression="Halfsabji" />
            <asp:BoundField DataField="HalfRice" HeaderText="HalfRice" 
                SortExpression="HalfRice" />
            <asp:BoundField DataField="HalfDal" HeaderText="HalfDal" 
                SortExpression="HalfDal" />
            <asp:BoundField DataField="HalfSalad" HeaderText="HalfSalad" 
                SortExpression="HalfSalad" />
            <asp:BoundField DataField="HalfMonthlyPrice" HeaderText="HalfMonthlyPrice" 
                SortExpression="HalfMonthlyPrice" />
            <asp:ImageField DataImageUrlField="UploadPhoto1" ControlStyle-Width="100"
        ControlStyle-Height = "100" HeaderText = "Photo 1">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
            </asp:ImageField>
        <asp:ImageField DataImageUrlField="UploadPhoto2" ControlStyle-Width="100"
        ControlStyle-Height = "100" HeaderText = "Photo 2">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
            </asp:ImageField>
       <asp:BoundField DataField="Scheme" HeaderText="Scheme" 
                SortExpression="Scheme" />
            <asp:BoundField DataField="Counter" HeaderText="Counter" 
                SortExpression="Counter" />
            <asp:BoundField DataField="Disable" HeaderText="Disable" 
                SortExpression="Disable" />
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
        DeleteCommand="DELETE FROM [Mess] WHERE [MessId] = @MessId" 
        InsertCommand="INSERT INTO [Mess] ([UserId], [ActivationDate], [MessType], [MessLocation], [NearestLocation], [MonthlyPrice], [TiffinFacility], [FullChapati], [FullSabji], [FullRice], [FullDal], [FullSalad], [FullMonthlyPrice], [HalfChapati], [Halfsabji], [HalfRice], [HalfDal], [HalfSalad], [HalfMonthlyPrice], [UploadPhoto1], [UploadPhoto2], [Scheme], [Counter], [Disable], [Name], [ContactNo1], [ContactNo2], [State], [City], [New]) VALUES (@UserId, @ActivationDate, @MessType, @MessLocation, @NearestLocation, @MonthlyPrice, @TiffinFacility, @FullChapati, @FullSabji, @FullRice, @FullDal, @FullSalad, @FullMonthlyPrice, @HalfChapati, @Halfsabji, @HalfRice, @HalfDal, @HalfSalad, @HalfMonthlyPrice, @UploadPhoto1, @UploadPhoto2, @Scheme, @Counter, @Disable, @Name, @ContactNo1, @ContactNo2, @State, @City, @New)" 
        SelectCommand="SELECT [MessId], [UserId], [ActivationDate], [MessType], [MessLocation], [NearestLocation], [MonthlyPrice], [TiffinFacility], [FullChapati], [FullSabji], [FullRice], [FullDal], [FullSalad], [FullMonthlyPrice], [HalfChapati], [Halfsabji], [HalfRice], [HalfDal], [HalfSalad], [HalfMonthlyPrice], [UploadPhoto1], [UploadPhoto2], [Scheme], [Counter], [Disable], [Name], [ContactNo1], [ContactNo2], [State], [City], [New] FROM [Mess] WHERE ([Disable] = @Disable)" 
        
        
        UpdateCommand="UPDATE [Mess] SET [UserId] = @UserId, [ActivationDate] = @ActivationDate, [MessType] = @MessType, [MessLocation] = @MessLocation, [NearestLocation] = @NearestLocation, [MonthlyPrice] = @MonthlyPrice, [TiffinFacility] = @TiffinFacility, [FullChapati] = @FullChapati, [FullSabji] = @FullSabji, [FullRice] = @FullRice, [FullDal] = @FullDal, [FullSalad] = @FullSalad, [FullMonthlyPrice] = @FullMonthlyPrice, [HalfChapati] = @HalfChapati, [Halfsabji] = @Halfsabji, [HalfRice] = @HalfRice, [HalfDal] = @HalfDal, [HalfSalad] = @HalfSalad, [HalfMonthlyPrice] = @HalfMonthlyPrice, [UploadPhoto1] = @UploadPhoto1, [UploadPhoto2] = @UploadPhoto2, [Scheme] = @Scheme, [Counter] = @Counter, [Disable] = @Disable, [Name] = @Name, [ContactNo1] = @ContactNo1, [ContactNo2] = @ContactNo2, [State] = @State, [City] = @City, [New] = @New WHERE [MessId] = @MessId">
        <DeleteParameters>
            <asp:Parameter Name="MessId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="ActivationDate" DbType="Date" />
            <asp:Parameter Name="MessType" Type="String" />
            <asp:Parameter Name="MessLocation" Type="String" />
            <asp:Parameter Name="NearestLocation" Type="String" />
            <asp:Parameter Name="MonthlyPrice" Type="String" />
            <asp:Parameter Name="TiffinFacility" Type="String" />
            <asp:Parameter Name="FullChapati" Type="String" />
            <asp:Parameter Name="FullSabji" Type="String" />
            <asp:Parameter Name="FullRice" Type="String" />
            <asp:Parameter Name="FullDal" Type="String" />
            <asp:Parameter Name="FullSalad" Type="String" />
            <asp:Parameter Name="FullMonthlyPrice" Type="String" />
            <asp:Parameter Name="HalfChapati" Type="String" />
            <asp:Parameter Name="Halfsabji" Type="String" />
            <asp:Parameter Name="HalfRice" Type="String" />
            <asp:Parameter Name="HalfDal" Type="String" />
            <asp:Parameter Name="HalfSalad" Type="String" />
            <asp:Parameter Name="HalfMonthlyPrice" Type="String" />
            <asp:Parameter Name="UploadPhoto1" Type="String" />
            <asp:Parameter Name="UploadPhoto2" Type="String" />
            <asp:Parameter Name="Scheme" Type="String" />
            <asp:Parameter Name="Counter" Type="String" />
            <asp:Parameter Name="Disable" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ContactNo1" Type="String" />
            <asp:Parameter Name="ContactNo2" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="New" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hfDisable" Name="Disable" PropertyName="Value" 
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="ActivationDate" DbType="Date" />
            <asp:Parameter Name="MessType" Type="String" />
            <asp:Parameter Name="MessLocation" Type="String" />
            <asp:Parameter Name="NearestLocation" Type="String" />
            <asp:Parameter Name="MonthlyPrice" Type="String" />
            <asp:Parameter Name="TiffinFacility" Type="String" />
            <asp:Parameter Name="FullChapati" Type="String" />
            <asp:Parameter Name="FullSabji" Type="String" />
            <asp:Parameter Name="FullRice" Type="String" />
            <asp:Parameter Name="FullDal" Type="String" />
            <asp:Parameter Name="FullSalad" Type="String" />
            <asp:Parameter Name="FullMonthlyPrice" Type="String" />
            <asp:Parameter Name="HalfChapati" Type="String" />
            <asp:Parameter Name="Halfsabji" Type="String" />
            <asp:Parameter Name="HalfRice" Type="String" />
            <asp:Parameter Name="HalfDal" Type="String" />
            <asp:Parameter Name="HalfSalad" Type="String" />
            <asp:Parameter Name="HalfMonthlyPrice" Type="String" />
            <asp:Parameter Name="UploadPhoto1" Type="String" />
            <asp:Parameter Name="UploadPhoto2" Type="String" />
            <asp:Parameter Name="Scheme" Type="String" />
            <asp:Parameter Name="Counter" Type="String" />
            <asp:Parameter Name="Disable" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ContactNo1" Type="String" />
            <asp:Parameter Name="ContactNo2" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="New" Type="String" />
            <asp:Parameter Name="MessId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <asp:HiddenField ID="hfDisable" runat="server" />
    
</asp:Content>
