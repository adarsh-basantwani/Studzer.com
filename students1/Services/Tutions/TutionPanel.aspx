<%@ Page Title="Tution Panel" Language="C#" MasterPageFile="~/Services/Tutions/Site1.Master" AutoEventWireup="true" CodeBehind="TutionPanel.aspx.cs" Inherits="students1.Services.Tutions.TutionPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Hello<asp:Label ID="lblName" runat="server" Text=""></asp:Label></h2>
<br />
<h2>You can Add subjects, Toppers here.</h2>
<br />
<h2>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label></h2>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT ActivationDate, TutionId FROM Tution WHERE (ContactNo = @ContactNo) AND (ActivationDate IS NOT NULL)" 
        DeleteCommand="DELETE FROM [Tution] WHERE [TutionId] = @TutionId" 
        InsertCommand="INSERT INTO [Tution] ([ActivationDate]) VALUES (@ActivationDate)" 
        
        UpdateCommand="UPDATE Tution SET Disable = @Disable WHERE (ContactNo = @ContactNo)">
        <DeleteParameters>
            <asp:Parameter Name="TutionId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="ActivationDate" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="ContactNo" SessionField="UserId" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="Disable" 
                PropertyName="Value" />
            <asp:SessionParameter Name="ContactNo" SessionField="UserId" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="TutionId" 
        DataSourceID="SqlDataSource2">
        <ItemTemplate>
            <h2><a href='ViewMyAdd.aspx?TutionId=<%# Eval("TutionId") %>'>View My Add</a>
            </h2><br /><br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [TutionId] FROM [Tution] WHERE ([ContactNo] = @ContactNo)">
        <SelectParameters>
            <asp:SessionParameter Name="ContactNo" SessionField="UserId" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
<script src="../../Scripts/main/jquery.js" type="text/javascript"></script>
    <script src="../../Scripts/main/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../Scripts/main/jquery.backstretch.js" type="text/javascript"></script>
    <script type="text/javascript">
        'use strict';

        /* ========================== */
        /* ::::::: Backstrech ::::::: */
        /* ========================== */
        // You may also attach Backstretch to a block-level element
        $.backstretch(
        [
            "../../images/background/blue.jpg"
        ],

        {
            duration: 4500,
            fade: 1500
        }
    );
    </script>
</asp:Content>
