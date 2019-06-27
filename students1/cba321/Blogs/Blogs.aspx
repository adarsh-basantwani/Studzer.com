<%@ Page Title="Upload Blog" Language="C#" MasterPageFile="~/cba321/cba322.Master" AutoEventWireup="true" CodeBehind="Blogs.aspx.cs" Inherits="students1.cba321.Blogs.Blogs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" cellspacing="3px" >
<tr><td colspan="2">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Pristina" 
                Font-Size="X-Large" ForeColor="Black" Text="Upload Blog" style="text-shadow:0px 0px 10px white" ></asp:Label>
            <hr />
            </td></tr>
            <tr><td>Name</td><td>
            <asp:TextBox ID="txtName" runat="server" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtName" ErrorMessage="RequiredFieldValidator" 
                ForeColor="#CC0000">*</asp:RequiredFieldValidator>
            </td></tr>
        <tr><td>Qualification</td><td>
            <asp:TextBox ID="txtQualificaton" runat="server" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtQualificaton" ErrorMessage="RequiredFieldValidator" 
                ForeColor="#CC0000">*</asp:RequiredFieldValidator>
            </td></tr>
        <tr><td>Details</td><td>
            <asp:TextBox ID="txtDeatils" runat="server" Width="250px" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtDeatils" ErrorMessage="RequiredFieldValidator" 
                ForeColor="#CC0000">*</asp:RequiredFieldValidator>
            </td></tr>
            <tr><td>Select Photo</td><td>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
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
                DeleteCommand="DELETE FROM [Blog] WHERE [Id] = @Id" 
                InsertCommand="INSERT INTO Blog(Name, Qualification, Details, Photo, Counter) VALUES (@Name, @Qualification, @Details, @Photo, @Counter)" 
                SelectCommand="SELECT * FROM [Blog]" 
                
        
        
        UpdateCommand="UPDATE [Blog] SET [Name] = @Name, [Qualification] = @Qualification, [Details] = @Details, [Photo] = @Photo WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtName" Name="Name" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="txtQualificaton" Name="Qualification" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtDeatils" Name="Details" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="hfImage" Name="Photo" PropertyName="Value" 
                        Type="String" />
                    <asp:ControlParameter ControlID="hfCounter" Name="Counter" 
                        PropertyName="Value" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Qualification" Type="String" />
                    <asp:Parameter Name="Details" Type="String" />
                    <asp:Parameter Name="Photo" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
    <asp:HiddenField ID="hfImage" runat="server" />
    <asp:HiddenField ID="hfCounter" runat="server" />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
    ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="Id" 
        DataSourceID="SqlDataSource1">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                ReadOnly="True" SortExpression="Id" />
                
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Qualification" HeaderText="Qualification" 
                SortExpression="Qualification" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Blog] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Blog] ([Name], [Qualification], [Photo]) VALUES (@Name, @Qualification, @Photo)" 
        SelectCommand="SELECT [Id], [Name], [Qualification], [Photo] FROM [Blog]" 
        UpdateCommand="UPDATE [Blog] SET [Name] = @Name, [Qualification] = @Qualification, [Photo] = @Photo WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Qualification" Type="String" />
            <asp:Parameter Name="Photo" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Qualification" Type="String" />
            <asp:Parameter Name="Photo" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
