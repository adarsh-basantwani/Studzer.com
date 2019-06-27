<%@ Page Title="FeedBack" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FeedBack.aspx.cs" Inherits="students1.Account.FeedBack" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                         <legend>FeedBack<i class="fa fa-pencil pull-right"></i></legend>
                        <div class="form-group">
                            <asp:Label ID="lblFeedBack" runat="server" Text="FeedBack" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtFeedBack" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <div class="col-lg-5">
                                <asp:TextBox ID="txtFeedBack" runat="server" CssClass="form-control" placeholder="FeedBack" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-6 col-lg-offset-4">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" 
                                    Text="Submit" onclick="btnSubmit_Click"  />
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Account/UserPanel.aspx" CssClass="btn btn-warning">Back</asp:HyperLink></div>
                                    </div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                             DeleteCommand="DELETE FROM [FeedBack] WHERE [ContactNo] = @ContactNo" 
                             InsertCommand="INSERT INTO [FeedBack] ([ContactNo], [Name], [FeedBack]) VALUES (@ContactNo, @Name, @FeedBack)" 
                             SelectCommand="SELECT [ContactNo], [Name], [FeedBack] FROM [FeedBack]" 
                             UpdateCommand="UPDATE [FeedBack] SET [Name] = @Name, [FeedBack] = @FeedBack WHERE [ContactNo] = @ContactNo">
                            <DeleteParameters>
                                <asp:Parameter Name="ContactNo" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:SessionParameter Name="ContactNo" SessionField="UserId" Type="String" />
                                <asp:SessionParameter Name="Name" SessionField="Name" Type="String" />
                                <asp:ControlParameter ControlID="txtFeedBack" Name="FeedBack" 
                                    PropertyName="Text" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Name" Type="String" />
                                <asp:Parameter Name="FeedBack" Type="String" />
                                <asp:Parameter Name="ContactNo" Type="String" />
                            </UpdateParameters>
                         </asp:SqlDataSource>
                        </fieldset>
        </div>
        </div>
        </div>
        </div>
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
