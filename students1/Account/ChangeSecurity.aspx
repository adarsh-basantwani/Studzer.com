<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangeSecurity.aspx.cs" Inherits="students1.Account.ChangeSecurity" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<title>Change Security Question</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                     <legend>Change Security Question<i class="fa fa-pencil pull-right"></i></legend>
                         <div class="form-group">
                          <asp:Label ID="lblSecurityQuestion" runat="server" Text="Security Question" CssClass="col-lg-4 control-label"></asp:Label>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="ddlState" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                          
                            <div class="col-lg-8">
                                <asp:DropDownList ID="ddlState" runat="server" 
                                    CssClass="form-control ddl">
                                    <asp:ListItem Selected="True">--Select Security Question--</asp:ListItem>
                                    <asp:ListItem>What is your Nick Name??</asp:ListItem>
                                    <asp:ListItem>Which is your favourite Colour??</asp:ListItem>
                                    <asp:ListItem>What is the name of your First School??</asp:ListItem>
                                    <asp:ListItem>In Which year your Father was Born??</asp:ListItem>
                                    <asp:ListItem>Which Place you like to visit the most??</asp:ListItem>
                                </asp:DropDownList>                              
                         </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblAnswer" runat="server" Text="Answer" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtAnswer" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtAnswer" runat="server" placeholder="Answer" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-6 col-lg-offset-4">
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" 
                                    Text="Submit" onclick="btnSubmit_Click"  />
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Account/UserPanel.aspx" CssClass="btn btn-warning">Back</asp:HyperLink>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    DeleteCommand="DELETE FROM [Users] WHERE [ContactNo] = @ContactNo" 
                                    InsertCommand="INSERT INTO [Users] ([Password], [ContactNo]) VALUES (@Password, @ContactNo)" 
                                    SelectCommand="SELECT [Password], [ContactNo] FROM [Users] WHERE ([ContactNo] = @ContactNo)" 
                                    
                                    UpdateCommand="UPDATE Users SET SecurityQuestion = @SecurityQuestion, Answer = @Answer WHERE (ContactNo = @ContactNo)">
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
                                        <asp:SessionParameter Name="ContactNo" SessionField="UserId" Type="String" />
                                        <asp:ControlParameter ControlID="ddlState" Name="SecurityQuestion" 
                                            PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="txtAnswer" Name="Answer" PropertyName="Text" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
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
