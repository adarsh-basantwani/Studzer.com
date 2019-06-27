<%@ Page Title="Password Settings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PasswordSettings.aspx.cs" Inherits="students1.Account.ChnagePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                         <legend>Change Password<i class="fa fa-pencil pull-right"></i></legend>
                         <div class="form-group">
                            <asp:Label ID="lblOldPassword" runat="server" Text="Old Password" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtOldPassword" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtOldPassword" runat="server" placeholder="Old Password" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="lblNewPassword" runat="server" Text="New Password" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtNewPassword" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtNewPassword" runat="server" placeholder="New Password" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtConfirmPassword" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" 
                ErrorMessage="CompareValidator" ForeColor="Red" Display="Dynamic">Not Matching</asp:CompareValidator>
            
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtConfirmPassword" runat="server" placeholder="Confirm Password" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-6 col-lg-offset-4">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" 
                                    Text="Submit" onclick="btnSubmit_Click"  />
                                  <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Account/UserPanel.aspx" CssClass="btn btn-warning">Back</asp:HyperLink>     
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    DeleteCommand="DELETE FROM [Users] WHERE [ContactNo] = @ContactNo" 
                                    InsertCommand="INSERT INTO [Users] ([Password], [ContactNo]) VALUES (@Password, @ContactNo)" 
                                    SelectCommand="SELECT [Password], [ContactNo] FROM [Users] WHERE ([ContactNo] = @ContactNo)" 
                                    UpdateCommand="UPDATE [Users] SET [Password] = @Password WHERE [ContactNo] = @ContactNo">
                                    <DeleteParameters>
                                        <asp:Parameter Name="ContactNo" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Password" Type="String" />
                                        <asp:Parameter Name="ContactNo" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ContactNo" SessionField="UserId" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="hfPassword" Name="Password" 
                                            PropertyName="Value" Type="String" />
                                        <asp:SessionParameter Name="ContactNo" SessionField="UserId" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:HiddenField ID="hfPassword" runat="server" />
                       </div>
                       </div>
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
