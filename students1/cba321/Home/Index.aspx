<%@ Page Title="Home" Language="C#" MasterPageFile="~/cba321/cba322.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="students1.cba321.Home.Index" %>
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
            <tr><td>Location</td><td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Home</asp:ListItem>
                    <asp:ListItem>UserPanel</asp:ListItem>
                </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="DropDownList1" ErrorMessage="RequiredFieldValidator" 
                ForeColor="#CC0000">*</asp:RequiredFieldValidator>
            </td></tr>
            <tr><td>No Of Days</td><td>
                <asp:TextBox ID="txtNoOfDays" runat="server" Width="100px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtNoOfDays" ErrorMessage="RequiredFieldValidator" 
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
                InsertCommand="INSERT INTO [HomePageAds] ([Photo], [Location], [Date], [EndingDate]) VALUES (@Photo, @Location, @Date, @EndingDate)" 
                SelectCommand="SELECT * FROM [HomePageAds]" 
                
        
        UpdateCommand="UPDATE [HomePageAds] SET [Photo] = @Photo, [Location] = @Location, [Date] = @Date, [EndingDate] = @EndingDate WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="hfImage" Name="Photo" PropertyName="Value" 
                        Type="String" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="Location" 
                        PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="hfDate" DbType="Date" Name="Date" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="hfEndingDate" DbType="Date" Name="EndingDate" 
                        PropertyName="Value" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Photo" Type="String" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter DbType="Date" Name="Date" />
                    <asp:Parameter DbType="Date" Name="EndingDate" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
    <asp:HiddenField ID="hfImage" runat="server" />
    <asp:HiddenField ID="hfDate" runat="server" />
    <asp:HiddenField ID="hfEndingDate" runat="server" />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sqlds" 
        Width="100%">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                ReadOnly="True" SortExpression="Id" />
                <asp:ImageField DataImageUrlField="Photo" ControlStyle-Width="100"
        ControlStyle-Height = "100" HeaderText = "Photo">
            <ControlStyle Height="100px" Width="100px"></ControlStyle></asp:ImageField>
            <asp:BoundField DataField="Location" HeaderText="Location" 
                SortExpression="Location" />
                
            <asp:BoundField DataField="Date" HeaderText="Starting Date" SortExpression="Date" />
            <asp:BoundField DataField="EndingDate" HeaderText="Ending Date" 
                SortExpression="EndingDate" />
                
        </Columns>
    </asp:GridView>
</asp:Content>
