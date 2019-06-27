<%@ Page Title="Search Mess" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchMess.aspx.cs" Inherits="students1.Services.Mess.SearchRoom" %>
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
                            <asp:Label ID="lblName" runat="server" Text="Name" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtName" runat="server" placeholder="Name" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="lblMessType" runat="server" Text="Mess Type" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblMessType" runat="server">
                                            <asp:ListItem Selected="True">Veg</asp:ListItem>
                                            <asp:ListItem>Both(Including&nbsp;Non&nbsp;Veg)</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="lblTiffinFacility" runat="server" Text="TiffinFacility" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblTiffinFacility" runat="server">
                                            <asp:ListItem Selected="True">Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="lblPrice" runat="server" Text="Price" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblPrice" runat="server">
                                            <asp:ListItem Selected="True" Value="1">Low&nbsp;to&nbsp;High</asp:ListItem>
                                            <asp:ListItem Value="2">High&nbsp;to&nbsp;Low</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
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
                                    SelectCommand="SELECT ActivationDate, Scheme, MessId FROM Mess WHERE (ActivationDate IS NOT NULL)" 
                                    
                                    
                                    UpdateCommand="UPDATE Mess SET Disable = @Disable WHERE (ActivationDate = @ActivationDate)">
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
            <asp:DataList ID="all" runat="server" DataSourceID="SqlSearchMess">
                <ItemTemplate>
                  <table style="font-size:large">
                <tr>
                <td align="center">
                    <asp:Image ID="UploadPhoto1Image" runat="server" ImageUrl='<%# Eval("UploadPhoto1") %>' Height="135px" Width="130px" />
                    <br />
                    <a href='BookMyMess.aspx?MessId=<%# Eval("MessId") %>' style="color:White">View More</a>
                </td>
                <td align="left">
                <table><tr><td>
                <asp:Label ID="Label1" runat="server" Text="Nearest Location:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="NearestLocationLabel" runat="server" Text='<%# Eval("NearestLocation") %>' />
                    </td></tr>
                    <tr><td>
                 <asp:Label ID="Label3" runat="server" Text="Mess Type:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="MessTypeLabel" runat="server" 
                        Text='<%# Eval("MessType") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label4" runat="server" Text="Monthly Price:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="MonthlyPriceLabel" runat="server" 
                        Text='<%# Eval("MonthlyPrice") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label5" runat="server" Text="Tiffin Facility:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="TiffinFacilityLabel" runat="server" Text='<%# Eval("TiffinFacility") %>' />
                    </td></tr>
                    <tr><td>
                   <asp:Label ID="Label6" runat="server" Text="City:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("City") %>' />
                    </td></tr></table></td>
                </tr>
                </table>
                </ItemTemplate>
            
            </asp:DataList>
            <asp:SqlDataSource ID="SqlSearchMess" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                
                
                
                
                
                
                SelectCommand="SELECT MessType, NearestLocation, MonthlyPrice, TiffinFacility, UploadPhoto1, City FROM Mess WHERE (Disable = @Disable)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hfNo" Name="Disable" PropertyName="Value" 
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            </asp:Panel>
    <asp:Panel ID="Panelasc" runat="server" Visible="False">
            <asp:DataList ID="asc" runat="server" DataSourceID="SqlSearchFilter1">
                <ItemTemplate>
                  <table style="font-size:large">
                <tr>
                <td align="center">
                    <asp:Image ID="UploadPhoto1Image" runat="server" ImageUrl='<%# Eval("UploadPhoto1") %>' Height="135px" Width="130px" />
                    <br />
                    <a href='BookMyMess.aspx?MessId=<%# Eval("MessId") %>' style="color:White">View More</a>
                </td>
                <td align="left">
                <table><tr><td>
                <asp:Label ID="Label1" runat="server" Text="Nearest Location:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="NearestLocationLabel" runat="server" Text='<%# Eval("NearestLocation") %>' />
                    </td></tr>
                    <tr><td>
                 <asp:Label ID="Label3" runat="server" Text="Mess Type:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="MessTypeLabel" runat="server" 
                        Text='<%# Eval("MessType") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label4" runat="server" Text="Monthly Price:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="MonthlyPriceLabel" runat="server" 
                        Text='<%# Eval("MonthlyPrice") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label5" runat="server" Text="Tiffin Facility:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="TiffinFacilityLabel" runat="server" Text='<%# Eval("TiffinFacility") %>' />
                    </td></tr>
                    <tr><td>
                   <asp:Label ID="Label6" runat="server" Text="City:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("City") %>' />
                    </td></tr></table></td>
                </tr>
                </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlSearchFilter1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                
                
                
                
                
                
                
                
                SelectCommand="SELECT MessId, MessType, NearestLocation, MonthlyPrice, TiffinFacility, City FROM Mess WHERE (Disable = @Disable) AND (NearestLocation = @NearestLocation) OR (State = @State) OR (City = @City) OR (Name = @Name) OR (MessType = @MessType) OR (TiffinFacility = @TiffinFacility)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hfDisable" Name="Disable" PropertyName="Value" 
                        Type="String" />
                    <asp:SessionParameter Name="NearestLocation" SessionField="NearestLocation" 
                        Type="String" />
                    <asp:SessionParameter Name="MessType" SessionField="MessType" 
                        Type="String" />
                    <asp:SessionParameter Name="TiffinFacility" SessionField="TiffinFacility" 
                        Type="String" />
                    <asp:SessionParameter Name="State" SessionField="State" />
                    <asp:SessionParameter Name="City" SessionField="City" />
                    <asp:SessionParameter Name="Name" SessionField="MessName" />
                </SelectParameters>
            </asp:SqlDataSource>
            </asp:Panel>
    <asp:Panel ID="Paneldesc" runat="server" Visible="False">
            <asp:DataList ID="desc" runat="server" DataSourceID="SqlSearchFilter2">
                  <ItemTemplate>
                  <table style="font-size:large">
                <tr>
                <td align="center">
                    <asp:Image ID="UploadPhoto1Image" runat="server" ImageUrl='<%# Eval("UploadPhoto1") %>' Height="135px" Width="130px" />
                    <br />
                    <a href='BookMyMess.aspx?MessId=<%# Eval("MessId") %>' style="color:White">View More</a>
                </td>
                <td align="left">
                <table><tr><td>
                <asp:Label ID="Label1" runat="server" Text="Nearest Location:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="NearestLocationLabel" runat="server" Text='<%# Eval("NearestLocation") %>' />
                    </td></tr>
                    <tr><td>
                 <asp:Label ID="Label3" runat="server" Text="Mess Type:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="MessTypeLabel" runat="server" 
                        Text='<%# Eval("MessType") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label4" runat="server" Text="Monthly Price:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="MonthlyPriceLabel" runat="server" 
                        Text='<%# Eval("MonthlyPrice") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label5" runat="server" Text="Tiffin Facility:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="TiffinFacilityLabel" runat="server" Text='<%# Eval("TiffinFacility") %>' />
                    </td></tr>
                    <tr><td>
                   <asp:Label ID="Label6" runat="server" Text="City:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("City") %>' />
                    </td></tr></table></td>
                </tr>
                </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlSearchFilter2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                
                
                
                
                
                
                
                
                SelectCommand="SELECT MessId, MessType, NearestLocation, MonthlyPrice, TiffinFacility, City FROM Mess WHERE (Disable = @Disable) AND (NearestLocation = @NearestLocation) OR (State = @State) OR (City = @City) OR (Name = @Name) OR (MessType = @MessType) OR (TiffinFacility = @TiffinFacility) ORDER BY MonthlyPrice DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hfDisable" Name="Disable" PropertyName="Value" 
                        Type="String" />
                    <asp:SessionParameter Name="NearestLocation" SessionField="NearestLocation" 
                        Type="String" />
                    <asp:SessionParameter Name="MessType" SessionField="MessType" 
                        Type="String" />
                    <asp:SessionParameter Name="TiffinFacility" SessionField="TiffinFacility" 
                        Type="String" />
                    <asp:SessionParameter Name="State" SessionField="State" />
                    <asp:SessionParameter Name="City" SessionField="City" />
                    <asp:SessionParameter Name="Name" SessionField="MessName" />
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
    </script>
</asp:Content>
