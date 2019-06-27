<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchRoom.aspx.cs" Inherits="students1.Services.SearchRoom" %>
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
                          <asp:Label ID="lblNearestLocation" runat="server" Text="Nearest Location" CssClass="col-lg-4 control-label"></asp:Label>                          
                            <div class="col-lg-8">
                                <asp:DropDownList ID="ddlNearestLocation" runat="server" 
                                    CssClass="form-control ddl" DataSourceID="SqlNearestLocation">
                                </asp:DropDownList>                              
                                <asp:SqlDataSource ID="SqlNearestLocation" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    SelectCommand="SELECT * FROM [Room]"></asp:SqlDataSource>
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
                                    SelectCommand="SELECT [Date], [RoomId] FROM [Room]" 
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
                  <table>
                <tr>
                <td>
                    <asp:Image ID="UploadPhoto1Image" runat="server" ImageUrl='<%# Eval("UploadPhoto1") %>' />
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='~/Services/BookMyRoom.aspx?RoomId="<%# Eval("RoomId") %>"'>View More</asp:HyperLink>
                </td>
                <td>
                NearestLocation:
                    <asp:Label ID="NearestLocationLabel" runat="server" Text='<%# Eval("NearestLocation") %>' />
                    <br />
                    NoOfPerson:
                    <asp:Label ID="NoOfPersonLabel" runat="server" 
                        Text='<%# Eval("NoOfPerson") %>' />
                    <br />
                    RentPerHead:
                    <asp:Label ID="RentPerHeadLabel" runat="server" 
                        Text='<%# Eval("RentPerHead") %>' />
                    <br />
                    For:
                    <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                    <br /></td>
                </tr>
                </table>
                </ItemTemplate>
            
            </asp:DataList>
            <asp:SqlDataSource ID="SqlSearchRoom" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                
                
                
                
                SelectCommand="SELECT UploadPhoto1, NearestLocation, Gender, NoOfPerson, RentPerHead, RoomId FROM Room WHERE (Confirm = @Confirm) AND (Disable = @Disable)">
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
      <table>
                <tr>
                <td>
                    <asp:Image ID="UploadPhoto1Image" runat="server" ImageUrl='<%# Eval("UploadPhoto1") %>' />
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='~/Services/BookMyRoom.aspx?RoomId="<%# Eval("RoomId") %>"'>View More</asp:HyperLink>
                </td>
                <td>
                NearestLocation:
                    <asp:Label ID="NearestLocationLabel" runat="server" Text='<%# Eval("NearestLocation") %>' />
                    <br />
                    NoOfPerson:
                    <asp:Label ID="NoOfPersonLabel" runat="server" 
                        Text='<%# Eval("NoOfPerson") %>' />
                    <br />
                    RentPerHead:
                    <asp:Label ID="RentPerHeadLabel" runat="server" 
                        Text='<%# Eval("RentPerHead") %>' />
                    <br />
                    For:
                    <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                    <br /></td>
                </tr>
                </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlSearchFilter1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                
                
                
                
                
                
                SelectCommand="SELECT [NearestLocation], [RentPerHead], [Gender], [UploadPhoto1], [NoOfPerson], [RoomId] FROM [Room] WHERE (([Confirm] = @Confirm) AND ([Disable] = @Disable) AND ([Gender] = @Gender) OR ([NoOfPerson] &gt;= @NoOfPerson) OR ([NearestLocation] = @NearestLocation))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hfConfirm" Name="Confirm" PropertyName="Value" 
                        Type="String" />
                    <asp:ControlParameter ControlID="hfNo" Name="Disable" PropertyName="Value" 
                        Type="String" />
                    <asp:SessionParameter Name="Gender" SessionField="Gender" Type="String" />
                    <asp:SessionParameter Name="NoOfPerson" SessionField="NoOfPerson" 
                        Type="Int32" />
                    <asp:SessionParameter Name="NearestLocation" SessionField="NearestLocation" 
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            </asp:Panel>
    <asp:Panel ID="Paneldesc" runat="server" Visible="False">
            <asp:DataList ID="desc" runat="server" DataSourceID="SqlSearchFilter2">
                <ItemTemplate>
                <table>
                <tr>
                <td>
                    <asp:Image ID="UploadPhoto1Image" runat="server" ImageUrl='<%# Eval("UploadPhoto1") %>' />
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='~/Services/BookMyRoom.aspx?RoomId="<%# Eval("RoomId") %>"'>View More</asp:HyperLink>
                </td>
                <td>
                NearestLocation:
                    <asp:Label ID="NearestLocationLabel" runat="server" Text='<%# Eval("NearestLocation") %>' />
                    <br />
                    NoOfPerson:
                    <asp:Label ID="NoOfPersonLabel" runat="server" 
                        Text='<%# Eval("NoOfPerson") %>' />
                    <br />
                    RentPerHead:
                    <asp:Label ID="RentPerHeadLabel" runat="server" 
                        Text='<%# Eval("RentPerHead") %>' />
                    <br />
                    For:
                    <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                    <br /></td>
                </tr>
                </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlSearchFilter2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                
                
                
                
                
                
                SelectCommand="SELECT NearestLocation, NoOfPerson, RentPerHead, Gender, UploadPhoto1, RoomId FROM Room WHERE (Confirm = @Confirm) AND (Disable = @Disable) AND (Gender = @Gender) OR (NoOfPerson &gt;= @NoOfPerson) OR (NearestLocation = @NearestLocation) ORDER BY RentPerHead DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="Gender" SessionField="Gender" Type="String" />
                    <asp:SessionParameter Name="NoOfPerson" SessionField="NoOfPerson" 
                        Type="Int32" />
                    <asp:SessionParameter Name="NearestLocation" SessionField="NearestLocation" />
                    <asp:ControlParameter ControlID="hfConfirm" Name="Confirm" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="hfNo" Name="Disable" PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
            </asp:Panel>
        </div></div>
 <script src="../Scripts/main/jquery.js" type="text/javascript"></script>
    <script src="../Scripts/main/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Scripts/main/jquery.backstretch.js" type="text/javascript"></script>
    <script type="text/javascript">
        'use strict';

        /* ========================== */
        /* ::::::: Backstrech ::::::: */
        /* ========================== */
        // You may also attach Backstretch to a block-level element
        $.backstretch(
        [
            "../images/background/34.jpg",
            "../images/background/colorful.jpg",
            "../images/background/34.jpg",
            "../images/background/images.jpg"
        ],

        {
            duration: 4500,
            fade: 1500
        }
    );
    </script>

</asp:Content>

