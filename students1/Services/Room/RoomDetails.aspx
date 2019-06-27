<%@ Page Title="Room Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoomDetails.aspx.cs" Inherits="students1.Services.FinalUploadRoom" %>
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
</script></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDisplayDetails">
                            <ItemTemplate>
                            <table style="font-size: large"><tr><td>
                                <asp:Label runat="server" ID="lblName" Text="Name:" />&nbsp;&nbsp;</td>
                              <td>
                                   <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>'/>
                           </td></tr>
                             <tr><td>
                                <asp:Label runat="server" ID="lblContactNo1" Text="Contact No 1:" />&nbsp;&nbsp;
                              </td><td>
                                <asp:Label ID="ContactNo1Label" runat="server" 
                                    Text='<%# Eval("ContactNo1") %>' />
                              </td></tr>
                              <tr><td>
                                <asp:Label runat="server" ID="lblContactNo2" Text="Contact No 2:" />&nbsp;&nbsp;
                              </td><td>
                                <asp:Label ID="ContactNo2Label" runat="server" 
                                    Text='<%# Eval("ContactNo2") %>' />
                              </td></tr>
                            <tr><td>
                                <asp:Label runat="server" ID="lblRoomLocation" Text="Room Location:"/>&nbsp;&nbsp;
                           </td><td>
                                <asp:Label ID="RoomLocationLabel" runat="server" 
                                    Text='<%# Eval("RoomLocation") %>' />
                            </td></tr>
                            <tr><td>
                                <asp:Label runat="server" ID="lblNearestLocation" Text="Nearest Location:" />&nbsp;&nbsp;
                            </td><td>
                                <asp:Label ID="NearestLocationLabel" runat="server" 
                                    Text='<%# Eval("NearestLocation") %>' />
                             </td></tr>
                             <tr><td>
                                <asp:Label runat="server" ID="lblNoOfPerson" Text="For Person(s):" />&nbsp&nbsp;
                             </td><td>
                                <asp:Label ID="NoOfPersonLabel" runat="server" 
                                    Text='<%# Eval("NoOfPerson") %>' />
                           </td></tr>
                                <tr><td>
                                <asp:Label runat="server" ID="lblRentPerHead" Text="Rent Per Head:"  />&nbsp&nbsp;
                               </td><td>
                                <asp:Label ID="RentPerHeadLabel" runat="server" 
                                    Text='<%# Eval("RentPerHead") %>'  />
                                </td></tr>
                                <tr><td>
                                <asp:Label runat="server" ID="lblGender" Text="Gender:"  />&nbsp&nbsp;
                                </td><td>
                                <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>'  />
                              </td></tr></table>
                              <table style="font-size: large">
                              <caption>Facilities</caption>
                                <tr><td>
                                <asp:Label runat="server" ID="lblLightBill" Text="Light Bill:" />&nbsp&nbsp;
                               </td><td>
                                <asp:Label ID="LightBillLabel" runat="server" Text='<%# Eval("LightBill") %>' />
                                </td></tr>
                                <tr><td>
                                <asp:Label runat="server" ID="lblBathRoom" Text="Bath Room:" />&nbsp&nbsp;
                               </td><td>
                               <asp:Label ID="BathRoomLabel" runat="server" Text='<%# Eval("BathRoom") %>' />
                                </td></tr>
                                <tr><td>
                                <asp:Label runat="server" ID="lblHotWater" Text="Hot Water:"  />&nbsp&nbsp;
                                </td><td>
                                <asp:Label ID="HotWaterLabel" runat="server" Text='<%# Eval("HotWater") %>' />
                              </td></tr>
                                <tr><td>
                                <asp:Label runat="server" ID="lblCooking" Text="Cooking:" />&nbsp&nbsp;
                                </td><td>
                                <asp:Label ID="CookingLabel" runat="server" Text='<%# Eval("Cooking") %>' />
                              </td></tr>
                                <tr><td>
                                <asp:Label runat="server" ID="lblParking" Text="Parking:" />&nbsp&nbsp;
                             </td><td>
                                <asp:Label ID="ParkingLabel" runat="server" Text='<%# Eval("Parking") %>'  />
                                </td></tr>
                                <tr><td>
                                <asp:Label runat="server" ID="lblWifi" Text="Wifi:" />&nbsp&nbsp;
                               </td><td>
                                <asp:Label ID="WifiLabel" runat="server" Text='<%# Eval("Wifi") %>' />
                                </td></tr>
                                 <tr><td>
                                <asp:Label runat="server" ID="lblMoreAboutRoom" Text="More About Room:" />&nbsp&nbsp;
                                 </td><td>
                                <asp:Label ID="MoreAboutRoomLabel" runat="server" 
                                    Text='<%# Eval("MoreAboutRoom") %>' />
                               </td></tr></table>
                            </ItemTemplate>
                            
                        </asp:DataList>
                         <asp:SqlDataSource ID="SqlDisplayDetails" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            
                            
                            SelectCommand="SELECT RoomId, RoomLocation, NearestLocation, NoOfPerson, RentPerHead, Gender, LightBill, BathRoom, HotWater, Cooking, Parking, Wifi, MoreAboutRoom, Name, ContactNo2, ContactNo1 FROM Room WHERE (RoomId = @RoomId)" 
                            DeleteCommand="DELETE FROM [Room] WHERE [RoomId] = @RoomId" 
                            InsertCommand="INSERT INTO [Room] ([RoomLocation], [NearestLocation], [NoOfPerson], [RentPerHead], [Gender], [LightBill], [BathRoom], [HotWater], [Cooking], [Parking], [Wifi], [MoreAboutRoom]) VALUES (@RoomLocation, @NearestLocation, @NoOfPerson, @RentPerHead, @Gender, @LightBill, @BathRoom, @HotWater, @Cooking, @Parking, @Wifi, @MoreAboutRoom)" 
                            
                            UpdateCommand="UPDATE Room SET Date = @Date WHERE (RoomId = @RoomId)">
                             <DeleteParameters>
                                 <asp:QueryStringParameter Name="RoomId" QueryStringField="RoomId" 
                                     Type="Int32" />
                             </DeleteParameters>
                             <InsertParameters>
                                 <asp:Parameter Name="RoomLocation" Type="String" />
                                 <asp:Parameter Name="NearestLocation" Type="String" />
                                 <asp:Parameter Name="NoOfPerson" Type="Int32" />
                                 <asp:Parameter Name="RentPerHead" Type="Int32" />
                                 <asp:Parameter Name="Gender" Type="String" />
                                 <asp:Parameter Name="LightBill" Type="String" />
                                 <asp:Parameter Name="BathRoom" Type="String" />
                                 <asp:Parameter Name="HotWater" Type="String" />
                                 <asp:Parameter Name="Cooking" Type="String" />
                                 <asp:Parameter Name="Parking" Type="String" />
                                 <asp:Parameter Name="Wifi" Type="String" />
                                 <asp:Parameter Name="MoreAboutRoom" Type="String" />
                             </InsertParameters>
                             <SelectParameters>
                                 <asp:QueryStringParameter Name="RoomId" QueryStringField="RoomId" 
                                     Type="Int32" />
                             </SelectParameters>
                             <UpdateParameters>
                                 <asp:QueryStringParameter Name="RoomId" QueryStringField="RoomId" 
                                     Type="Int32" />
                                 <asp:ControlParameter ControlID="hfDate" Name="Date" PropertyName="Value" />
                             </UpdateParameters>
                        </asp:SqlDataSource>
                         <asp:SqlDataSource ID="SqlDeleteDetails" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            
                            
                            SelectCommand="SELECT [RoomId], [RoomLocation], [NearestLocation], [NoOfPerson], [RentPerHead], [Gender], [LightBill], [BathRoom], [HotWater], [Cooking], [Parking], [Wifi], [MoreAboutRoom] FROM [Room] WHERE ([RoomId] = @RoomId)" 
                            DeleteCommand="DELETE FROM [Room] WHERE [RoomId] = @RoomId" 
                            InsertCommand="INSERT INTO [Room] ([RoomLocation], [NearestLocation], [NoOfPerson], [RentPerHead], [Gender], [LightBill], [BathRoom], [HotWater], [Cooking], [Parking], [Wifi], [MoreAboutRoom]) VALUES (@RoomLocation, @NearestLocation, @NoOfPerson, @RentPerHead, @Gender, @LightBill, @BathRoom, @HotWater, @Cooking, @Parking, @Wifi, @MoreAboutRoom)" 
                            
                            UpdateCommand="UPDATE Room SET Disable = @Disable WHERE (RoomId = @RoomId)">
                             <DeleteParameters>
                                 <asp:QueryStringParameter Name="RoomId" QueryStringField="RoomId" 
                                     Type="Int32" />
                             </DeleteParameters>
                             <InsertParameters>
                                 <asp:Parameter Name="RoomLocation" Type="String" />
                                 <asp:Parameter Name="NearestLocation" Type="String" />
                                 <asp:Parameter Name="NoOfPerson" Type="Int32" />
                                 <asp:Parameter Name="RentPerHead" Type="Int32" />
                                 <asp:Parameter Name="Gender" Type="String" />
                                 <asp:Parameter Name="LightBill" Type="String" />
                                 <asp:Parameter Name="BathRoom" Type="String" />
                                 <asp:Parameter Name="HotWater" Type="String" />
                                 <asp:Parameter Name="Cooking" Type="String" />
                                 <asp:Parameter Name="Parking" Type="String" />
                                 <asp:Parameter Name="Wifi" Type="String" />
                                 <asp:Parameter Name="MoreAboutRoom" Type="String" />
                             </InsertParameters>
                             <SelectParameters>
                                 <asp:QueryStringParameter Name="RoomId" QueryStringField="RoomId" 
                                     Type="Int32" />
                             </SelectParameters>
                             <UpdateParameters>
                                 <asp:QueryStringParameter Name="RoomId" QueryStringField="RoomId" 
                                     Type="Int32" />
                                 <asp:ControlParameter ControlID="hfYes" Name="Disable" PropertyName="Value" />
                             </UpdateParameters>
                        </asp:SqlDataSource>
                         <asp:HiddenField ID="hfDate" runat="server" />
                         <asp:HiddenField ID="hfDisable" runat="server" />
                         <asp:HiddenField ID="hfYes" runat="server" />
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-4">
                                <asp:Button ID="btnUpload" runat="server" CssClass="btn btn-primary" 
                                    Text="Repost" onclick="btnUpload_Click" Visible="false" />
                                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-primary" 
                                    Text="Delete This Add" onclick="btnDelete_Click" />
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-warning" 
                                    Text="Back" onclick="Button1_Click" />
                            </div>
                        </div>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    DeleteCommand="DELETE FROM [Room] WHERE [RoomId] = @RoomId" 
                                    InsertCommand="INSERT INTO [Room] ([Date]) VALUES (@Date)" 
                                    SelectCommand="SELECT Date, RoomId FROM Room WHERE (RoomId = @RoomId) AND (Date IS NOT NULL)" 
                                    
                            
                            
                            UpdateCommand="UPDATE Room SET Disable = @Disable WHERE (RoomId = @RoomId)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="RoomId" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter DbType="Date" Name="Date" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="RoomId" QueryStringField="RoomId" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="hfYes" Name="Disable" 
                                            PropertyName="Value" />
                                        <asp:QueryStringParameter Name="RoomId" QueryStringField="RoomId" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>

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
   
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlUserDetails">
                <ItemTemplate>
                    <table style="font-size: large"><tr><td>
                                <asp:Label runat="server" ID="lblBookedBy" Text="Booked By:"  />&nbsp;&nbsp;
                               </td><td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                   </td></tr>
                   <tr><td>
                                <asp:Label runat="server" ID="lblContactNo" Text="ContactNo:" />&nbsp;&nbsp;
                     </td><td>
                    <asp:Label ID="ContactNoLabel" runat="server" Text='<%# Eval("ContactNo") %>' />
                 </td></tr>
                 <tr><td>
               <a href='ConfirmRoom.aspx?RoomId=<%# Eval("RoomId") %>&UserId=<%# Eval("ContactNo") %>'>Confirm</a>&nbsp;&nbsp; </td>                             
                                <td><a href='CancelRoom.aspx?RoomId=<%# Eval("RoomId") %>&UserId=<%# Eval("ContactNo") %>'>Cancel</a>                              
                 </td></tr></table>
                </ItemTemplate>
            </asp:DataList><asp:SqlDataSource ID="SqlUserDetails" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                
                
                
                SelectCommand="SELECT Booking.Name, Booking.RoomId, Booking.ContactNo FROM Booking INNER JOIN Room ON Booking.RoomId = Room.RoomId WHERE (Booking.RoomId = @RoomId) AND (Room.Confirm = @Confirm) AND (Booking.RoomStatus = @RoomStatus)" >
                <SelectParameters>
                    <asp:QueryStringParameter Name="RoomId" QueryStringField="RoomId" 
                        Type="Int32" />
                    <asp:ControlParameter ControlID="hfConfirm" Name="Confirm" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="hfHold" Name="RoomStatus" 
                        PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="hfConfirm" runat="server" />
            <asp:HiddenField ID="hfHold" runat="server" />
             <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlUser">
                <ItemTemplate>
                <table style="font-size: large"><tr><td>
                                <asp:Label runat="server" ID="lblBookedBy" Text="Booked By:" />&nbsp;&nbsp;
                         </td><td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
               </td></tr>
              <tr><td>
                                <asp:Label runat="server" ID="lblContactNo" Text="ContactNo:"/>&nbsp;&nbsp;
               </td><td>
                    <asp:Label ID="ContactNoLabel" runat="server" Text='<%# Eval("ContactNo") %>' />
               </td></tr>
                    <tr><td></td><td>
                                <a href='DeleteRoomUser.aspx?RoomId=<%# Eval("RoomId") %>&UserId=<%# Eval("ContactNo") %>'>Delete</a>
                    </td></tr></table>
                </ItemTemplate>
            </asp:DataList><asp:SqlDataSource ID="SqlUser" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                
                
                
                
                
                
                            SelectCommand="SELECT RoomId, Name, ContactNo FROM Booking WHERE (RoomId = @RoomId) AND (RoomStatus = @RoomStatus)" >
                <SelectParameters>
                    <asp:QueryStringParameter Name="RoomId" QueryStringField="RoomId" />
                    <asp:ControlParameter ControlID="hfRoomStatus" Name="RoomStatus" 
                        PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="hfRoomStatus" runat="server" />
       </fieldset> </div></div></div>
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
