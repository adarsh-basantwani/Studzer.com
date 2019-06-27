<%@ Page Title="Add Toppers" Language="C#" MasterPageFile="~/Services/Tutions/Site1.Master" AutoEventWireup="true" CodeBehind="AddToppers.aspx.cs" Inherits="students1.Services.Tutions.AddToppers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
<legend>Topper Information<i class="fa fa-pencil pull-right"></i></legend>
                   <div class="form-group">
                          <asp:Label ID="lblUploadPhoto1" runat="server" Text="Topper Photo" 
                              CssClass="col-lg-4 control-label"></asp:Label>  
                            <div class="col-lg-8">
                                <asp:FileUpload ID="fuUploadPhoto1" runat="server" CssClass="form-control" />                           
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblTopperDetails" runat="server" Text="Topper Details" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtTopperDetails" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <div class="col-lg-7">
                                <asp:TextBox ID="txtTopperDetails" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" placeholder="Topper Details"></asp:TextBox>
                            </div>
                        </div>
                            <div class="form-group">
                            <div class="col-lg-5 col-lg-offset-4">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" 
                                    Text="Next" onclick="btnSubmit_Click" />
                                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-warning" NavigateUrl="~/Services/Tutions/TutionPanel.aspx">Cancel</asp:HyperLink>               
                            </div>
                        </div><asp:HiddenField ID="hfUploadPhoto1" runat="server" />
                        <asp:SqlDataSource ID="SqlTopper" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                             DeleteCommand="DELETE FROM [Topper] WHERE [Id] = @Id" 
                             InsertCommand="INSERT INTO [Topper] ([TutionId], [Photo], [Details]) VALUES (@TutionId, @Photo, @Details)" 
                             SelectCommand="SELECT * FROM [Topper]" 
                             
                             
                             
                             
                            UpdateCommand="UPDATE [Topper] SET [TutionId] = @TutionId, [Photo] = @Photo, [Details] = @Details WHERE [Id] = @Id">
                             <DeleteParameters>
                                 <asp:Parameter Name="Id" Type="Int32" />
                             </DeleteParameters>
                             <InsertParameters>
                                 <asp:SessionParameter Name="TutionId" SessionField="TutionId" Type="Int32" />
                                 <asp:ControlParameter ControlID="hfUploadPhoto1" Name="Photo" 
                                     PropertyName="Value" Type="String" />
                                 <asp:ControlParameter ControlID="txtTopperDetails" Name="Details" 
                                     PropertyName="Text" Type="String" />
                             </InsertParameters>
                             <UpdateParameters>
                                 <asp:Parameter Name="TutionId" Type="Int32" />
                                 <asp:Parameter Name="Photo" Type="String" />
                                 <asp:Parameter Name="Details" Type="String" />
                                 <asp:Parameter Name="Id" Type="Int32" />
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
