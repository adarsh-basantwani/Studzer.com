<%@ Page Title="Hostel Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HostelDetails.aspx.cs" Inherits="students1.Services.Hostel.HostelDetails" %>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
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
                              <asp:Label runat="server" ID="lblName" Text="Name:" />&nbsp;&nbsp;
                             </td><td>
                                <asp:Label ID="NameLabel" runat="server" 
                                    Text='<%# Eval("Name") %>' />
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
                                <asp:Label runat="server" ID="lblHostelLocation" Text="Hostel Location:" />&nbsp;&nbsp;
                           </td><td>
                                <asp:Label ID="HostelLocationLabel" runat="server" 
                                    Text='<%# Eval("HostelLocation") %>' />
                           </td></tr>
                            <tr><td>
                                <asp:Label runat="server" ID="lblNearestLocation" Text="Nearest Location:"/>&nbsp;&nbsp;
                           </td><td>
                                <asp:Label ID="NearestLocationLabel" runat="server" 
                                    Text='<%# Eval("NearestLocation") %>' />
                           </td></tr>
                            <tr><td>
                                <asp:Label runat="server" ID="lblHostelFor" Text="Hostel For:" />&nbsp;&nbsp;
                            </td><td>
                                <asp:Label ID="HostelForLabel" runat="server" 
                                    Text='<%# Eval("Gender") %>' />
                            </td></tr>
                            <tr><td>
                                <asp:Label runat="server" ID="lblMessFacility" Text="Mess Facility:" />&nbsp;&nbsp;
                            </td><td>
                                <asp:Label ID="MessFacilityLabel" runat="server" 
                                    Text='<%# Eval("MessFacility") %>' />
                           </td></tr></table>
                          <table style="font-size: large">
                          <caption>Facilities</caption>
                             <tr><td>
                                <asp:Label runat="server" ID="lblBathRoom" Text="Bath Room:" />&nbsp;&nbsp;
                            </td><td>
                                <asp:Label ID="BathRoomLabel" runat="server" Text='<%# Eval("BathRoom") %>'/>
                         </td></tr>
                              <tr><td>
                                <asp:Label runat="server" ID="lblHotWater" Text="Hot Water:"/>&nbsp;&nbsp;
                              </td><td>
                                <asp:Label ID="HotWaterLabel" runat="server" Text='<%# Eval("HotWater") %>' />
                              </td></tr>
                              <tr><td>
                                 <asp:Label runat="server" ID="lblParking" Text="Parking:" />&nbsp;&nbsp;
                          </td><td>
                                <asp:Label ID="ParkingLabel" runat="server" Text='<%# Eval("Parking") %>' />
                           </td></tr>
                           <tr><td>
                                <asp:Label runat="server" ID="lblWifi" Text="Wifi:" />&nbsp;&nbsp;
                           </td><td>
                                <asp:Label ID="WifiLabel" runat="server" Text='<%# Eval("Wifi") %>' />
                           </td></tr>
                             <tr><td>
                                <asp:Label runat="server" ID="lblMoreAboutHostel" Text="More About Hostel:" />&nbsp;&nbsp;
                             </td><td>
                                <asp:Label ID="MoreAboutHostelLabel" runat="server" 
                                    Text='<%# Eval("MoreAboutHostel") %>' CssClass="form-control" />
                           </td></tr></table>
                               <table width="100%" style="font-size: large">
                               <caption>Room Information</caption>
                               <tr><th>No Of Rooms</th><th>Person In Each Room</th><th>Rent Per Head</th></tr>
                               <tr><td><asp:Label ID="NoOfRoomsLabel" runat="server" 
                                    Text='<%# Eval("NoOfRooms") %>' />
                                    </td><td>
                                    <asp:Label ID="PersonInEachRoomLabel" runat="server" 
                                    Text='<%# Eval("PersonInEachRoom") %>' />
                                    </td>
                                    <td>
                                    <asp:Label ID="RentPerHeadLabel" runat="server" 
                                    Text='<%# Eval("RentPerHead") %>' />
                                    </td></tr>
                               </table>
                               <table style="font-size: large">
                               <caption>Mess Information</caption>
                               <tr><td>
                                <asp:Label runat="server" ID="lblMessType" Text="Mess Type:"/>&nbsp;&nbsp;
                               </td><td>
                                <asp:Label ID="MessTypeLabel" runat="server" 
                                    Text='<%# Eval("MessType") %>'/>
                               </td></tr>
                                <tr><td>
                                <asp:Label runat="server" ID="lblBreakFast" Text="BreakFast:"/>&nbsp;&nbsp;
                                </td><td>
                                <asp:Label ID="BreakFastLabel" runat="server" 
                                    Text='<%# Eval("BreakFast") %>'/>
                                </td></tr>
                                <tr><td>
                                <asp:Label runat="server" ID="lblMessRent" Text="Mess Rent:" />&nbsp;&nbsp;
                                </td><td>
                                <asp:Label ID="MessRentLabel" runat="server" Text='<%# Eval("MessRent") %>' />
                                </td></tr></table>
                            </ItemTemplate>
                            
                        </asp:DataList>
                                                <div class="form-group">
                            <asp:Label ID="lblScheme" runat="server" Text="Scheme" CssClass="col-lg-4 control-label" Visible="false"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblScheme" runat="server" Visible="false">
                                            <asp:ListItem Selected="True" Value="3 Months">Rs&nbsp;299&nbsp;for&nbsp;3&nbsp;Months</asp:ListItem>
                                            <asp:ListItem Value="6 Months">Rs&nbsp;449&nbsp;for&nbsp;5&nbsp;Months</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                         <asp:SqlDataSource ID="SqlDisplayDetails" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            
                            
                            
                            
                            
                            
                            
                            
                            SelectCommand="SELECT Hostel.Name, Hostel.ContactNo1, Hostel.ContactNo2, Hostel.HostelLocation, Hostel.NearestLocation, Hostel.Gender, Hostel.MessFacility, Hostel.BathRoom, Hostel.HotWater, Hostel.Parking, Hostel.Wifi, Hostel.MessType, Hostel.BreakFast, Hostel.MessRent, Hostel.MoreAboutHostel, HostelRoom.NoOfRooms, HostelRoom.PersonInEachRoom, HostelRoom.RentPerHead FROM HostelRoom INNER JOIN Hostel ON HostelRoom.HostelId = Hostel.HostelId WHERE (Hostel.HostelId = @HostelId)" 
                            
                            UpdateCommand="UPDATE Hostel SET ActivationDate = @ActivationDate, Scheme = @Scheme WHERE (HostelId = @HostelId)">
                             <SelectParameters>
                                 <asp:QueryStringParameter Name="HostelId" QueryStringField="HostelId" />
                             </SelectParameters>
                             <UpdateParameters>
                                 <asp:ControlParameter ControlID="hfDate" Name="ActivationDate" 
                                     PropertyName="Value" />
                                 <asp:ControlParameter ControlID="rblScheme" Name="Scheme" 
                                     PropertyName="SelectedValue" />
                                 <asp:QueryStringParameter Name="HostelId" QueryStringField="HostelId" />
                             </UpdateParameters>
                        </asp:SqlDataSource>
                        
 <asp:SqlDataSource ID="SqlDeleteDetails" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            
                            
                            SelectCommand="SELECT [RoomId], [RoomLocation], [NearestLocation], [NoOfPerson], [RentPerHead], [Gender], [LightBill], [BathRoom], [HotWater], [Cooking], [Parking], [Wifi], [MoreAboutRoom] FROM [Room] WHERE ([RoomId] = @RoomId)" 
                            DeleteCommand="DELETE FROM [Room] WHERE [RoomId] = @RoomId" 
                            InsertCommand="INSERT INTO [Room] ([RoomLocation], [NearestLocation], [NoOfPerson], [RentPerHead], [Gender], [LightBill], [BathRoom], [HotWater], [Cooking], [Parking], [Wifi], [MoreAboutRoom]) VALUES (@RoomLocation, @NearestLocation, @NoOfPerson, @RentPerHead, @Gender, @LightBill, @BathRoom, @HotWater, @Cooking, @Parking, @Wifi, @MoreAboutRoom)" 
                            
                            
                            
                            UpdateCommand="UPDATE Hostel SET Disable = @Disable WHERE (HostelId = @HostelId)">
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
                                 <asp:ControlParameter ControlID="hfYes" Name="Disable" PropertyName="Value" />
                                 <asp:QueryStringParameter Name="HostelId" QueryStringField="HostelId" />
                             </UpdateParameters>
                        </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    DeleteCommand="DELETE FROM [Room] WHERE [RoomId] = @RoomId" 
                                    InsertCommand="INSERT INTO [Room] ([Date]) VALUES (@Date)" 
                                    SelectCommand="SELECT ActivationDate, Scheme, HostelId FROM Hostel WHERE (HostelId = @HostelId) AND (ActivationDate IS NOT NULL)" 
                                    
                                    
                            
                            
                            UpdateCommand="UPDATE Hostel SET Disable = @Disable WHERE (HostelId = @HostelId)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="RoomId" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter DbType="Date" Name="Date" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="HostelId" QueryStringField="HostelId" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="hfYes" Name="Disable" 
                                            PropertyName="Value" />
                                        <asp:QueryStringParameter Name="HostelId" QueryStringField="HostelId" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                         <asp:HiddenField ID="hfDate" runat="server" />
                         <asp:HiddenField ID="hfYes" runat="server" />
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-4">
                                <asp:Button ID="btnUpload" runat="server" CssClass="btn btn-primary" 
                                    Text="Repost" onclick="btnUpload_Click" Visible="False" />
                                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-primary" 
                                    Text="Delete This Add" onclick="btnDelete_Click" />
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-warning" 
                                    Text="Back" onclick="Button1_Click" />
                            </div>
                        </div>
                       </fieldset>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
             <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDisplayHostel" > 
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
                 <tr><td> <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl='<%# Eval("MessPhoto")%>'
                Width="100px" Height="100px" Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);" />
                </td></tr>
    </table>
        </ItemTemplate> 
    </asp:DataList> 
        
    <asp:SqlDataSource ID="SqlDisplayHostel" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
                 
                 SelectCommand="SELECT UploadPhoto1, UploadPhoto2, UploadPhoto3, MessPhoto FROM Hostel WHERE (HostelId = @HostelId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="HostelId" QueryStringField="HostelId" />
        </SelectParameters>
    </asp:SqlDataSource>
   
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlUserDetails">
                <ItemTemplate>
                   <table style="font-size: large">
                   <tr><td>
                                <asp:Label runat="server" ID="lblBookedBy" Text="Booked By:" />&nbsp;&nbsp;
                     </td><td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>'/>
                 </td></tr>
                  <tr><td>
                                <asp:Label runat="server" ID="lblContactNo" Text="ContactNo:" />&nbsp;&nbsp;
                   </td><td>
                    <asp:Label ID="ContactNoLabel" runat="server" Text='<%# Eval("ContactNo") %>' />
                   </td></tr>
                    <tr><td>
                           <a href='ConfirmHostel.aspx?HostelId=<%# Eval("HostelId") %>&UserId=<%# Eval("ContactNo") %>'>Confirm</a>                              
                                </td><td> <a href='CancelHostel.aspx?HostelId=<%# Eval("HostelId") %>&UserId=<%# Eval("ContactNo") %>'>Cancel</a>                              
                   </td></tr></table>
                </ItemTemplate>
            </asp:DataList><asp:SqlDataSource ID="SqlUserDetails" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                
                
                
                
                
                SelectCommand="SELECT Name, ContactNo, HostelId FROM Booking WHERE (HostelId = @HostelId) AND (HostelStatus = @HostelStatus)" >
                <SelectParameters>
                    <asp:QueryStringParameter Name="HostelId" QueryStringField="HostelId" />
                    <asp:ControlParameter ControlID="hfHold" Name="HostelStatus" 
                        PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="hfHold" runat="server" />
            <asp:HiddenField ID="hfNo" runat="server" />
             <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlUser">
                <ItemTemplate>
                    <table style="font-size: large">
                    <tr><td>
                                <asp:Label runat="server" ID="lblBookedBy" Text="Booked By:" />&nbsp;&nbsp;
                               </td><td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                   </td></tr>
                    <tr><td>
                                <asp:Label runat="server" ID="lblContactNo" Text="ContactNo:" />&nbsp;&nbsp;
                     </td><td>
                    <asp:Label ID="ContactNoLabel" runat="server" Text='<%# Eval("ContactNo") %>' />
                    </td></tr>
                    <tr><td></td><td>
                                <a href='DeleteHostelUser.aspx?HostelId=<%# Eval("HostelId") %>&UserId=<%# Eval("ContactNo") %>'>Delete</a>
                     </td></tr></table>
                </ItemTemplate>
            </asp:DataList><asp:SqlDataSource ID="SqlUser" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
            
                
                
                
                
                
                SelectCommand="SELECT Name, ContactNo, HostelId FROM Booking WHERE (HostelId = @HostelId) AND (HostelStatus = @HostelStatus)" >
                <SelectParameters>
                    <asp:QueryStringParameter Name="HostelId" QueryStringField="HostelId" />
                    <asp:ControlParameter ControlID="hfRoomStatus" Name="HostelStatus" 
                        PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="hfRoomStatus" runat="server" />
        </fieldset></div></div></div>
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

