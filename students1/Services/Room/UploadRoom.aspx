<%@ Page Title="Upload Room" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadRoom.aspx.cs" Inherits="students1.Services.UploadRoom" %>
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
    <asp:Panel ID="PanelUploadRoom1" runat="server">
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <div id="banner">
                
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                         <legend>Room Information<i class="fa fa-pencil pull-right"></i></legend>
                          <div class="form-group">
                            <asp:Label ID="lblContactNo1" runat="server" Text="Contact No 1" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtContactNo1" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtContactNo1" runat="server" placeholder="Contact No 1" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblContactNo2" runat="server" Text="Contact No 2" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtContactNo2" runat="server" placeholder="Contact No 2" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                         <div class="form-group">
                          <asp:Label ID="lblState" runat="server" Text="State" CssClass="col-lg-4 control-label"></asp:Label>  
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="ddlState" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                        
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
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="ddlCity" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                        
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
                          <asp:Label ID="lblNearestLocation" runat="server" Text="Nearest Location" CssClass="col-lg-4 control-label"></asp:Label>  
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="ddlNearestLocation" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                        
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
                            <asp:Label ID="lblRoomLocation" runat="server" Text="Room Location" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtRoomLocation" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <div class="col-lg-7">
                                <asp:TextBox ID="txtRoomLocation" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <asp:Label ID="lblNoOfPerson" runat="server" Text="For Person(s)" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="txtNoOfPerson" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtNoOfPerson" runat="server" placeholder="For Person(s)" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblRentPerHead" runat="server" Text="Rent Per Head" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="txtRentPerHead" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtRentPerHead" runat="server" placeholder="Rent Per Head" CssClass="form-control"></asp:TextBox>
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
                          <asp:Label ID="lblUploadPhoto1" runat="server" Text="Upload Photo 1" CssClass="col-lg-4 control-label"></asp:Label>  
                            <div class="col-lg-8">
                                <asp:FileUpload ID="fuUploadPhoto1" runat="server" CssClass="form-control" />                           
                            </div>
                        </div>
                        <div class="form-group">
                          <asp:Label ID="lblUploadPhoto2" runat="server" Text="Upload Photo 2" CssClass="col-lg-4 control-label"></asp:Label> 
                            <div class="col-lg-8">
                                <asp:FileUpload ID="fuUploadPhoto2" runat="server" CssClass="form-control" />                           
                            </div>
                        </div>
                        <div class="form-group">
                          <asp:Label ID="lblUploadPhoto3" runat="server" Text="Upload Photo 3" CssClass="col-lg-4 control-label"></asp:Label>   
                            <div class="col-lg-8">
                                <asp:FileUpload ID="fuUploadPhoto3" runat="server" CssClass="form-control" />                           
                            </div>
                        </div>
                    
                       <div class="form-group">
                            <div class="col-lg-5 col-lg-offset-4">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" 
                                    Text="Next" onclick="btnSubmit_Click" />
                                  <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Text="Cancel" />                              
                            </div>
                        </div>
                        <asp:HiddenField ID="hfUploadPhoto1" runat="server" />
                                <asp:HiddenField ID="hfUploadPhoto2" runat="server" />
                                <asp:HiddenField ID="hfUploadPhoto3" runat="server" />
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
    </asp:Panel>
    <asp:Panel ID="PanelUploadRoom2" runat="server" Visible="False">
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <div id="Div1">
                
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                        <legend>Facilities<i class="fa fa-pencil pull-right"></i></legend>
                        <div class="form-group">
                            <asp:Label ID="lblLightBill" runat="server" Text="Light Bill" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblLightBill" runat="server">
                                            <asp:ListItem Selected="True">Included</asp:ListItem>
                                            <asp:ListItem>Not&nbsp;Included</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblBathRoom" runat="server" Text="BathRoom" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblBathRoom" runat="server">
                                            <asp:ListItem Selected="True">Shared</asp:ListItem>
                                            <asp:ListItem>Separate</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblHotWater" runat="server" Text="Hot Water" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblHotWater" runat="server">
                                            <asp:ListItem Selected="True">Available</asp:ListItem>
                                            <asp:ListItem>Not&nbsp;Available</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblCooking" runat="server" Text="Cooking" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblCooking" runat="server">
                                            <asp:ListItem Selected="True">Allowed</asp:ListItem>
                                            <asp:ListItem>Not&nbsp;Allowed</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblParking" runat="server" Text="Parking" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblParking" runat="server">
                                            <asp:ListItem Selected="True">Available</asp:ListItem>
                                            <asp:ListItem>Not&nbsp;Available</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblWifi" runat="server" Text="Wifi" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblWifi" runat="server">
                                            <asp:ListItem Selected="True">Available</asp:ListItem>
                                            <asp:ListItem>Not&nbsp;Available</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblMoreAboutRoom" runat="server" Text="More About Room" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtMoreAboutRoom" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-5 col-lg-offset-4">
                                <asp:Button ID="btnUpload1" runat="server" CssClass="btn btn-primary" 
                                    Text="Upload" onclick="btnUpload1_Click" 
                                    />
                                  <asp:Button ID="btnBack" runat="server" CssClass="btn btn-warning" 
                                    Text="Back" onclick="btnBack_Click"  />                              
                         </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlUploadRoom" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    DeleteCommand="DELETE FROM [Room] WHERE [SrNo] = @SrNo" 
                                    InsertCommand="INSERT INTO Room(RoomLocation, NearestLocation, NoOfPerson, RentPerHead, Gender, UploadPhoto1, UploadPhoto2, UploadPhoto3, LightBill, BathRoom, HotWater, Cooking, Parking, Wifi, MoreAboutRoom, UserId, Status, Confirm, Counter, Disable, New, ContactNo1, ContactNo2, Name, State, City) VALUES (@RoomLocation, @NearestLocation, @NoOfPerson, @RentPerHead, @Gender, @UploadPhoto1, @UploadPhoto2, @UploadPhoto3, @LightBill, @BathRoom, @HotWater, @Cooking, @Parking, @Wifi, @MoreAboutRoom, @UserId, @Status, @Confirm, @Counter, @Disable, @New, @ContactNo1, @ContactNo2, @Name, @State, @City)" 
                                    SelectCommand="SELECT RoomId FROM Room WHERE (UserId = @UserId) AND (New = @New)" 
                                    
        
        
        
            
            
            
            
            
            
            UpdateCommand="UPDATE [Room] SET [RoomLocation] = @RoomLocation, [NearestLocation] = @NearestLocation, [NoOfPerson] = @NoOfPerson, [RentPerHead] = @RentPerHead, [Gender] = @Gender, [UploadPhoto1] = @UploadPhoto1, [UploadPhoto2] = @UploadPhoto2, [UploadPhoto3] = @UploadPhoto3, [LightBill] = @LightBill, [BathRoom] = @BathRoom, [HotWater] = @HotWater, [Cooking] = @Cooking, [Parking] = @Parking, [Wifi] = @Wifi, [MoreAboutRoom] = @MoreAboutRoom WHERE [SrNo] = @SrNo">
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:SessionParameter Name="RoomLocation" SessionField="RoomLocation" 
                                            Type="String" />
            <asp:SessionParameter Name="NearestLocation" SessionField="NearestLocation" 
                                            Type="String" />
            <asp:SessionParameter Name="NoOfPerson" SessionField="NoOfPerson" 
                                            Type="Int32" />
            <asp:SessionParameter Name="RentPerHead" SessionField="RentPerHead" 
                                            Type="Int32" />
            <asp:SessionParameter Name="Gender" SessionField="RoomGender" Type="String" />
            <asp:SessionParameter Name="UploadPhoto1" SessionField="UploadPhoto1" 
                Type="String" />
            <asp:SessionParameter Name="UploadPhoto2" SessionField="UploadPhoto2" 
                Type="String" />
            <asp:SessionParameter Name="UploadPhoto3" SessionField="UploadPhoto3" 
                Type="String" />
            <asp:SessionParameter Name="LightBill" SessionField="LightBill" Type="String" />
            <asp:SessionParameter Name="BathRoom" SessionField="BathRoom" Type="String" />
            <asp:SessionParameter Name="HotWater" SessionField="HotWater" Type="String" />
            <asp:SessionParameter Name="Cooking" SessionField="Cooking" Type="String" />
            <asp:SessionParameter Name="Parking" SessionField="Parking" Type="String" />
            <asp:SessionParameter Name="Wifi" SessionField="Wifi" Type="String" />
            <asp:SessionParameter Name="MoreAboutRoom" SessionField="MoreAboutRoom" 
                Type="String" />
            <asp:SessionParameter Name="UserId" SessionField="UserId" />
            <asp:ControlParameter ControlID="hfStatus" Name="Status" PropertyName="Value" />
            <asp:ControlParameter ControlID="hfConfirm" Name="Confirm" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="hfCounter" DefaultValue="" Name="Counter" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="hfYes" Name="Disable" PropertyName="Value" />
            <asp:ControlParameter ControlID="hfNew" DefaultValue="" Name="New" 
                PropertyName="Value" />
            <asp:SessionParameter Name="ContactNo1" SessionField="ContactNo1" />
            <asp:SessionParameter Name="ContactNo2" SessionField="ContactNo2" />
            <asp:SessionParameter Name="Name" SessionField="Name" />
            <asp:SessionParameter Name="State" SessionField="State" />
            <asp:SessionParameter Name="City" SessionField="City" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="UserId" SessionField="UserId" />
            <asp:ControlParameter ControlID="hfNew" Name="New" PropertyName="Value" />
        </SelectParameters>
        <UpdateParameters>
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
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:HiddenField ID="hfStatus" runat="server" />

        <asp:HiddenField ID="hfNo" runat="server" />

        <asp:HiddenField ID="hfYes" runat="server" />

        <asp:HiddenField ID="hfNew" runat="server" />

    <asp:HiddenField ID="hfConfirm" runat="server" />

    <asp:HiddenField ID="hfCounter" runat="server" />

     <asp:HiddenField ID="hfRoomId" runat="server" />
    </asp:Panel>
    <asp:Panel ID="PanelUploadRoom3" runat="server" Visible="False">
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
                            
                            
                            
                            
                            
                            
                            SelectCommand="SELECT [RoomLocation], [NearestLocation], [NoOfPerson], [RentPerHead], [Gender], [LightBill], [BathRoom], [HotWater], [Cooking], [Parking], [Wifi], [MoreAboutRoom], [ContactNo1], [ContactNo2], [Name] FROM [Room] WHERE ([RoomId] = @RoomId)">
                             <SelectParameters>
                                 <asp:ControlParameter ControlID="hfRoomId" Name="RoomId" PropertyName="Value" 
                                     Type="Int32" />
                             </SelectParameters>
                        </asp:SqlDataSource>
                         <asp:SqlDataSource ID="SqlDeleteDetails" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            DeleteCommand="DELETE FROM [Room] WHERE [RoomId] = @RoomId" 
                            InsertCommand="INSERT INTO [Room] ([Date], [RoomLocation], [NearestLocation], [NoOfPerson], [RentPerHead], [Gender], [UploadPhoto1], [UploadPhoto2], [UploadPhoto3], [LightBill], [BathRoom], [HotWater], [Cooking], [Parking], [Wifi], [MoreAboutRoom], [UserId], [Status], [Counter], [Confirm]) VALUES (@Date, @RoomLocation, @NearestLocation, @NoOfPerson, @RentPerHead, @Gender, @UploadPhoto1, @UploadPhoto2, @UploadPhoto3, @LightBill, @BathRoom, @HotWater, @Cooking, @Parking, @Wifi, @MoreAboutRoom, @UserId, @Status, @Counter, @Confirm)" 
                            SelectCommand="SELECT * FROM [Room]" 
                            
                            
                            UpdateCommand="UPDATE Room SET New = @New WHERE (RoomId = @RoomId)">
                             <DeleteParameters>
                                 <asp:ControlParameter ControlID="hfRoomId" Name="RoomId" PropertyName="Value" 
                                     Type="Int32" />
                             </DeleteParameters>
                             <InsertParameters>
                                 <asp:Parameter DbType="Date" Name="Date" />
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
                                 <asp:Parameter Name="UserId" Type="String" />
                                 <asp:Parameter Name="Status" Type="String" />
                                 <asp:Parameter Name="Counter" Type="String" />
                                 <asp:Parameter Name="Confirm" Type="String" />
                             </InsertParameters>
                             <UpdateParameters>
                                 <asp:ControlParameter ControlID="hfRoomId" Name="RoomId" PropertyName="Value" />
                                 <asp:ControlParameter ControlID="hfNew2" Name="New" PropertyName="Value" />
                             </UpdateParameters>
                        </asp:SqlDataSource>
                         <asp:HiddenField ID="hfNew2" runat="server" />
                         <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-4">
                                <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-primary" 
                                    Text="Edit" onclick="btnEdit_Click"  />
                                
                            </div>
                        </div>
                        <div class="form-group">
                        <div class="col-lg-10 col-lg-offset-4">
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="I accept that all the above information is correct" CssClass="checkbox"  />
                        </div>
                        </div>
                       
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-4">
                                <asp:Button ID="btnUpload" runat="server" CssClass="btn btn-primary" 
                                    Text="Upload" onclick="btnUpload_Click" />
                                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-warning" 
                                    Text="Delete This Add" onclick="btnDelete_Click" />
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
            <asp:ControlParameter ControlID="hfRoomId" Name="RoomId" PropertyName="Value" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
   
        </div>
        
    </div>
    </asp:Panel>
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
