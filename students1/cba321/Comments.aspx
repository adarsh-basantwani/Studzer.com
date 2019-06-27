<%@ Page Title="Comments" Language="C#" MasterPageFile="~/cba321/cba322.Master" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="students1.cba321.Comments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" cellspacing="3px" >
<tr><td colspan="2">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Pristina" 
                Font-Size="X-Large" ForeColor="Black" Text="Add Topic" style="text-shadow:0px 0px 10px white" ></asp:Label>
            <hr />
            </td></tr>
            <tr><td>Topic Name</td><td>
            <asp:TextBox ID="txtName" runat="server" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtName" ErrorMessage="RequiredFieldValidator" 
                ForeColor="#CC0000">*</asp:RequiredFieldValidator>
            </td></tr>
                <tr><td>&nbsp;</td><td>
            <asp:Button ID="btnReg" runat="server" Text="Upload" onclick="btnReg_Click" />
            </td></tr>
            </table>
            <hr />
            <asp:Label ID="lbl" runat="server" Font-Bold="True" Font-Names="Arial" 
                ForeColor="Red"></asp:Label><hr />
            <asp:SqlDataSource ID="sqlds" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [CommentTopic] WHERE [TopicId] = @TopicId" 
                InsertCommand="INSERT INTO CommentTopic(TopicName) VALUES (@TopicName)" 
                SelectCommand="SELECT * FROM [CommentTopic]" 
                
        
        
        
        
        
        UpdateCommand="UPDATE [CommentTopic] SET [TopicName] = @Topic_Name WHERE [TopicId] = @TopicId">
                <DeleteParameters>
                    <asp:Parameter Name="TopicId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtName" Name="TopicName" 
                        PropertyName="Text" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Topic_Name" Type="String" />
                    <asp:Parameter Name="TopicId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <table width="50%" cellspacing="3px" >
            <tr><td>Topic Name</td><td>
                <asp:DropDownList ID="DropDownList1" runat="server"  Width="150px" 
                    AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="TopicName" 
                    DataValueField="TopicName">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [TopicName] FROM [CommentTopic]"></asp:SqlDataSource>
            </td></tr>
            </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" DataSourceID="SqlComments" Width="100%" 
    AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Comment" HeaderText="Comment" 
                SortExpression="Comment" />
            <asp:BoundField DataField="Love" HeaderText="Likes" SortExpression="Love" />
            <asp:BoundField DataField="Topic" HeaderText="Topic" SortExpression="Topic" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlComments" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Comment] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Comment] ([Name], [Comment], [Love]) VALUES (@Name, @Comment, @Love)" 
        SelectCommand="SELECT Id, Name, Comment, Love, Topic FROM Comment WHERE (Topic = @Topic)" 
        
        
        UpdateCommand="UPDATE [Comment] SET [Name] = @Name, [Comment] = @Comment, [Love] = @Love WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="Love" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Topic" 
                PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="Love" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
