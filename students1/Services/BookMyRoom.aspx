<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookMyRoom.aspx.cs" Inherits="students1.Services.BookMyRoom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
body
{
    margin: 0;
    padding: 0;
    height: 100%;
}
.modal
{
    display: none;
    position: absolute;
    top: 0px;
    left: 0px;
    background-color: black;
    z-index: 100;
    opacity: 0.8;
    filter: alpha(opacity=60);
    -moz-opacity: 0.8;
    min-height: 100%;
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
<div class="col-lg-10 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform"> <asp:HiddenField ID="hfHold" runat="server" />
                <asp:Label ID="lbl" runat="server" Text="" ForeColor="Red"></asp:Label>
                <asp:SqlDataSource ID="SqlCheck" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    SelectCommand="SELECT UserId FROM Booking WHERE (RoomId = @RoomId) AND (UserId = @UserId)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="RoomId" QueryStringField="RoomId" 
                            Type="Int32" />
                        <asp:SessionParameter Name="UserId" SessionField="UserId" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div class="form-horizontal">
                    <fieldset>
                        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDisplayDetails">
                            <ItemTemplate>
                            <div class="form-group">
                                <asp:Label runat="server" ID="lblName" Text="Name:" CssClass="col-lg-2 control-label" />
                               <div class="col-lg-6">
                                <asp:Label ID="NameLabel" runat="server" 
                                    Text='<%# Eval("Name") %>' />
                                    </div>
                             </div>
                             <div class="form-group">
                                <asp:Label runat="server" ID="lblContactNo1" Text="Contact No 1:" CssClass="col-lg-2 control-label" />
                               <div class="col-lg-6">
                                <asp:Label ID="ContactNo1Label" runat="server" 
                                    Text='<%# Eval("ContactNo1") %>' />
                                    </div>
                             </div>
                            <div class="form-group">
                                <asp:Label runat="server" ID="lblRoomLocation" Text="Room Location:" CssClass="col-lg-2 control-label" />
                               <div class="col-lg-6">
                                <asp:Label ID="RoomLocationLabel" runat="server" 
                                    Text='<%# Eval("RoomLocation") %>' />
                                    </div>
                             </div>
                             <div class="form-group">
                                <asp:Label runat="server" ID="lblNearestLocation" Text="Nearest Location:" CssClass="col-lg-2 control-label" />
                                <div class="col-lg-6">
                                <asp:Label ID="NearestLocationLabel" runat="server" 
                                    Text='<%# Eval("NearestLocation") %>' />
                                    </div>
                               </div>
                               <div class="form-group">
                                <asp:Label runat="server" ID="lblNoOfPerson" Text="No Of Person:" CssClass="col-lg-2 control-label" />
                                <div class="col-lg-6">
                                <asp:Label ID="NoOfPersonLabel" runat="server" 
                                    Text='<%# Eval("NoOfPerson") %>' />
                               </div></div>
                                <div class="form-group">
                                <asp:Label runat="server" ID="lblRentPerHead" Text="Rent Per Head:" CssClass="col-lg-2 control-label" />
                                <div class="col-lg-6">
                                <asp:Label ID="RentPerHeadLabel" runat="server" 
                                    Text='<%# Eval("RentPerHead") %>' />
                                </div></div>
                                <div class="form-group">
                                <asp:Label runat="server" ID="lblGender" Text="Gender:" CssClass="col-lg-2 control-label" />
                                <div class="col-lg-6">
                                <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                               </div>
                               </div>
                                <div class="form-group">
                                <asp:Label runat="server" ID="lblLightBill" Text="Light Bill:" CssClass="col-lg-2 control-label" />
                                <div class="col-lg-6">
                                <asp:Label ID="LightBillLabel" runat="server" Text='<%# Eval("LightBill") %>' />
                                </div></div>
                                <div class="form-group">
                                <asp:Label runat="server" ID="lblBathRoom" Text="Bath Room:" CssClass="col-lg-2 control-label" />
                                <div class="col-lg-6">
                                <asp:Label ID="BathRoomLabel" runat="server" Text='<%# Eval("BathRoom") %>' />
                                </div></div>
                                <div class="form-group">
                                <asp:Label runat="server" ID="lblHotWater" Text="Hot Water:" CssClass="col-lg-2 control-label" />
                                <div class="col-lg-6">
                                <asp:Label ID="HotWaterLabel" runat="server" Text='<%# Eval("HotWater") %>' />
                                </div></div>
                                <div class="form-group">
                                <asp:Label runat="server" ID="lblCooking" Text="Cooking:" CssClass="col-lg-2 control-label" />
                                <div class="col-lg-6">
                                <asp:Label ID="CookingLabel" runat="server" Text='<%# Eval("Cooking") %>' />
                                </div></div>
                                <div class="form-group">
                                <asp:Label runat="server" ID="lblParking" Text="Parking:" CssClass="col-lg-2 control-label" />
                                <div class="col-lg-6">
                                <asp:Label ID="ParkingLabel" runat="server" Text='<%# Eval("Parking") %>' />
                                </div></div>
                                <div class="form-group">
                                <asp:Label runat="server" ID="lblWifi" Text="Wifi:" CssClass="col-lg-2 control-label" />
                                <div class="col-lg-6">
                                <asp:Label ID="WifiLabel" runat="server" Text='<%# Eval("Wifi") %>' />
                                </div></div>
                                <div class="form-group">
                                <asp:Label runat="server" ID="lblMoreAboutRoom" Text="More About Room:" CssClass="col-lg-2 control-label" />
                                <div class="col-lg-6">
                                <asp:Label ID="MoreAboutRoomLabel" runat="server" 
                                    Text='<%# Eval("MoreAboutRoom") %>' />
                               </div></div>
                            </ItemTemplate>
                        </asp:DataList>
                         <asp:SqlDataSource ID="SqlDisplayDetails" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            
                            
                            
                            SelectCommand="SELECT RoomLocation, NearestLocation, NoOfPerson, RentPerHead, Gender, LightBill, BathRoom, HotWater, Cooking, Parking, Wifi, MoreAboutRoom FROM Room WHERE (RoomId = @RoomId)">
                             <SelectParameters>
                                 <asp:QueryStringParameter Name="RoomId" QueryStringField="RoomId" 
                                     Type="Int32" />
                             </SelectParameters>
                        </asp:SqlDataSource>
                         <asp:SqlDataSource ID="SqlDisplayDetails1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            
                            
                            
                            SelectCommand="SELECT Confirm FROM Room WHERE (RoomId = @RoomId) AND (Status = @Status)">
                             <SelectParameters>
                                 <asp:QueryStringParameter Name="RoomId" QueryStringField="RoomId" 
                                     Type="Int32" />
                                 <asp:ControlParameter ControlID="hfStatus" Name="Status" PropertyName="Value" />
                             </SelectParameters>
                        </asp:SqlDataSource>
                         <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-4">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" 
                                    Text="Book My Room" onclick="btnSubmit_Click" />
                                <asp:SqlDataSource ID="SqlBookRoom" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    DeleteCommand="DELETE FROM [Room] WHERE [RoomId] = @RoomId" 
                                    InsertCommand="INSERT INTO [Room] ([RoomLocation], [NearestLocation], [NoOfPerson], [RentPerHead], [Gender], [UploadPhoto1], [UploadPhoto2], [UploadPhoto3], [LightBill], [BathRoom], [HotWater], [Cooking], [Parking], [Wifi], [MoreAboutRoom], [Name], [ContactNo1], [Status]) VALUES (@RoomLocation, @NearestLocation, @NoOfPerson, @RentPerHead, @Gender, @UploadPhoto1, @UploadPhoto2, @UploadPhoto3, @LightBill, @BathRoom, @HotWater, @Cooking, @Parking, @Wifi, @MoreAboutRoom, @Name, @ContactNo1, @Status)" 
                                    SelectCommand="SELECT * FROM [Room]" 
                                    UpdateCommand="UPDATE [Room] SET [Status] = @Status WHERE [RoomId] = @RoomId">
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
                                        <asp:QueryStringParameter Name="RoomId" QueryStringField="RoomId" 
                                            Type="Int32" />
                                        <asp:ControlParameter ControlID="hfStatus" Name="Status" PropertyName="Value" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlBook" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    DeleteCommand="DELETE FROM [Booking] WHERE [SrNo] = @SrNo" 
                                    InsertCommand="INSERT INTO Booking(RoomId, Name, ContactNo, RoomStatus, UserId) VALUES (@RoomId, @Name, @ContactNo, @RoomStatus, @UserId)" 
                                    SelectCommand="SELECT * FROM [Booking]" 
                                    
                                    
                                    
                                    UpdateCommand="UPDATE [Booking] SET [RoomId] = @RoomId, [Name] = @Name, [ContactNo] = @ContactNo WHERE [SrNo] = @SrNo">
                                    <DeleteParameters>
                                        <asp:Parameter Name="SrNo" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:QueryStringParameter Name="RoomId" QueryStringField="RoomId" 
                                            Type="Int32" />
                                        <asp:SessionParameter Name="Name" SessionField="Name" Type="String" />
                                        <asp:SessionParameter Name="ContactNo" SessionField="ContactNo" Type="String" />
                                        <asp:ControlParameter ControlID="hfHold" Name="RoomStatus" 
                                            PropertyName="Value" />
                                        <asp:SessionParameter Name="UserId" SessionField="UserId" />
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
             <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDisplayRoom" > 
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
        
    <asp:SqlDataSource ID="SqlDisplayRoom" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [UploadPhoto1], [UploadPhoto2], [UploadPhoto3] FROM [Room] WHERE ([RoomId] = @RoomId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="RoomId" QueryStringField="RoomId" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
            <asp:HiddenField ID="hfCounter" runat="server" />
             <asp:SqlDataSource ID="SqlCounter" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                 DeleteCommand="DELETE FROM [Room] WHERE [RoomId] = @RoomId" 
                 InsertCommand="INSERT INTO [Room] ([Counter]) VALUES (@Counter)" 
                 SelectCommand="SELECT [Counter], [RoomId] FROM [Room] WHERE ([RoomId] = @RoomId)" 
                 UpdateCommand="UPDATE [Room] SET [Counter] = @Counter WHERE [RoomId] = @RoomId">
                 <DeleteParameters>
                     <asp:Parameter Name="RoomId" Type="Int32" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="Counter" Type="Int32" />
                 </InsertParameters>
                 <SelectParameters>
                     <asp:QueryStringParameter Name="RoomId" QueryStringField="RoomId" 
                         Type="Int32" />
                 </SelectParameters>
                 <UpdateParameters>
                     <asp:ControlParameter ControlID="hfCounter" Name="Counter" PropertyName="Value" 
                         Type="Int32" />
                     <asp:QueryStringParameter Name="RoomId" QueryStringField="RoomId" 
                         Type="Int32" />
                 </UpdateParameters>
             </asp:SqlDataSource>
   
        </div>
        
    </div>
    <div id="divBackground" class="modal">
</div>
<div id="divImage">
<table style="height: 100%; width: 100%">
    <tr>
        <td valign="middle" align="center">
            <img id="imgFull" alt="" src="" style="display: none; height: 500px; width: 590px" />
        </td>
    </tr>
    <tr>
        <td align="center" valign="bottom">
            <input id="btnClose" type="button" value="close" onclick="HideDiv()" />
        </td>
    </tr>
</table>
</div>

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
