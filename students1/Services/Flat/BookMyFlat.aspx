﻿<%@ Page Title="Book My Flat" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookMyFlat.aspx.cs" Inherits="students1.Services.Flat.BookMyFlat" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
        .Star
        {
            background-image: url(../../images/Star.gif);
            height: 17px;
            width: 17px;
        }
        .WaitingStar
        {
            background-image: url(../../images/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }
        .FilledStar
        {
            background-image: url(../../images/FilledStar.gif);
            height: 17px;
            width: 17px;
        }
    </style>
<style type="text/css">
body
{
    margin: 0;
    padding: 0;
    height: 100%;
}
.modal
{
    
}
#divImage
{
    display: none;
    z-index: 1000;
    position: fixed;
    top: 0;
    left: 0;
    background-color: White;
    height: 550px;
    width: 600px;
    padding: 3px;
    border: solid 1px black;
}
</style>
<script type="text/javascript">
    function LoadDiv(url) {
        var img = new Image();
        var bcgDiv = document.getElementById("divBackground");
        var imgDiv = document.getElementById("divImage");
        var imgFull = document.getElementById("imgFull");
        var imgLoader = document.getElementById("imgLoader");
        imgLoader.style.display = "block";
        img.onload = function () {
            imgFull.src = img.src;
            imgFull.style.display = "block";
            imgLoader.style.display = "none";
        };
        img.src = url;
        var width = document.body.clientWidth;
        if (document.body.clientHeight > document.body.scrollHeight) {
            bcgDiv.style.height = document.body.clientHeight + "px";
        }
        else {
            bcgDiv.style.height = document.body.scrollHeight + "px";
        }
        imgDiv.style.left = (width - 650) / 2 + "px";
        imgDiv.style.top = "20px";
        bcgDiv.style.width = "100%";

        bcgDiv.style.display = "block";
        imgDiv.style.display = "block";
        return false;
    }
    function HideDiv() {
        var bcgDiv = document.getElementById("divBackground");
        var imgDiv = document.getElementById("divImage");
        var imgFull = document.getElementById("imgFull");
        if (bcgDiv != null) {
            bcgDiv.style.display = "none";
            imgDiv.style.display = "none";
            imgFull.style.display = "none";
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform"> <asp:HiddenField ID="hfHold" runat="server" />
                <asp:Label ID="lbl" runat="server" Text="" ForeColor="Orange"></asp:Label>
                <div class="form-horizontal">
                    <fieldset>
                        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDisplayDetails">
                            <ItemTemplate>
                              <table style="font-size: large"><tr><td>
                                <asp:Label runat="server" ID="lblOwnerName" Text="Owner Name:" />&nbsp;&nbsp;
                               </td><td>
                                <asp:Label ID="OwnerNameLabel" runat="server" 
                                    Text='<%# Eval("OwnerName") %>' />
                             </td></tr>
                            <tr><td>
                                <asp:Label runat="server" ID="lblContactNo1" Text="Contact No 1:"/>&nbsp;&nbsp;
                          </td><td>
                                <asp:Label ID="ContactNo1Label" runat="server" 
                                    Text='<%# Eval("ContactNo1") %>'/>
                             </td></tr>
                             <tr><td>
                                <asp:Label runat="server" ID="lblContactNo2" Text="Contact No 2:"  />&nbsp;&nbsp;
                              </td><td>
                                <asp:Label ID="ContactNo2Label" runat="server" 
                                    Text='<%# Eval("ContactNo2") %>' />
                         </td></tr>
                         <tr><td>
                                <asp:Label runat="server" ID="lblFlatLocation" Text="Flat Location:" />&nbsp;&nbsp;
                           </td><td>
                                <asp:Label ID="FlatLocationLabel" runat="server" 
                                    Text='<%# Eval("FlatLocation") %>' />
                          </td></tr>
                           <tr><td>
                                <asp:Label runat="server" ID="lblNearestLocation" Text="Nearest Location:" />&nbsp;&nbsp;
                           </td><td>
                                <asp:Label ID="NearestLocationLabel" runat="server" 
                                    Text='<%# Eval("NearestLocation") %>' />
                            </td></tr>
                            <tr><td>
                                <asp:Label runat="server" ID="lblGender" Text="Gender:"  />&nbsp;&nbsp;
                            </td><td>
                                <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>'/>
                             </td></tr>
                          <tr><td>
                                <asp:Label runat="server" ID="lblFlatType" Text="Flat Type:"/>&nbsp;&nbsp;
                           </td><td>
                                <asp:Label ID="FlatTypeLabel" runat="server" 
                                    Text='<%# Eval("FlatType") %>' />
                           </td></tr>
                             <tr><td>
                                <asp:Label runat="server" ID="lblBathRoom" Text="Bath Room:"/>&nbsp;&nbsp;
                           </td><td>
                                <asp:Label ID="BathRoomLabel" runat="server" Text='<%# Eval("BathRoom") %>' />
                             </td></tr>
                             <tr><td>
                                <asp:Label runat="server" ID="lblFloor" Text="Floor:" />&nbsp;&nbsp;
                              </td><td>
                                <asp:Label ID="NoOfPersonLabel" runat="server" 
                                    Text='<%# Eval("Floor") %>' />
                             </td></tr>
                              <tr><td>
                                <asp:Label runat="server" ID="lblRent" Text="Rent:" />&nbsp;&nbsp;
                               </td><td>
                                <asp:Label ID="RentLabel" runat="server" 
                                    Text='<%# Eval("Rent") %>'/>
                               </td></tr>
                                <tr><td>
                                <asp:Label runat="server" ID="lblSecurityDeposit" Text="Security Deposit:" />&nbsp;&nbsp;
                               </td><td>
                                <asp:Label ID="SecurityDepositLabel" runat="server" Text='<%# Eval("SecurityDeposit") %>' />
                              </td></tr>
                                <tr><td>
                                <asp:Label runat="server" ID="lblFlatArea" Text="Flat Area:" />&nbsp;&nbsp;
                             </td><td>
                                <asp:Label ID="FlatAreaLabel" runat="server" Text='<%# Eval("FlatArea") %>' />&nbsp;sq. ft.
                                </td></tr>
                              <tr><td>
                                <asp:Label runat="server" ID="lblLightBill" Text="Light Bill:" />&nbsp;&nbsp;
                              </td><td>
                                <asp:Label ID="LightBillLabel" runat="server" Text='<%# Eval("LightBill") %>' />
                              </td></tr>
                              <tr><td>
                                <asp:Label runat="server" ID="lblParking" Text="Parking:" />&nbsp;&nbsp;
                             </td><td>
                                <asp:Label ID="ParkingLabel" runat="server" Text='<%# Eval("Parking") %>' />
                              </td></tr>
                                <tr><td>
                                <asp:Label runat="server" ID="lblMoreAboutFlat" Text="More About Flat:" />&nbsp;&nbsp;
                                </td><td>
                                <asp:Label ID="MoreAboutRoomLabel" runat="server" 
                                    Text='<%# Eval("MoreAboutFlat") %>' />
                               </td></tr></table>
                            </ItemTemplate>
                            
                        </asp:DataList>
                         <asp:SqlDataSource ID="SqlDisplayDetails" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            
                            
                            
                            
                            
                            
                            
                            SelectCommand="SELECT OwnerName, ContactNo1, ContactNo2, FlatLocation, Gender, NearestLocation, FlatType, BathRoom, Floor, Rent, SecurityDeposit, FlatArea, LightBill, Parking, MoreAboutFlat FROM Flat WHERE (FlatId = @FlatId)">
                             <SelectParameters>
                                 <asp:QueryStringParameter Name="FlatId" QueryStringField="FlatId" 
                                     Type="Int32" />
                             </SelectParameters>
                        </asp:SqlDataSource>
                         <asp:SqlDataSource ID="SqlDisplayDetails1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            
                            
                            
                            
                            SelectCommand="SELECT Confirm FROM Flat WHERE (FlatId = @FlatId) AND (Status = @Status)">
                             <SelectParameters>
                                 <asp:ControlParameter ControlID="hfStatus" Name="Status" PropertyName="Value" />
                                 <asp:QueryStringParameter Name="FlatId" QueryStringField="FlatId" />
                             </SelectParameters>
                        </asp:SqlDataSource>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-4">
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
    <cc1:Rating ID="Rating1" AutoPostBack="true" OnChanged="OnRatingChanged" runat="server"
        StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
        FilledStarCssClass="FilledStar">
    </cc1:Rating>
    <br />
    <asp:Label ID="lblRatingStatus" runat="server" Text=""></asp:Label>
    
                                <asp:HiddenField ID="hfRating" runat="server" />
                         </div>
                         </div>
                         <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-4">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" 
                                    Text="Book My Flat" onclick="btnSubmit_Click" /><asp:Button ID="Button1" 
                                    runat="server" CssClass="btn btn-warning" 
                                    Text="Back" onclick="Button1_Click" />
                                <asp:SqlDataSource ID="SqlBookFlat" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    DeleteCommand="DELETE FROM [Room] WHERE [RoomId] = @RoomId" 
                                    InsertCommand="INSERT INTO [Room] ([RoomLocation], [NearestLocation], [NoOfPerson], [RentPerHead], [Gender], [UploadPhoto1], [UploadPhoto2], [UploadPhoto3], [LightBill], [BathRoom], [HotWater], [Cooking], [Parking], [Wifi], [MoreAboutRoom], [Name], [ContactNo1], [Status]) VALUES (@RoomLocation, @NearestLocation, @NoOfPerson, @RentPerHead, @Gender, @UploadPhoto1, @UploadPhoto2, @UploadPhoto3, @LightBill, @BathRoom, @HotWater, @Cooking, @Parking, @Wifi, @MoreAboutRoom, @Name, @ContactNo1, @Status)" 
                                    SelectCommand="SELECT * FROM [Room]" 
                                    UpdateCommand="UPDATE Flat SET Status = @Status WHERE (FlatId = @FlatId)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="RoomId" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="RoomLocation" Type="String" />
                                        <asp:Parameter Name="NearestLocation" Type="String" />
                                        <asp:Parameter Name="NoOfPerson" Type="Int32" />
                                        <asp:Parameter Name="RentPerHead" Type="Int32" />
                                        <asp:Parameter Name="Gender" Type="String" />
                                        <asp:Parameter Name="UploadPhoto1" Type="String" />
                                        <asp:Parameter Name="UploadPhoto2" Type="String" />
                                        <asp:Parameter Name="UploadPhoto3" Type="String" />
                                        <asp:Parameter Name="LightBill" Type="String" />
                                        <asp:Parameter Name="BathRoom" Type="String" />
                                        <asp:Parameter Name="HotWater" Type="String" />
                                        <asp:Parameter Name="Cooking" Type="String" />
                                        <asp:Parameter Name="Parking" Type="String" />
                                        <asp:Parameter Name="Wifi" Type="String" />
                                        <asp:Parameter Name="MoreAboutRoom" Type="String" />
                                        <asp:Parameter Name="Name" Type="String" />
                                        <asp:Parameter Name="ContactNo1" Type="String" />
                                        <asp:Parameter Name="Status" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="hfStatus" Name="Status" PropertyName="Value" />
                                        <asp:QueryStringParameter Name="FlatId" QueryStringField="FlatId" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlBook" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    DeleteCommand="DELETE FROM [Booking] WHERE [SrNo] = @SrNo" 
                                    InsertCommand="INSERT INTO Booking(FlatId, Name, ContactNo, FlatStatus) VALUES (@FlatId, @Name, @ContactNo, @FlatStatus)" 
                                    SelectCommand="SELECT * FROM [Booking]" 
                                    
                                    
                                    
                                    
                                    
                                    UpdateCommand="UPDATE [Booking] SET [RoomId] = @RoomId, [Name] = @Name, [ContactNo] = @ContactNo WHERE [SrNo] = @SrNo">
                                    <DeleteParameters>
                                        <asp:Parameter Name="SrNo" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:SessionParameter Name="Name" SessionField="Name" Type="String" />
                                        <asp:SessionParameter Name="ContactNo" SessionField="UserId" Type="String" />
                                        <asp:QueryStringParameter Name="FlatId" QueryStringField="FlatId" />
                                        <asp:ControlParameter ControlID="hfHold" Name="FlatStatus" 
                                            PropertyName="Value" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="RoomId" Type="Int32" />
                                        <asp:Parameter Name="Name" Type="String" />
                                        <asp:Parameter Name="ContactNo" Type="String" />
                                        <asp:Parameter Name="SrNo" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:HiddenField ID="hfStatus" runat="server" />
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
             <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDisplayFlat" > 
    <ItemTemplate>
      <table>
          <tr><td> <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("UploadPhoto1")%>'
                Width="100px" Height="100px" Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);" />
                </td></tr>
               <tr><td> <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl='<%# Eval("UploadPhoto2")%>'
                Width="100px" Height="100px" Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);" />
                </td></tr>
               <tr><td> <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl='<%# Eval("UploadPhoto3")%>'
                Width="100px" Height="100px" Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);" />
                </td></tr>
    </table>
        </ItemTemplate> 
    </asp:DataList> 
        
    <asp:SqlDataSource ID="SqlDisplayFlat" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
                 SelectCommand="SELECT UploadPhoto1, UploadPhoto2, UploadPhoto3 FROM Flat WHERE (FlatId = @FlatId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="FlatId" QueryStringField="FlatId" />
        </SelectParameters>
    </asp:SqlDataSource>
            <asp:HiddenField ID="hfCounter" runat="server" />
             <asp:SqlDataSource ID="SqlCounter" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                 DeleteCommand="DELETE FROM [Room] WHERE [RoomId] = @RoomId" 
                 InsertCommand="INSERT INTO [Room] ([Counter]) VALUES (@Counter)" 
                 SelectCommand="SELECT Counter, FlatId FROM Flat WHERE (FlatId = @FlatId)" 
                 
                 UpdateCommand="UPDATE Flat SET Counter = @Counter WHERE (FlatId = @FlatId)">
                 <DeleteParameters>
                     <asp:Parameter Name="RoomId" Type="Int32" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="Counter" Type="Int32" />
                 </InsertParameters>
                 <SelectParameters>
                     <asp:QueryStringParameter Name="FlatId" QueryStringField="FlatId" />
                 </SelectParameters>
                 <UpdateParameters>
                     <asp:ControlParameter ControlID="hfCounter" Name="Counter" PropertyName="Value" 
                         Type="Int32" />
                     <asp:QueryStringParameter Name="FlatId" QueryStringField="FlatId" />
                 </UpdateParameters>
             </asp:SqlDataSource>
   
        </div>
        
    </div>
    <div id="divBackground" style="display: none;position: absolute;top: 0px;left: 0px;background-color: black;z-index: 100;opacity: 0.8;filter: alpha(opacity=60);-moz-opacity: 0.8;min-height: 100%;">
</div>
<div id="divImage">
<table style="height: 100%; width: 100%">
    <tr>
        <td valign="middle" align="center">
            <img id="imgLoader" alt="" src="../../images/loader.gif" />
            <img id="imgFull" alt="" src="" style="display: none; height: 500px; width: 590px" />
        </td>
    </tr>
    <tr>
        <td align="center" valign="bottom">
            <input id="btnClose" type="button" value="close" onclick="HideDiv()" class="btn-primary" />
        </td>
    </tr>
</table>
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

