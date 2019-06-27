<%@ Page Title="Tution List" Language="C#" MasterPageFile="~/cba321/cba322.Master" AutoEventWireup="true" CodeBehind="TutionList.aspx.cs" Inherits="students1.cba321.Tution.TutionList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="TutionId" 
        DataSourceID="SqlDataSource1">
        <ItemTemplate>
        <table border="1px" cellpadding="2px" cellspacing="2px"><tr><th>TutionId</th><th>OwnerName</th><th>TutionName</th><th>EmailId</th><th>ContactNo</th>
        <th>Password</th><th>State</th><th>City</th><th>NearestLocation</th><th>Address</th><th>Photo</th><th>Disable</th><th></th>
        </tr>
        <tr>
        <td><asp:Label ID="TutionIdLabel" runat="server" Text='<%# Eval("TutionId") %>' />
        </td><td><asp:Label ID="OwnerNameLabel" runat="server" Text='<%# Eval("OwnerName") %>' />
        </td><td><asp:Label ID="TutionNameLabel" runat="server" 
                Text='<%# Eval("TutionName") %>' />
            </td><td><asp:Label ID="EmailIdLabel" runat="server" Text='<%# Eval("EmailId") %>' />
            </td><td><asp:Label ID="ContactNoLabel" runat="server" Text='<%# Eval("ContactNo") %>' /></td>
        <td><asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
        </td><td><asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' /></td><td><asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
        </td><td>
            <asp:Label ID="NearestLocationLabel" runat="server" 
                Text='<%# Eval("NearestLocation") %>' /></td><td><asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' /></td>
                <td><asp:Image runat="server" ImageUrl='<%# Eval("Photo") %>' Width="100px" Height="100px" /></th><td><asp:Label ID="DisableLabel" runat="server" Text='<%# Eval("Disable") %>' /></td>
        <td><a href='TutionMail.aspx?Id=<%# Eval("TutionId") %>&EmailId=<%# Eval("EmailId") %>&ContactNo=<%# Eval("ContactNo") %>&Password=<%# Eval("Password") %>'>Mail</a></td></tr>
        </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT [TutionId], [OwnerName], [TutionName], [EmailId], [ContactNo], [Password], [State], [City], [NearestLocation], [Address], [Photo], [Disable] FROM [Tution] WHERE ([Disable] = @Disable)">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="Disable" 
                PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenField1" runat="server" />
</asp:Content>
