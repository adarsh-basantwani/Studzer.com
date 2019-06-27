<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePhoto.aspx.cs" Inherits="students1.Account.ChangePhoto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<title>Change Photo</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 text-center">
            <div>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlPhoto">
    <ItemTemplate>
                    <center>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Photo") %>' Height="200px" Width="200px" />
                    </center>
                </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlPhoto" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        
                    SelectCommand="SELECT [ContactNo], [Photo], [UserId] FROM [Users] WHERE ([ContactNo] = @ContactNo)" 
                    DeleteCommand="DELETE FROM [Users] WHERE [UserId] = @UserId" 
                    InsertCommand="INSERT INTO [Users] ([ContactNo], [Photo]) VALUES (@ContactNo, @Photo)" 
                    UpdateCommand="UPDATE Users SET Photo = @Photo WHERE (ContactNo = @ContactNo)">
        <DeleteParameters>
            <asp:Parameter Name="UserId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ContactNo" Type="String" />
            <asp:Parameter Name="Photo" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="ContactNo" SessionField="UserId" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:SessionParameter Name="ContactNo" SessionField="UserId" Type="String" />
            <asp:ControlParameter ControlID="hfUploadPhoto" Name="Photo" 
                PropertyName="Value" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
            </div>
        </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                    <legend>Change Profile Photo<i class="fa fa-pencil pull-right"></i></legend>
                    <div class="form-group">
                          <asp:Label ID="lblUploadPhoto" runat="server" Text="Select Photo" CssClass="col-lg-4 control-label"></asp:Label> 
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="fuUploadPhoto" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                     
                            <div class="col-lg-8">
                                <asp:FileUpload ID="fuUploadPhoto" runat="server" CssClass="form-control" />                           
                            </div>
                        </div>
                    
                       <div class="form-group">
                            <div class="col-lg-7 col-lg-offset-4">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" 
                                    Text="Change" onclick="btnSubmit_Click" />
                                  <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Account/Profile.aspx" CssClass="btn btn-warning">Back to Profile</asp:HyperLink>                              
                            </div>
                        </div>
                        <asp:HiddenField ID="hfUploadPhoto" runat="server" />
    </fieldset>
                </div>
                
            </div>
        </div></div>
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
