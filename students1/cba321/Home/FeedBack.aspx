<%@ Page Title="FeedBack" Language="C#" MasterPageFile="~/cba321/cba322.Master" AutoEventWireup="true" CodeBehind="FeedBack.aspx.cs" Inherits="students1.cba321.Home.FeedBack" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
    DataKeyNames="ContactNo" DataSourceID="SqlDataSource1" ForeColor="#333333" 
    GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="ContactNo" HeaderText="ContactNo" ReadOnly="True" 
                SortExpression="ContactNo" />
            <asp:BoundField DataField="FeedBack" HeaderText="FeedBack" 
                SortExpression="FeedBack" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    DeleteCommand="DELETE FROM [FeedBack] WHERE [ContactNo] = @ContactNo" 
    InsertCommand="INSERT INTO [FeedBack] ([Name], [ContactNo], [FeedBack]) VALUES (@Name, @ContactNo, @FeedBack)" 
    SelectCommand="SELECT [Name], [ContactNo], [FeedBack] FROM [FeedBack]" 
    UpdateCommand="UPDATE [FeedBack] SET [Name] = @Name, [FeedBack] = @FeedBack WHERE [ContactNo] = @ContactNo">
    <DeleteParameters>
        <asp:Parameter Name="ContactNo" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="ContactNo" Type="String" />
        <asp:Parameter Name="FeedBack" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="FeedBack" Type="String" />
        <asp:Parameter Name="ContactNo" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
