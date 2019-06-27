<%@ Page Title="Upload Tution" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadTution.aspx.cs" Inherits="students1.Services.Tution.UploadTution" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                         <legend>Tution Information<i class="fa fa-pencil pull-right"></i></legend>
                          <div class="form-group">
                            <asp:Label ID="lblOwnerName" runat="server" Text="Owner Name" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtOwnerName" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtOwnerName" runat="server" placeholder="Owner Name" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblTutionName" runat="server" Text="Tution Name" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtTutionName" runat="server" placeholder="Tution Name" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtTutionName" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblContactNo" runat="server" Text="Contact No." CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtContactNo" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtContactNo" runat="server" placeholder="Contact No." CssClass="form-control"></asp:TextBox><asp:SqlDataSource
                                    ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    SelectCommand="SELECT [ContactNo] FROM [Tution] WHERE ([ContactNo] = @ContactNo)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtContactNo" Name="ContactNo" 
                                            PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblEmailId" runat="server" Text="Email Id" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtEmailId" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txtEmailID" ErrorMessage="RegularExpressionValidator" 
                ForeColor="Red" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic">Not in correct format</asp:RegularExpressionValidator>
            
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtEmailId" runat="server" placeholder="Email Id" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                         <div class="form-group">
                          <asp:Label ID="lblState" runat="server" Text="State" CssClass="col-lg-4 control-label"></asp:Label> 
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="ddlState" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                         
                            <div class="col-lg-8">
                                <asp:DropDownList ID="ddlState" runat="server" 
                                    CssClass="form-control ddl" DataSourceID="SqlState" AutoPostBack="True" 
                                    DataTextField="State" DataValueField="State">
                                </asp:DropDownList>                              
                                <asp:SqlDataSource ID="SqlState" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    SelectCommand="SELECT DISTINCT [State] FROM [Location]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                          <asp:Label ID="lblCity" runat="server" Text="City" CssClass="col-lg-4 control-label"></asp:Label>  
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="ddlCity" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                        
                            <div class="col-lg-8">
                                <asp:DropDownList ID="ddlCity" runat="server" 
                                    CssClass="form-control ddl" DataSourceID="SqlCity" AutoPostBack="True" 
                                    DataTextField="City" DataValueField="City">
                                </asp:DropDownList>                              
                                <asp:SqlDataSource ID="SqlCity" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    
                                    SelectCommand="SELECT DISTINCT [City] FROM [Location] WHERE ([State] = @State)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlState" Name="State" 
                                            PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                          <asp:Label ID="lblNearestLocation" runat="server" Text="Nearest Location" CssClass="col-lg-4 control-label"></asp:Label>   
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="ddlNearestLocation" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                       
                            <div class="col-lg-8">
                                <asp:DropDownList ID="ddlNearestLocation" runat="server" 
                                    CssClass="form-control ddl" DataSourceID="SqlNearestLocation" 
                                    DataTextField="NearestLocation" DataValueField="NearestLocation">
                                </asp:DropDownList>                              
                                <asp:SqlDataSource ID="SqlNearestLocation" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    
                                    SelectCommand="SELECT DISTINCT [NearestLocation] FROM [Location] WHERE (([State] = @State) AND ([City] = @City))">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlState" Name="State" 
                                            PropertyName="SelectedValue" Type="String" />
                                        <asp:ControlParameter ControlID="ddlCity" Name="City" 
                                            PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblAddress" runat="server" Text="Address" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="txtAddress" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <div class="col-lg-7">
                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                      <div class="form-group">
                          <asp:Label ID="lblUploadPhoto1" runat="server" Text="Upload Tution Photo" 
                              CssClass="col-lg-4 control-label"></asp:Label>    
                            <div class="col-lg-8">
                                <asp:FileUpload ID="fuUploadPhoto1" runat="server" CssClass="form-control" placeholder="Company Logo" />                           
                            </div>
                        </div>
                       <div class="form-group">
                            <div class="col-lg-5 col-lg-offset-4">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" 
                                    Text="Next" onclick="btnSubmit_Click" />
                                  <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" 
                                    Text="Cancel" onclick="btnCancel_Click" />                              
                            </div>
                        </div>
                        <asp:HiddenField ID="hfUploadPhoto1" runat="server" />
                                <asp:HiddenField ID="hfPassword" runat="server" />
                                <asp:HiddenField ID="hfDisable" runat="server" />
                         <asp:SqlDataSource ID="SqlTution" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                             DeleteCommand="DELETE FROM [Tution] WHERE [TutionId] = @TutionId" 
                             InsertCommand="INSERT INTO Tution(OwnerName, TutionName, EmailId, ContactNo, Password, State, City, NearestLocation, Address, Photo, Disable) VALUES (@OwnerName, @TutionName, @EmailId, @ContactNo, @Password, @State, @City, @NearestLocation, @Address, @Photo, @Disable)" 
                             SelectCommand="SELECT * FROM [Tution]" 
                             
                             UpdateCommand="UPDATE [Tution] SET [OwnerName] = @OwnerName, [TutionName] = @TutionName, [EmailId] = @EmailId, [ContactNo] = @ContactNo, [Password] = @Password, [State] = @State, [City] = @City, [NearestLocation] = @NearestLocation, [Address] = @Address, [Photo] = @Photo WHERE [TutionId] = @TutionId">
                             <DeleteParameters>
                                 <asp:Parameter Name="TutionId" Type="Int32" />
                             </DeleteParameters>
                             <InsertParameters>
                                 <asp:ControlParameter ControlID="txtOwnerName" Name="OwnerName" 
                                     PropertyName="Text" Type="String" />
                                 <asp:ControlParameter ControlID="txtTutionName" Name="TutionName" 
                                     PropertyName="Text" Type="String" />
                                 <asp:ControlParameter ControlID="txtEmailId" Name="EmailId" PropertyName="Text" 
                                     Type="String" />
                                 <asp:ControlParameter ControlID="txtContactNo" Name="ContactNo" 
                                     PropertyName="Text" Type="String" />
                                 <asp:ControlParameter ControlID="hfPassword" Name="Password" 
                                     PropertyName="Value" Type="String" />
                                 <asp:ControlParameter ControlID="ddlState" Name="State" 
                                     PropertyName="SelectedValue" Type="String" />
                                 <asp:ControlParameter ControlID="ddlCity" Name="City" 
                                     PropertyName="SelectedValue" Type="String" />
                                 <asp:ControlParameter ControlID="ddlNearestLocation" Name="NearestLocation" 
                                     PropertyName="SelectedValue" Type="String" />
                                 <asp:ControlParameter ControlID="txtAddress" Name="Address" PropertyName="Text" 
                                     Type="String" />
                                 <asp:ControlParameter ControlID="hfUploadPhoto1" Name="Photo" 
                                     PropertyName="Value" Type="String" />
                                 <asp:ControlParameter ControlID="hfDisable" Name="Disable" 
                                     PropertyName="Value" />
                             </InsertParameters>
                             <UpdateParameters>
                                 <asp:Parameter Name="OwnerName" Type="String" />
                                 <asp:Parameter Name="TutionName" Type="String" />
                                 <asp:Parameter Name="EmailId" Type="String" />
                                 <asp:Parameter Name="ContactNo" Type="String" />
                                 <asp:Parameter Name="Password" Type="String" />
                                 <asp:Parameter Name="State" Type="String" />
                                 <asp:Parameter Name="City" Type="String" />
                                 <asp:Parameter Name="NearestLocation" Type="String" />
                                 <asp:Parameter Name="Address" Type="String" />
                                 <asp:Parameter Name="Photo" Type="String" />
                                 <asp:Parameter Name="TutionId" Type="Int32" />
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
