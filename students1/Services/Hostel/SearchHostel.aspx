<%@ Page Title="Search Hostel" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchHostel.aspx.cs" Inherits="students1.Services.Hostel.SearchHostel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content><asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
                            <asp:Label ID="lblHostelFor" runat="server" Text="Hostel For" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblHostelFor" runat="server">
                                            <asp:ListItem Selected="True">Male</asp:ListItem>
                                            <asp:ListItem>Female</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="lblMessFacility" runat="server" Text="Mess Facility" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblMessFacility" runat="server">
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
                                    DeleteCommand="DELETE FROM [Hostel] WHERE [HostelId] = @HostelId" 
                                    InsertCommand="INSERT INTO [Hostel] ([Disable], [ActivationDate]) VALUES (@Disable, @ActivationDate)" 
                                    SelectCommand="SELECT HostelId, Scheme, ActivationDate FROM Hostel WHERE (ActivationDate IS NOT NULL)" 
                                    
                                    
                                    
                                    
                                    UpdateCommand="UPDATE [Hostel] SET [Disable] = @Disable  WHERE [ActivationDate] = @ActivationDate">
                                    <DeleteParameters>
                                        <asp:Parameter Name="HostelId" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Disable" Type="String" />
                                        <asp:Parameter DbType="Date" Name="ActivationDate" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="hfDisable" Name="Disable" PropertyName="Value" 
                                            Type="String" />
                                        <asp:ControlParameter ControlID="hfDate" DbType="Date" Name="ActivationDate" 
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
            <asp:DataList ID="all" runat="server" DataSourceID="SqlSearchHostel">
                <ItemTemplate>
                  <table style="font-size:large">
                <tr>
                <td align="center">
                    <asp:Image ID="UploadPhoto1Image" runat="server" ImageUrl='<%# Eval("UploadPhoto1") %>' Height="135px" Width="130px" />
                    <br />
                    <a href='BookMyHostel.aspx?HostelId=<%# Eval("HostelId") %>' style="color:White">View More</a>
                </td>
                <td align="left">
                <table><tr><td>
                <asp:Label ID="Label1" runat="server" Text="Nearest Location:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="NearestLocationLabel" runat="server" Text='<%# Eval("NearestLocation") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label2" runat="server" Text="Name:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="HostelNameLabel" runat="server" 
                        Text='<%# Eval("Name") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label3" runat="server" Text="Hostel For:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="HostelForLabel" runat="server" 
                        Text='<%# Eval("Gender") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label4" runat="server" Text="Rent Per Head:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="RentPerHeadLabel" runat="server" 
                        Text='<%# Eval("RentPerHead") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label5" runat="server" Text="Mess Facility:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="MessFacilityLabel" runat="server" Text='<%# Eval("MessFacility") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label6" runat="server" Text="City:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td></tr></table></td>
                </tr>
                </table>
                </ItemTemplate>
            
            </asp:DataList>
            <asp:SqlDataSource ID="SqlSearchHostel" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                
                
                
                
                
                
                
                
                SelectCommand="SELECT Hostel.Name, Hostel.NearestLocation, Hostel.HostelId, Hostel.Gender, Hostel.MessFacility, Hostel.UploadPhoto1, Hostel.City, MIN(HostelRoom.RentPerHead) AS Expr1 FROM Hostel INNER JOIN HostelRoom ON Hostel.HostelId = HostelRoom.HostelId WHERE (Hostel.Disable = @Disable)">
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
                    <a href='BookMyHostel.aspx?HostelId=<%# Eval("HostelId") %>' style="color:White">View More</a>
                </td>
                <td align="left">
                <table><tr><td>
                <asp:Label ID="Label1" runat="server" Text="Nearest Location:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="NearestLocationLabel" runat="server" Text='<%# Eval("NearestLocation") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label2" runat="server" Text="Name:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="HostelNameLabel" runat="server" 
                        Text='<%# Eval("Name") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label3" runat="server" Text="Hostel For:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="HostelForLabel" runat="server" 
                        Text='<%# Eval("Gender") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label4" runat="server" Text="Rent Per Head:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="RentPerHeadLabel" runat="server" 
                        Text='<%# Eval("RentPerHead") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label5" runat="server" Text="Mess Facility:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="MessFacilityLabel" runat="server" Text='<%# Eval("MessFacility") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label6" runat="server" Text="City:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td></tr></table></td>
                </tr>
                </table>
                </ItemTemplate></asp:DataList>
            <asp:SqlDataSource ID="SqlSearchFilter1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                
                
                
                
                
                
                
                
                
                
                SelectCommand="SELECT Hostel.Name, Hostel.NearestLocation, Hostel.HostelId, Hostel.Gender, Hostel.MessFacility, Hostel.UploadPhoto1, Hostel.City, MIN(HostelRoom.RentPerHead) AS Expr1 FROM Hostel INNER JOIN HostelRoom ON Hostel.HostelId = HostelRoom.HostelId WHERE (Hostel.Disable = @Disable) AND (Hostel.NearestLocation = @NearestLocation) OR (Hostel.State = @State) OR (Hostel.City = @City) OR (Hostel.Name = @Name) OR (Hostel.Gender = @Gender) OR (Hostel.MessFacility = @MessFacility)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hfDisable" Name="Disable" PropertyName="Value" 
                        Type="String" />
                    <asp:SessionParameter Name="NearestLocation" SessionField="NearestLocation" 
                        Type="String" />
                    <asp:SessionParameter Name="Gender" SessionField="HostelGender" />
                    <asp:SessionParameter Name="MessFacility" SessionField="Gender" />
                    <asp:SessionParameter Name="State" SessionField="State" />
                    <asp:SessionParameter Name="City" SessionField="City" />
                    <asp:SessionParameter Name="Name" SessionField="HostelName" />
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
                    <a href='BookMyHostel.aspx?HostelId=<%# Eval("HostelId") %>' style="color:White">View More</a>
                </td>
                <td align="left">
                <table><tr><td>
                <asp:Label ID="Label1" runat="server" Text="Nearest Location:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="NearestLocationLabel" runat="server" Text='<%# Eval("NearestLocation") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label2" runat="server" Text="Name:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="HostelNameLabel" runat="server" 
                        Text='<%# Eval("Name") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label3" runat="server" Text="Hostel For:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="HostelForLabel" runat="server" 
                        Text='<%# Eval("Gender") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label4" runat="server" Text="Rent Per Head:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="RentPerHeadLabel" runat="server" 
                        Text='<%# Eval("RentPerHead") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label5" runat="server" Text="Mess Facility:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="MessFacilityLabel" runat="server" Text='<%# Eval("MessFacility") %>' />
                    </td></tr>
                    <tr><td>
                    <asp:Label ID="Label6" runat="server" Text="City:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td></tr></table></td>
                </tr>
                </table>
                </ItemTemplate></asp:DataList>
            <asp:SqlDataSource ID="SqlSearchFilter2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                
                
                
                
                
                
                
                
                
                
                
                SelectCommand="SELECT Hostel.Name, Hostel.NearestLocation, Hostel.HostelId, Hostel.Gender, Hostel.MessFacility, Hostel.UploadPhoto1, Hostel.City, MIN(HostelRoom.RentPerHead) AS Expr1 FROM Hostel INNER JOIN HostelRoom ON Hostel.HostelId = HostelRoom.HostelId WHERE (Hostel.Disable = @Disable) AND (Hostel.NearestLocation = @NearestLocation) OR (Hostel.State = @State) OR (Hostel.City = @City) OR (Hostel.Name = @Name) OR (Hostel.Gender = @Gender) OR (Hostel.MessFacility = @MessFacility) ORDER BY HostelRoom.RentPerHead DESC" >
                <SelectParameters>
                    <asp:ControlParameter ControlID="hfDisable" Name="Disable" PropertyName="Value" 
                        Type="String" />
                    <asp:SessionParameter Name="NearestLocation" SessionField="NearestLocation" 
                        Type="String" />
                    <asp:SessionParameter Name="Gender" SessionField="HostelGender" />
                    <asp:SessionParameter Name="MessFacility" SessionField="MessFacility" />
                    <asp:SessionParameter Name="State" SessionField="State" />
                    <asp:SessionParameter Name="City" SessionField="City" />
                    <asp:SessionParameter Name="Name" SessionField="HostelName" />
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

