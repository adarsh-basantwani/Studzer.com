<%@ Page Title="Confirm Tution" Language="C#" MasterPageFile="~/cba321/cba322.Master" AutoEventWireup="true" CodeBehind="ConfirmTution.aspx.cs" Inherits="students1.cba321.Tution.ConfirmTution" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TutionId" 
        DataSourceID="SqlDataSource1" OnRowDataBound = "OnRowDataBound">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="TutionId" HeaderText="TutionId" 
                InsertVisible="False" ReadOnly="True" SortExpression="TutionId" />
            <asp:BoundField DataField="OwnerName" HeaderText="OwnerName" 
                SortExpression="OwnerName" />
            <asp:BoundField DataField="TutionName" HeaderText="TutionName" 
                SortExpression="TutionName" />
            <asp:BoundField DataField="EmailId" HeaderText="EmailId" 
                SortExpression="EmailId" />
            <asp:BoundField DataField="ContactNo" HeaderText="ContactNo" 
                SortExpression="ContactNo" />
            <asp:BoundField DataField="Password" HeaderText="Decrypted Password" 
                SortExpression="Password" />
                <asp:BoundField DataField="Password" HeaderText="Password" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="NearestLocation" HeaderText="NearestLocation" 
                SortExpression="NearestLocation" />
            <asp:BoundField DataField="Address" HeaderText="Address" 
                SortExpression="Address" />
            <asp:ImageField DataImageUrlField="Photo" ControlStyle-Width="100"
        ControlStyle-Height = "100" HeaderText = "Photo"></asp:ImageField>
            <asp:BoundField DataField="Disable" HeaderText="Disable" 
                SortExpression="Disable" />
            <asp:BoundField DataField="ActivationDate" HeaderText="ActivationDate" 
                SortExpression="ActivationDate" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Tution] WHERE [TutionId] = @TutionId" 
        InsertCommand="INSERT INTO [Tution] ([OwnerName], [TutionName], [EmailId], [ContactNo], [Password], [State], [City], [NearestLocation], [Address], [Photo], [Disable], [ActivationDate]) VALUES (@OwnerName, @TutionName, @EmailId, @ContactNo, @Password, @State, @City, @NearestLocation, @Address, @Photo, @Disable, @ActivationDate)" 
        SelectCommand="SELECT [TutionId], [OwnerName], [TutionName], [EmailId], [ContactNo], [Password], [State], [City], [NearestLocation], [Address], [Photo], [Disable], [ActivationDate] FROM [Tution]" 
        
        UpdateCommand="UPDATE [Tution] SET [OwnerName] = @OwnerName, [TutionName] = @TutionName, [EmailId] = @EmailId, [ContactNo] = @ContactNo, [Password] = @Password, [State] = @State, [City] = @City, [NearestLocation] = @NearestLocation, [Address] = @Address, [Photo] = @Photo, [Disable] = @Disable, [ActivationDate] = @ActivationDate WHERE [TutionId] = @TutionId">
        <DeleteParameters>
            <asp:Parameter Name="TutionId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OwnerName" Type="String" />
            <asp:Parameter Name="TutionName" Type="String" />
            <asp:Parameter Name="EmailId" Type="String" />
            <asp:Parameter Name="ContactNo" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="NearestLocation" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Photo" Type="String" />
            <asp:Parameter Name="Disable" Type="String" />
            <asp:Parameter DbType="Date" Name="ActivationDate" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="OwnerName" Type="String" />
            <asp:Parameter Name="TutionName" Type="String" />
            <asp:Parameter Name="EmailId" Type="String" />
            <asp:Parameter Name="ContactNo" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="NearestLocation" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Photo" Type="String" />
            <asp:Parameter Name="Disable" Type="String" />
            <asp:Parameter Name="ActivationDate" DbType="Date" />
            <asp:Parameter Name="TutionId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource><h2>Subject Details</h2>
     <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SubjectId" 
        DataSourceID="SqlDataSource2">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="SubjectId" HeaderText="SubjectId" 
                InsertVisible="False" ReadOnly="True" SortExpression="SubjectId" />
            <asp:BoundField DataField="TutionId" HeaderText="TutionId" 
                SortExpression="TutionId" />
            <asp:BoundField DataField="Course" HeaderText="Course" 
                SortExpression="Course" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" 
                SortExpression="Subject" />
            <asp:BoundField DataField="Faculty" HeaderText="Faculty" 
                SortExpression="Faculty" />
            <asp:BoundField DataField="BatchTiming" HeaderText="BatchTiming" 
                SortExpression="BatchTiming" />
            <asp:BoundField DataField="Fees" HeaderText="Fees" SortExpression="Fees" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Subject] WHERE [SubjectId] = @SubjectId" 
        InsertCommand="INSERT INTO [Subject] ([TutionId], [Course], [Subject], [Faculty], [BatchTiming], [Fees]) VALUES (@TutionId, @Course, @Subject, @Faculty, @BatchTiming, @Fees)" 
        SelectCommand="SELECT [SubjectId], [TutionId], [Course], [Subject], [Faculty], [BatchTiming], [Fees] FROM [Subject]" 
        
        
        UpdateCommand="UPDATE [Subject] SET [TutionId] = @TutionId, [Course] = @Course, [Subject] = @Subject, [Faculty] = @Faculty, [BatchTiming] = @BatchTiming, [Fees] = @Fees WHERE [SubjectId] = @SubjectId">
        <DeleteParameters>
            <asp:Parameter Name="SubjectId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TutionId" Type="Int32" />
            <asp:Parameter Name="Course" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="Faculty" Type="String" />
            <asp:Parameter Name="BatchTiming" Type="String" />
            <asp:Parameter Name="Fees" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TutionId" Type="Int32" />
            <asp:Parameter Name="Course" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="Faculty" Type="String" />
            <asp:Parameter Name="BatchTiming" Type="String" />
            <asp:Parameter Name="Fees" Type="String" />
            <asp:Parameter Name="SubjectId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource><h2>Topper Details</h2>
     <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" 
        DataSourceID="SqlDataSource3">
         <Columns>
             <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
             <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                 ReadOnly="True" SortExpression="Id" />
             <asp:BoundField DataField="TutionId" HeaderText="TutionId" 
                 SortExpression="TutionId" />
             <asp:ImageField DataImageUrlField="Photo" ControlStyle-Width="100"
        ControlStyle-Height = "100" HeaderText = "Photo"></asp:ImageField>
            <asp:BoundField DataField="Details" HeaderText="Details" 
                 SortExpression="Details" />
         </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Topper] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Topper] ([TutionId], [Photo], [Details]) VALUES (@TutionId, @Photo, @Details)" 
        SelectCommand="SELECT [Id], [TutionId], [Photo], [Details] FROM [Topper]" 
        
        
        UpdateCommand="UPDATE [Topper] SET [TutionId] = @TutionId, [Photo] = @Photo, [Details] = @Details WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TutionId" Type="Int32" />
            <asp:Parameter Name="Photo" Type="String" />
            <asp:Parameter Name="Details" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TutionId" Type="Int32" />
            <asp:Parameter Name="Photo" Type="String" />
            <asp:Parameter Name="Details" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
