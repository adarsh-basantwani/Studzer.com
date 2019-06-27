<%@ Page Title="" Language="C#" MasterPageFile="~/cba321/cba322.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="students1.cba321.Home.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" cellspacing="3px" >
<tr><td colspan="2">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Pristina" 
                Font-Size="X-Large" ForeColor="Black" Text="Upload Add" style="text-shadow:0px 0px 10px white" ></asp:Label>
            <hr />
            </td></tr>
        <tr><td>Select File</td><td>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="FileUpload1" ErrorMessage="RequiredFieldValidator" 
                ForeColor="#CC0000">*</asp:RequiredFieldValidator>
            </td></tr>
        <tr><td>&nbsp;</td><td>
            <asp:Button ID="btnReg" runat="server" Text="Upload" onclick="btnReg_Click" />
            </td></tr>
            </table>
            <hr />
            <asp:Label ID="lbl" runat="server" Font-Bold="True" Font-Names="Arial" 
                ForeColor="Red"></asp:Label>
            <asp:SqlDataSource ID="sqlds" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [HomePageAds] WHERE [Id] = @Id" 
                InsertCommand="INSERT INTO [HomePageAds] ([Photo]) VALUES (@Photo)" 
                SelectCommand="SELECT * FROM [HomePageAds]" 
                
        UpdateCommand="UPDATE [HomePageAds] SET [Photo] = @Photo WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="hfImage" Name="Photo" PropertyName="Value" 
                        Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Photo" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
    <asp:HiddenField ID="hfImage" runat="server" />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
    ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sqlds">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                ReadOnly="True" SortExpression="Id" />
                <asp:ImageField DataImageUrlField="Photo" ControlStyle-Width="100"
        ControlStyle-Height = "100" HeaderText = "Photo">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
            </asp:ImageField>
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
</asp:Content>
