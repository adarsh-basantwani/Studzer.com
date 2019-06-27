<%@ Page Title="Add Location" Language="C#" MasterPageFile="~/cba321/cba322.Master" AutoEventWireup="true" CodeBehind="AddLocation.aspx.cs" Inherits="students1.cba321.AddLocation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" cellspacing="3px" >
        <tr><td colspan="2">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Pristina" 
                Font-Size="X-Large" ForeColor="Black" Text="SignUp" style="text-shadow:0px 0px 10px white" ></asp:Label>
            <hr />
            </td></tr>
        <tr><td>State</td><td>
            <asp:TextBox ID="txtState" runat="server" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtState" ErrorMessage="RequiredFieldValidator" 
                ForeColor="#CC0000">*</asp:RequiredFieldValidator>
            </td></tr>
        <tr><td>City</td><td>
            <asp:TextBox ID="txtCity" runat="server" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtCity" ErrorMessage="RequiredFieldValidator" 
                ForeColor="#CC0000">*</asp:RequiredFieldValidator>
            </td></tr>
        <tr><td>Nearest Location</td><td>
            <asp:TextBox ID="txtNearestLocation" runat="server" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtNearestLocation" ErrorMessage="RequiredFieldValidator" 
                ForeColor="#CC0000">*</asp:RequiredFieldValidator>
            </td></tr>
        <tr><td>&nbsp;</td><td>
            <asp:Button ID="btnReg" runat="server" Text="Register" onclick="btnReg_Click" />
            </td></tr>
        <tr><td colspan="2">
            <hr />
            <asp:Label ID="lbl" runat="server" Font-Bold="True" Font-Names="Arial" 
                ForeColor="Red"></asp:Label>
            <asp:SqlDataSource ID="sqlds" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [Location] WHERE [Id] = @Id" 
                InsertCommand="INSERT INTO [Location] ([State], [City], [NearestLocation]) VALUES (@State, @City, @NearestLocation)" 
                SelectCommand="SELECT * FROM [Location]" 
                
                UpdateCommand="UPDATE [Location] SET [State] = @State, [City] = @City, [NearestLocation] = @NearestLocation WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtState" Name="State" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="txtCity" Name="City" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="txtNearestLocation" Name="NearestLocation" 
                        PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="NearestLocation" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" 
                DataSourceID="sqlds">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                        ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="NearestLocation" HeaderText="NearestLocation" 
                        SortExpression="NearestLocation" />
                </Columns>
            </asp:GridView>
            </td></tr>
    </table>
</asp:Content>
