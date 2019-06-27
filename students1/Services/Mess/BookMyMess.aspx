<%@ Page Title="Book My Mess" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookMyMess.aspx.cs" Inherits="students1.Services.Mess.BookMyMess" %>

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
            <div class="registrationform">
            <asp:HiddenField ID="hfHold" runat="server" />
                <div class="form-horizontal">
                    <fieldset>
                        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDisplayDetails">
                            <ItemTemplate>
                            <table style="font-size: large"><tr><td>
                                <asp:Label runat="server" ID="lblName" Text="Name:" />&nbsp;&nbsp;</td>
                              <td>
                                <asp:Label ID="NameLabel" runat="server" 
                                    Text='<%# Eval("Name") %>' /></td>
                            </tr>
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
                                <asp:Label runat="server" ID="lblMessType" Text="Mess Type:" />&nbsp;&nbsp;
                            </td><td>
                                <asp:Label ID="MessTypeLabel" runat="server" 
                                    Text='<%# Eval("MessType") %>' />
                             </td></tr>
                             <tr><td>
                                <asp:Label runat="server" ID="lblMessLocation" Text="Mess Location:" />&nbsp;&nbsp;
                               </td><td>
                                <asp:Label ID="MessLocationLabel" runat="server" 
                                    Text='<%# Eval("MessLocation") %>' />
                              </td></tr>
                             <tr><td>
                                <asp:Label runat="server" ID="lblNearestLocation" Text="Nearest Location:" />&nbsp;&nbsp;
                            </td><td>
                                <asp:Label ID="NearestLocationLabel" runat="server" 
                                    Text='<%# Eval("NearestLocation") %>' />
                             </td></tr>
                             <tr><td>
                                <asp:Label runat="server" ID="lblMonthlyPrice" Text="Monthly Price:" />&nbsp;&nbsp;
                           </td><td>
                                <asp:Label ID="MonthlyPriceLabel" runat="server" Text='<%# Eval("MonthlyPrice") %>' />
                             </td></tr>
                               <tr><td>
                                <asp:Label runat="server" ID="lblTiffinFacility" Text="Tiffin Facility:" />&nbsp;&nbsp;
                                </td><td>
                                <asp:Label ID="TiffinFacilityLabel" runat="server" 
                                    Text='<%# Eval("TiffinFacility") %>' />
                                </td></tr>
                               <table style="font-size: large">
                               <caption>Full Tiffin</caption>
                                <tr><td>
                                <asp:Label runat="server" ID="lblFullChapati" Text="Chapati:" />&nbsp;&nbsp;
                               </td><td>
                                <asp:Label ID="FullChapatiLabel" runat="server" Text='<%# Eval("FullChapati") %>' />
                               </td></tr>
                             <tr><td>
                                <asp:Label runat="server" ID="lblFullSabji" Text="Sabji:" />&nbsp;&nbsp;
                             </td><td>
                                <asp:Label ID="FullSabjiLabel" runat="server" Text='<%# Eval("FullSabji") %>' />
                             </td></tr>
                              <tr><td>
                                <asp:Label runat="server" ID="lblFullRice" Text="Rice:" />&nbsp;&nbsp;
                                </td><td>
                                <asp:Label ID="FullRiceLabel" runat="server" Text='<%# Eval("FullRice") %>' />
                               </td></tr>
                              <tr><td>
                                <asp:Label runat="server" ID="lblFullDal" Text="Dal:"/>&nbsp;&nbsp;
                               </td><td>
                                <asp:Label ID="FullDalLabel" runat="server" Text='<%# Eval("FullDal") %>' />
                               </td></tr>
                               <tr><td>
                                <asp:Label runat="server" ID="lblFullSalad" Text="Salad:" />&nbsp;&nbsp;
                               </td><td>
                                <asp:Label ID="FullSaladLabel" runat="server" Text='<%# Eval("FullSalad") %>' />
                                </td></tr>
                               <tr><td>
                                <asp:Label runat="server" ID="lblFullMonthlyPrice" Text="Monthly Price:" />&nbsp;&nbsp;
                               </td><td>
                                <asp:Label ID="FullMonthlyPriceLabel" runat="server" Text='<%# Eval("FullMonthlyPrice") %>'/>
                              </td></tr></table>
                              <table style="font-size: large">
                              <caption>Half Tiffin</caption>
                              <tr><td>
                                <asp:Label runat="server" ID="lblHalfChapati" Text="Chapati:" />&nbsp;&nbsp;
                               </td><td>
                                <asp:Label ID="HalfChapatiLabel" runat="server" Text='<%# Eval("HalfChapati") %>' />
                                </td></tr>
                                <tr><td>
                                <asp:Label runat="server" ID="lblHalfSabji" Text="Sabji:" />&nbsp;&nbsp;
                                </td><td>
                                <asp:Label ID="HalfSabjiLabel" runat="server" Text='<%# Eval("HalfSabji") %>' />
                                </td></tr>
                                <tr><td>
                                <asp:Label runat="server" ID="lblHalfRice" Text="Rice:" />&nbsp;&nbsp;
                                </td><td>
                                <asp:Label ID="HalfRiceLabel" runat="server" Text='<%# Eval("HalfRice") %>' />
                                </td></tr>
                                <tr><td>
                                <asp:Label runat="server" ID="lblHalfDal" Text="Dal:" />&nbsp;&nbsp;
                                </td><td>
                                <asp:Label ID="HalfDalLabel" runat="server" Text='<%# Eval("HalfDal") %>' />
                                 </td></tr>
                                <tr><td>
                                <asp:Label runat="server" ID="lblHalfSalad" Text="Salad:"/>&nbsp;&nbsp;
                                 </td><td>
                                <asp:Label ID="HalfSaladLabel" runat="server" Text='<%# Eval("HalfSalad") %>' />
                               </td></tr>
                              <tr><td>
                                <asp:Label runat="server" ID="lblHalfMonthlyPrice" Text="Monthly Price:" />&nbsp;&nbsp;
                              </td><td>
                                <asp:Label ID="HalfMonthlyPriceLabel" runat="server" Text='<%# Eval("HalfMonthlyPrice") %>' />
                              </td></tr></table>
                            </ItemTemplate>
                            </asp:DataList>
                         <asp:SqlDataSource ID="SqlDisplayDetails" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            
                            
                            
                            
                            
                            
                            
                            
                            SelectCommand="SELECT Name, ContactNo1, ContactNo2, MessType, MessLocation, NearestLocation, MonthlyPrice, TiffinFacility, FullChapati, FullSabji, FullRice, FullDal, FullSalad, FullMonthlyPrice, HalfChapati, Halfsabji, HalfRice, HalfDal, HalfSalad, HalfMonthlyPrice FROM Mess WHERE (MessId = @MessId)">
                             <SelectParameters>
                                 <asp:QueryStringParameter Name="MessId" QueryStringField="MessId" 
                                     Type="Int32" />
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
                                    Text="Book My Mess" onclick="btnSubmit_Click" />
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-warning" 
                                    Text="Back" onclick="Button1_Click" />
                                <asp:SqlDataSource ID="SqlBook" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    DeleteCommand="DELETE FROM [Booking] WHERE [SrNo] = @SrNo" 
                                    InsertCommand="INSERT INTO Booking(MessId, Name, ContactNo, MessStatus) VALUES (@MessId, @Name, @ContactNo, @MessStatus)" 
                                    SelectCommand="SELECT * FROM [Booking]" 
                                    
                                    
                                    
                                    
                                    UpdateCommand="UPDATE [Booking] SET [RoomId] = @RoomId, [Name] = @Name, [ContactNo] = @ContactNo WHERE [SrNo] = @SrNo">
                                    <DeleteParameters>
                                        <asp:Parameter Name="SrNo" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:SessionParameter Name="Name" SessionField="Name" Type="String" />
                                        <asp:SessionParameter Name="ContactNo" SessionField="UserId" Type="String" />
                                        <asp:QueryStringParameter Name="MessId" QueryStringField="MessId" />
                                        <asp:ControlParameter ControlID="hfHold" Name="MessStatus" 
                                            PropertyName="Value" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="RoomId" Type="Int32" />
                                        <asp:Parameter Name="Name" Type="String" />
                                        <asp:Parameter Name="ContactNo" Type="String" />
                                        <asp:Parameter Name="SrNo" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                        </div></div></fieldset>
                                                    </div>
                        </div>
                </div>
            </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
             <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDisplayMess" > 
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
        
    <asp:SqlDataSource ID="SqlDisplayMess" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
                 SelectCommand="SELECT UploadPhoto1, UploadPhoto2 FROM Mess WHERE (MessId = @MessId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="MessId" QueryStringField="MessId" />
        </SelectParameters>
    </asp:SqlDataSource>
            <asp:HiddenField ID="hfCounter" runat="server" />
             <asp:SqlDataSource ID="SqlCounter" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                 DeleteCommand="DELETE FROM [Room] WHERE [RoomId] = @RoomId" 
                 InsertCommand="INSERT INTO [Room] ([Counter]) VALUES (@Counter)" 
                 SelectCommand="SELECT Counter, MessId FROM Mess WHERE (MessId = @MessId)" 
                 
                 UpdateCommand="UPDATE Mess SET Counter = @Counter WHERE (MessId = @MessId)">
                 <DeleteParameters>
                     <asp:Parameter Name="RoomId" Type="Int32" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="Counter" Type="Int32" />
                 </InsertParameters>
                 <SelectParameters>
                     <asp:QueryStringParameter Name="MessId" QueryStringField="MessId" />
                 </SelectParameters>
                 <UpdateParameters>
                     <asp:ControlParameter ControlID="hfCounter" Name="Counter" PropertyName="Value" 
                         Type="Int32" />
                     <asp:QueryStringParameter Name="MessId" QueryStringField="MessId" />
                 </UpdateParameters>
             </asp:SqlDataSource>
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

