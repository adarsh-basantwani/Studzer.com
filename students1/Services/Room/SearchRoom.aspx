<%@ Page Title="Search Room" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchRoom.aspx.cs" Inherits="students1.Services.SearchRoom" %>
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
                            <asp:Label ID="lblNoOfPerson" runat="server" Text="Number of Person" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtNoOfPerson" runat="server" placeholder="Number of Person" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="lblGender" runat="server" Text="Gender" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblGender" runat="server">
                                            <asp:ListItem Selected="True">Male</asp:ListItem>
                                            <asp:ListItem>Female</asp:ListItem>
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
                                <asp:HiddenField ID="hfConfirm" runat="server" />
                                <asp:HiddenField ID="hfDisable" runat="server" />
                                <asp:HiddenField ID="hfNo" runat="server" />
                                <asp:HiddenField ID="hfDate" runat="server" />
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    DeleteCommand="DELETE FROM [Room] WHERE [RoomId] = @RoomId" 
                                    InsertCommand="INSERT INTO [Room] ([Date]) VALUES (@Date)" 
                                    SelectCommand="SELECT Date, RoomId FROM Room WHERE (Date IS NOT NULL)" 
                                    UpdateCommand="UPDATE Room SET Disable = @Disable WHERE (Date = @Date)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="RoomId" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter DbType="Date" Name="Date" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="hfDate" DbType="Date" Name="Date" 
                                            PropertyName="Value" />
                                        <asp:ControlParameter ControlID="hfDisable" Name="Disable" 
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
            <asp:DataList ID="all" runat="server" DataSourceID="SqlSearchRoom">
                <ItemTemplate>
                  <table style="font-size:large">
                <tr>
                <td align="center">
                    <asp:Image ID="UploadPhoto1Image" runat="server" ImageUrl='<%# Eval("UploadPhoto1") %>' Height="135px" Width="130px" />
                    <br />
                    <a href='BookMyRoom.aspx?RoomId=<%# Eval("RoomId") %>' style="color: #FFFFFF">View More</a>
                </td>
                <td align="left">
                <table><tr><td>
                <asp:Label ID="Label1" runat="server" Text="NearestLocation:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="NearestLocationLabel" runat="server" Text='<%# Eval("NearestLocation") %>' />
                    </td></tr>
                    <tr><td><asp:Label ID="Label2" runat="server" Text="For Person(s):"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="NoOfPersonLabel" runat="server" 
                        Text='<%# Eval("NoOfPerson") %>' /></td></tr>
                    <tr><td>
                    <asp:Label ID="Label3" runat="server" Text="Rent Per Head:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="RentPerHeadLabel" runat="server" 
                        Text='<%# Eval("RentPerHead") %>' /></td></tr>
                    <tr><td>
                    <asp:Label ID="Label4" runat="server" Text="For:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                    </td></tr>
                    <tr><td>
                  <asp:Label ID="Label5" runat="server" Text="City:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td></tr></table></td>
                </tr>
                </table>
                </ItemTemplate>
            
            </asp:DataList>
            <asp:SqlDataSource ID="SqlSearchRoom" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                
                
                
                
                
                SelectCommand="SELECT UploadPhoto1, NearestLocation, Gender, NoOfPerson, RentPerHead, RoomId, City FROM Room WHERE (Confirm = @Confirm) AND (Disable = @Disable)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hfConfirm" Name="Confirm" PropertyName="Value" 
                        Type="String" />
                    <asp:ControlParameter ControlID="hfNo" Name="Disable" PropertyName="Value" />
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
                    <a href='BookMyRoom.aspx?RoomId=<%# Eval("RoomId") %>' style="color: #FFFFFF">View More</a>
                </td>
                <td align="left">
                <table><tr><td>
                <asp:Label ID="Label1" runat="server" Text="NearestLocation:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="NearestLocationLabel" runat="server" Text='<%# Eval("NearestLocation") %>' />
                    </td></tr>
                    <tr><td><asp:Label ID="Label2" runat="server" Text="For Person(s):"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="NoOfPersonLabel" runat="server" 
                        Text='<%# Eval("NoOfPerson") %>' /></td></tr>
                    <tr><td>
                    <asp:Label ID="Label3" runat="server" Text="Rent Per Head:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="RentPerHeadLabel" runat="server" 
                        Text='<%# Eval("RentPerHead") %>' /></td></tr>
                    <tr><td>
                    <asp:Label ID="Label4" runat="server" Text="For:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                    </td></tr>
                    <tr><td>
                  <asp:Label ID="Label5" runat="server" Text="City:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td></tr></table></td>
                </tr>
                </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlSearchFilter1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                
                
                
                
                
                
                
                
                
                SelectCommand="SELECT NearestLocation, RentPerHead, Gender, UploadPhoto1, NoOfPerson, RoomId, City FROM Room WHERE (Confirm = @Confirm) AND (Disable = @Disable) AND ((Gender = @Gender) OR (NoOfPerson &gt;= @NoOfPerson) OR (NearestLocation = @NearestLocation) OR (State = @State) OR (City = @City) OR (Name = @Name))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hfConfirm" Name="Confirm" PropertyName="Value" 
                        Type="String" />
                    <asp:ControlParameter ControlID="hfNo" Name="Disable" PropertyName="Value" 
                        Type="String" />
                    <asp:SessionParameter Name="Gender" SessionField="RoomGender" Type="String" />
                    <asp:SessionParameter Name="NoOfPerson" SessionField="NoOfPerson" 
                        Type="Int32" />
                    <asp:SessionParameter Name="NearestLocation" SessionField="NearestLocation" 
                        Type="String" />
                    <asp:SessionParameter Name="Name" SessionField="RoomName" />
                    <asp:SessionParameter Name="State" SessionField="State" />
                    <asp:SessionParameter Name="City" SessionField="City" />
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
                    <a href='BookMyRoom.aspx?RoomId=<%# Eval("RoomId") %>' style="color: #FFFFFF">View More</a>
                </td>
                <td align="left">
                <table><tr><td>
                <asp:Label ID="Label1" runat="server" Text="NearestLocation:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="NearestLocationLabel" runat="server" Text='<%# Eval("NearestLocation") %>' />
                    </td></tr>
                    <tr><td><asp:Label ID="Label2" runat="server" Text="For Person(s):"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="NoOfPersonLabel" runat="server" 
                        Text='<%# Eval("NoOfPerson") %>' /></td></tr>
                    <tr><td>
                    <asp:Label ID="Label3" runat="server" Text="Rent Per Head:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="RentPerHeadLabel" runat="server" 
                        Text='<%# Eval("RentPerHead") %>' /></td></tr>
                    <tr><td>
                    <asp:Label ID="Label4" runat="server" Text="For:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                    </td></tr>
                    <tr><td>
                  <asp:Label ID="Label5" runat="server" Text="City:"></asp:Label>&nbsp;&nbsp;</td><td>
                    <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td></tr></table></td>
                </tr>
                </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlSearchFilter2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                
                
                
                
                
                
                
                
                SelectCommand="SELECT NearestLocation, NoOfPerson, RentPerHead, Gender, UploadPhoto1, RoomId, City FROM Room WHERE (Confirm = @Confirm) AND (Disable = @Disable) AND (Gender = @Gender) OR (NoOfPerson &gt;= @NoOfPerson) OR (NearestLocation = @NearestLocation) OR (State = @State) OR (City = @City) OR (Name = @Name) ORDER BY RentPerHead DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="Gender" SessionField="RoomGender" Type="String" />
                    <asp:SessionParameter Name="NoOfPerson" SessionField="NoOfPerson" 
                        Type="Int32" />
                    <asp:SessionParameter Name="NearestLocation" SessionField="NearestLocation" />
                    <asp:ControlParameter ControlID="hfConfirm" Name="Confirm" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="hfNo" Name="Disable" PropertyName="Value" />
                    <asp:SessionParameter Name="Name" SessionField="RoomName" />
                    <asp:SessionParameter Name="State" SessionField="State" />
                    <asp:SessionParameter Name="City" SessionField="City" />
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

