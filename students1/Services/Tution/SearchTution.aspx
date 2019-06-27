<%@ Page Title="Search Tution" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchTution.aspx.cs" Inherits="students1.Services.Tution.SearchTution" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
<div class="col-lg-5 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                         <legend>Filter<i class="fa fa-pencil pull-right"></i></legend>
                         <div class="form-group">
                          <asp:Label ID="lblState" runat="server" Text="State" CssClass="col-lg-4 control-label"></asp:Label>                          
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
                          <asp:Label ID="Label1" runat="server" Text="Nearest Location" CssClass="col-lg-4 control-label"></asp:Label>                          
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
                            <asp:Label ID="lblTutionName" runat="server" Text="Tution Name" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtTutionName" runat="server" placeholder="Tution Name" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="lblCourse" runat="server" Text="Course Name" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                               <asp:DropDownList ID="ddlCouse" runat="server" 
                                    CssClass="form-control ddl" DataSourceID="SqlCourse" 
                                    DataTextField="Course" DataValueField="Course" AutoPostBack="True">
                                </asp:DropDownList>                              
                                <asp:SqlDataSource ID="SqlCourse" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    
                                    SelectCommand="SELECT DISTINCT [Course] FROM [Subject]">
                                </asp:SqlDataSource>
                            </div>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="lblSubject" runat="server" Text="Subject Name" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <asp:DropDownList ID="ddlSubject" runat="server" 
                                    CssClass="form-control ddl" DataSourceID="SqlSubject" 
                                    DataTextField="Subject" DataValueField="Subject">
                                </asp:DropDownList>                              
                                <asp:SqlDataSource ID="SqlSubject" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    
                                    
                                    
                                    SelectCommand="SELECT DISTINCT Subject FROM Subject WHERE (Course = @Course)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlCouse" Name="Course" 
                                            PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource></div>
                        </div>
                       <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-4">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" 
                                    Text="Search" onclick="btnSubmit_Click" />
                                <asp:HiddenField ID="hfDisable" runat="server" />
                                <asp:HiddenField ID="hfNo" runat="server" />
                                <asp:HiddenField ID="hfDate" runat="server" />
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    DeleteCommand="DELETE FROM [Room] WHERE [RoomId] = @RoomId" 
                                    InsertCommand="INSERT INTO [Room] ([Date]) VALUES (@Date)" 
                                    SelectCommand="SELECT ActivationDate, TutionId FROM Tution WHERE (ActivationDate IS NOT NULL)" 
                                    
                                    
                                    UpdateCommand="UPDATE Tution SET Disable = @Disable WHERE (ActivationDate = @ActivationDate)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="RoomId" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter DbType="Date" Name="Date" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="hfDisable" Name="Disable" 
                                            PropertyName="Value" />
                                        <asp:ControlParameter ControlID="hfDate" Name="ActivationDate" 
                                            PropertyName="Value" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
         <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
    <asp:Panel ID="Panelall" runat="server">
            <asp:DataList ID="all" runat="server" DataSourceID="SqlSearchTution">
                <ItemTemplate>
                  <table style="font-size:large">
                <tr>
                <td align="center">
                    <asp:Image ID="UploadPhoto1Image" runat="server" ImageUrl='<%# Eval("Photo") %>' Height="135px" Width="130px" />
                    <br />
                    <a href='BookMyTution.aspx?TutionId=<%# Eval("TutionId") %>' style="color:White">View More</a>
                </td>
                <td align="left">
                <table>
                <tr><td><asp:Label ID="Label1" runat="server" Text="Owner Name:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="OwnerNameLabel" runat="server" Text='<%# Eval("OwnerName") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label3" runat="server" Text="Tution Name:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="NoOfPersonLabel" runat="server" 
                        Text='<%# Eval("TutionName") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label4" runat="server" Text="EmailId:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="RentPerHeadLabel" runat="server" 
                        Text='<%# Eval("EmailId") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label5" runat="server" Text="Contact No:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("ContactNo") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label6" runat="server" Text="Nearest Location:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="NearestLocationLabel" runat="server" Text='<%# Eval("NearestLocation") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label7" runat="server" Text="City:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("City") %>' />
                    </td></tr></table></td>
                </tr>
                </table>
                </ItemTemplate>
            
            </asp:DataList>
            <asp:SqlDataSource ID="SqlSearchTution" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                
                
                
                
                
                
                
                SelectCommand="SELECT Tution.OwnerName, Tution.TutionName, Tution.EmailId, Tution.ContactNo, Tution.Photo, Tution.NearestLocation, Tution.City, Tution.TutionId FROM Subject INNER JOIN Tution ON Subject.TutionId = Tution.TutionId WHERE (Tution.Disable = @Disable)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hfNo" Name="Disable" PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
            </asp:Panel>
    <asp:Panel ID="PanelSearch" runat="server" Visible="False">
            <asp:DataList ID="asc" runat="server" DataSourceID="SqlSearchFilter1">
               <ItemTemplate>
                  <table style="font-size:large">
                <tr>
                <td align="center">
                    <asp:Image ID="UploadPhoto1Image" runat="server" ImageUrl='<%# Eval("Photo") %>' Height="135px" Width="130px" />
                    <br />
                    <a href='BookMyTution.aspx?TutionId=<%# Eval("TutionId") %>' style="color:White">View More</a>
                </td>
                <td align="left">
                <table>
                <tr><td><asp:Label ID="Label1" runat="server" Text="Owner Name:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="OwnerNameLabel" runat="server" Text='<%# Eval("OwnerName") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label3" runat="server" Text="Tution Name:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="NoOfPersonLabel" runat="server" 
                        Text='<%# Eval("TutionName") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label4" runat="server" Text="EmailId:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="RentPerHeadLabel" runat="server" 
                        Text='<%# Eval("EmailId") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label5" runat="server" Text="Contact No:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("ContactNo") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label6" runat="server" Text="Nearest Location:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="NearestLocationLabel" runat="server" Text='<%# Eval("NearestLocation") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label7" runat="server" Text="City:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("City") %>' />
                    </td></tr></table></td>
                </tr>
                </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlSearchFilter1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                
                
                
                
                
                
                
                
                
                
                SelectCommand="SELECT Tution.OwnerName, Tution.TutionName, Tution.EmailId, Tution.ContactNo, Tution.NearestLocation, Tution.City, Tution.Photo, Tution.TutionId FROM Tution INNER JOIN Subject ON Tution.TutionId = Subject.TutionId WHERE (Tution.Disable = @Disable) AND (Tution.TutionName = @TutionName) OR (Tution.City = @City) OR (Tution.State = @State) OR (Tution.NearestLocation = @NearestLocation) OR (Subject.Course = @Course) OR (Subject.Subject = @Subject)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hfNo" Name="Disable" PropertyName="Value" />
                    <asp:SessionParameter Name="TutionName" SessionField="TutionName" />
                    <asp:SessionParameter Name="City" SessionField="City" />
                    <asp:SessionParameter Name="State" SessionField="State" />
                    <asp:SessionParameter Name="NearestLocation" SessionField="NearestLocation" />
                    <asp:SessionParameter Name="Course" SessionField="Course" />
                    <asp:SessionParameter Name="Subject" SessionField="Subject" />
                </SelectParameters>
            </asp:SqlDataSource>
            </asp:Panel>
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
    </script></asp:Content>
