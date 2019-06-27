<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="students1.Services.Hostel.Acknowledgement" EnableEventValidation = "false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Acknowledgement</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3><asp:Label ID="Label1" runat="server" Text="You can take screenshot or Save as Pdf of this page. You have to show this confirmation page to Owner for security purpose." ForeColor="Red"></asp:Label></h3>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="ContactNo" 
            DataSourceID="SqlDataSource1">
            <ItemTemplate>
            <center><h3><asp:Label ID="Label1" runat="server" Text="Owner Details"></asp:Label></h3></center>
            <table><tr><td>Hostel Location:</td><td><asp:Label ID="RoomLocationLabel" runat="server" 
                    Text='<%# Eval("HostelLocation") %>' />
                </td></tr>
                <tr><td>Name:</td><td>
                <asp:Label ID="Expr1Label" runat="server" Text='<%# Eval("Expr1") %>' />
                </td></tr>
                <tr><td>Contact No 1:</td><td><asp:Label ID="ContactNo1Label" runat="server" 
                    Text='<%# Eval("ContactNo1") %>' />
                </td></tr>
                <tr><td>Contact No 2</td><td><asp:Label ID="ContactNo2Label" runat="server" 
                    Text='<%# Eval("ContactNo2") %>' />
                </td></tr></table>
                <hr />
                <center><h3><asp:Label ID="Label2" runat="server" Text="Student Details"></asp:Label></h3></center>
            <table><tr><td>Name:</td><td><asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' /></td></tr>
            <tr><td>ContactNo:</td><td><asp:Label ID="ContactNoLabel" runat="server" Text='<%# Eval("ContactNo") %>' /></td></tr>
            <tr><td>Education:</td><td><asp:Label ID="EducationLabel" runat="server" Text='<%# Eval("Education") %>' /></td></tr>
            <tr><td>City:</td><td><asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' /></td></tr>
            <tr><td>State:</td><td><asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' /></td></tr></table>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            SelectCommand="SELECT Users.Name, Users.ContactNo, Users.Education, Users.City, Users.State, Hostel.HostelLocation, Hostel.Name AS Expr1, Hostel.ContactNo1, Hostel.ContactNo2 FROM Users CROSS JOIN Hostel WHERE (Hostel.HostelId = @HostelId) AND (Users.ContactNo = @UserId)">
            <SelectParameters>
                <asp:SessionParameter Name="UserId" SessionField="UserId" />
                <asp:SessionParameter Name="HostelId" SessionField="HostelId" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <h3>Note:</h3>
    <hr />
    1) studzer.com is a mediator, which introduce Students and Owners.<br />
    2) studzer.com is not responsible for any kind of issue (related to money, damage, misbehviour).<br />
    3) The information of Students and Owners is filled by their own. That's Why studzer.com does not taking gurantee that this information is totally correct.
    
    <center>
        <asp:Button ID="Button1" runat="server" Text="Save as Pdf" 
            onclick="Button1_Click" /></center></form>
</body>
</html>
