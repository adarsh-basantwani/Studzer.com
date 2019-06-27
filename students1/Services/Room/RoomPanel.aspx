<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoomPanel.aspx.cs" Inherits="students1.Services.RoomPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [Room] WHERE ([UserId] = @UserId)">
        <SelectParameters>
            <asp:SessionParameter Name="UserId" SessionField="UserId" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="btn" runat="server" Text="Click Here To Upload" 
           CssClass="btn btn-primary" onclick="btn_Click" />
    <asp:Panel ID="Panel1" runat="server">
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
        <asp:Label ID="Label2" runat="server" Text="You Have Not Uplaoded Any Room On Our Website"></asp:Label>
    </div></div>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Visible="false">
        <asp:DataList ID="Ids" runat="server" 
            DataSourceID="SqlIds">
            <ItemTemplate>
                RoomId: <asp:Label ID="Label1" runat="server" Text='<%# Eval("RoomId") %>' />&nbsp;&nbsp;
                <asp:HyperLink runat="server" ID="HyperLink1" NavigateUrl='~/Services/Room/RoomDetails.aspx?RoomId="<%# Eval("RoomId") %>"'>Details</asp:HyperLink>
               &nbsp;&nbsp;&nbsp;&nbsp;
                Counter:
                <asp:Label ID="CounterLabel" runat="server" Text='<%# Eval("Counter") %>' />
                &nbsp;&nbsp;&nbsp;&nbsp;
                Disable:
                <asp:Label ID="DisableLabel" runat="server" Text='<%# Eval("Disable") %>' ForeColor="Red" />
<br />
                <br />
            </ItemTemplate>

        </asp:DataList>
    <asp:SqlDataSource ID="SqlIds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
            
            SelectCommand="SELECT RoomId, Counter, Disable FROM Room WHERE (UserId = @UserId)">
        <SelectParameters>
            <asp:SessionParameter Name="UserId" SessionField="UserId" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>
