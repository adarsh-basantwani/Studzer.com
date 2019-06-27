<%@ Page Title="Upload Hostel" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadHostel.aspx.cs" Inherits="students1.Services.Hostel.UploadHostel" %>
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
    <asp:Panel ID="PanelUploadHostel1" runat="server">
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <div id="banner">
                
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                         <legend>Hostel Information<i class="fa fa-pencil pull-right"></i></legend>
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
                            <asp:Label ID="lblHostelLocation" runat="server" Text="Hostel Location" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtHostelLocation" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            
                            <div class="col-lg-7">
                                <asp:TextBox ID="txtHostelLocation" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
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
                            <asp:Label ID="lblMessFacility" runat="server" Text="Mess Facility" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblMessFacility" runat="server">
                                            <asp:ListItem Selected="True" Value="Yes">Yes</asp:ListItem>
                                            <asp:ListItem Value="No">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="lblScheme" runat="server" Text="Scheme" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblScheme" runat="server">
                                            <asp:ListItem Selected="True" Value="3 Months">Rs&nbsp;299&nbsp;for&nbsp;3&nbsp;Months</asp:ListItem>
                                            <asp:ListItem Value="6 Months">Rs&nbsp;449&nbsp;for&nbsp;5&nbsp;Months</asp:ListItem>
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
    <asp:Panel ID="PanelUploadHostel2" runat="server" Visible="False">
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <div id="Div2">
               
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                        <legend>Room Information<i class="fa fa-pencil pull-right"></i></legend>
                         <div class="form-group">
                            <asp:Label ID="lblNoOfRooms" runat="server" Text="No Of Rooms" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="txtNoOfRooms" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                       
                          
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtNoOfRooms" runat="server" placeholder="No Of Rooms" CssClass="form-control"></asp:TextBox>
                            </div></div>
                         <div class="form-group">
                            <asp:Label ID="lblPersonInEachRoom" runat="server" Text="Person in each Room" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="txtPersonInEachRoom" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                       
                          
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtPersonInEachRoom" runat="server" placeholder="Person in each Room" CssClass="form-control"></asp:TextBox>
                            </div></div>   
                             <div class="form-group">
                            <asp:Label ID="lblRentPerHead" runat="server" Text="Rent Per Head" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                ControlToValidate="txtRentPerHead" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                       
                          
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtRentPerHead" runat="server" placeholder="Rent Per Head" CssClass="form-control"></asp:TextBox>
                            </div></div>
                            <div class="form-group">
                            <div class="col-lg-8">
                            <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblRent" runat="server">
                                            <asp:ListItem Selected="True" Value="1">Including&nbsp;All&nbsp;Charges</asp:ListItem>
                                            <asp:ListItem Value="2">Excluding&nbsp;Mess&nbsp;Charges</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-5 col-lg-offset-4">
                            <asp:Button ID="Button3" runat="server" CssClass="btn btn-primary" 
                                    Text="Add Room" onclick="Button3_Click" 
                                    />
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" 
                                    Text="Next" onclick="Button1_Click"  
                                    />
                                  <asp:Button ID="Button2" runat="server" CssClass="btn btn-warning" 
                                    Text="Back" onclick="Button2_Click" />                              
                                <asp:SqlDataSource ID="SqlAddRoom" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    DeleteCommand="DELETE FROM [HostelRoom] WHERE [SrNo] = @SrNo" 
                                    InsertCommand="INSERT INTO [HostelRoom] ([HostelId], [NoOfRooms], [PersonInEachRoom], [RentPerHead]) VALUES (@HostelId, @NoOfRooms, @PersonInEachRoom, @RentPerHead)" 
                                    SelectCommand="SELECT * FROM [HostelRoom]" 
                                    UpdateCommand="UPDATE [HostelRoom] SET [HostelId] = @HostelId, [NoOfRooms] = @NoOfRooms, [PersonInEachRoom] = @PersonInEachRoom, [RentPerHead] = @RentPerHead WHERE [SrNo] = @SrNo">
                                    <DeleteParameters>
                                        <asp:Parameter Name="SrNo" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:ControlParameter ControlID="hfHostelId" Name="HostelId" 
                                            PropertyName="Value" Type="Int32" />
                                        <asp:ControlParameter ControlID="txtNoOfRooms" Name="NoOfRooms" 
                                            PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="txtPersonInEachRoom" Name="PersonInEachRoom" 
                                            PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="txtRentPerHead" Name="RentPerHead" 
                                            PropertyName="Text" Type="Int32" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="HostelId" Type="Int32" />
                                        <asp:Parameter Name="NoOfRooms" Type="Int32" />
                                        <asp:Parameter Name="PersonInEachRoom" Type="Int32" />
                                        <asp:Parameter Name="RentPerHead" Type="Int32" />
                                        <asp:Parameter Name="SrNo" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                         </div>
                        </div>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="SrNo" DataSourceID="SqlDisplayHostelRoom" Width="100%">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                                    ButtonType="Button" />
                                <asp:BoundField DataField="SrNo" HeaderText="Sr. No." InsertVisible="False" 
                                    ReadOnly="True" SortExpression="SrNo" />
                                <asp:BoundField DataField="HostelId" HeaderText="Hostel Id" 
                                    SortExpression="HostelId" />
                                <asp:BoundField DataField="NoOfRooms" HeaderText="No Of Rooms" 
                                    SortExpression="NoOfRooms" />
                                <asp:BoundField DataField="PersonInEachRoom" HeaderText="Person In Each Room" 
                                    SortExpression="PersonInEachRoom" />
                                <asp:BoundField DataField="RentPerHead" HeaderText="Rent Per Head" 
                                    SortExpression="RentPerHead" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDisplayHostelRoom" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            DeleteCommand="DELETE FROM [HostelRoom] WHERE [SrNo] = @SrNo" 
                            InsertCommand="INSERT INTO [HostelRoom] ([HostelId], [NoOfRooms], [PersonInEachRoom], [RentPerHead]) VALUES (@HostelId, @NoOfRooms, @PersonInEachRoom, @RentPerHead)" 
                            SelectCommand="SELECT [HostelId], [NoOfRooms], [PersonInEachRoom], [RentPerHead], [SrNo] FROM [HostelRoom] WHERE ([HostelId] = @HostelId)" 
                            UpdateCommand="UPDATE [HostelRoom] SET [HostelId] = @HostelId, [NoOfRooms] = @NoOfRooms, [PersonInEachRoom] = @PersonInEachRoom, [RentPerHead] = @RentPerHead WHERE [SrNo] = @SrNo">
                            <DeleteParameters>
                                <asp:Parameter Name="SrNo" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="HostelId" Type="Int32" />
                                <asp:Parameter Name="NoOfRooms" Type="Int32" />
                                <asp:Parameter Name="PersonInEachRoom" Type="Int32" />
                                <asp:Parameter Name="RentPerHead" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="hfHostelId" Name="HostelId" 
                                    PropertyName="Value" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="HostelId" Type="Int32" />
                                <asp:Parameter Name="NoOfRooms" Type="Int32" />
                                <asp:Parameter Name="PersonInEachRoom" Type="Int32" />
                                <asp:Parameter Name="RentPerHead" Type="Int32" />
                                <asp:Parameter Name="SrNo" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </fieldset>
                </div>
            </div>
            </div>
        </div>

    </asp:Panel>

    <asp:Panel ID="PanelUploadHostel3" runat="server" Visible="False">
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
                            <asp:Label ID="lblMoreAboutHostel" runat="server" Text="More About Hostel" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtMoreAboutHostel" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-5 col-lg-offset-4">
                                <asp:Button ID="btnUpload1" runat="server" CssClass="btn btn-primary" 
                                    Text="Next" onclick="btnUpload1_Click" 
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

    <asp:SqlDataSource ID="SqlUploadHostel" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    DeleteCommand="DELETE FROM [Hostel] WHERE [HostelId] = @HostelId" 
                                    InsertCommand="INSERT INTO Hostel(Name, ContactNo1, ContactNo2, HostelLocation, NearestLocation, Gender, MessFacility, Scheme, UploadPhoto1, UploadPhoto2, UploadPhoto3, BathRoom, HotWater, Parking, Wifi, UserId, Disable, Counter, New, MoreAboutHostel, State, City) VALUES (@Name, @ContactNo1, @ContactNo2, @HostelLocation, @NearestLocation, @Gender, @MessFacility, @Scheme, @UploadPhoto1, @UploadPhoto2, @UploadPhoto3, @BathRoom, @HotWater, @Parking, @Wifi, @UserId, @Disable, @Counter, @New, @MoreAboutHostel, @State, @City)" 
                                    SelectCommand="SELECT HostelId FROM Hostel WHERE (UserId = @UserId) AND (New = @New)" 
                                    
        
        
        
            
            
            
            
            
            
            UpdateCommand="UPDATE [Hostel] SET [HostelName] = @HostelName, [HostelContactNo] = @HostelContactNo, [HostelLocation] = @HostelLocation, [NearestLocation] = @NearestLocation, [Gender] = @Gender, [MessFacility] = @MessFacility, [Scheme] = @Scheme, [UploadPhoto1] = @UploadPhoto1, [UploadPhoto2] = @UploadPhoto2, [UploadPhoto3] = @UploadPhoto3, [BathRoom] = @BathRoom, [HotWater] = @HotWater, [Parking] = @Parking, [Wifi] = @Wifi, [UserId] = @UserId, [Disable] = @Disable, [Counter] = @Counter, [New] = @New WHERE [HostelId] = @HostelId">
        <DeleteParameters>
            <asp:Parameter Name="HostelId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:SessionParameter Name="HostelLocation" SessionField="HostelLocation" 
                Type="String" />
            <asp:SessionParameter Name="NearestLocation" SessionField="NearestLocation" 
                Type="String" />
            <asp:SessionParameter Name="Gender" SessionField="HostelGender" Type="String" />
            <asp:SessionParameter Name="MessFacility" SessionField="MessFacility" 
                Type="String" />
            <asp:SessionParameter Name="Scheme" SessionField="Scheme" Type="String" />
            <asp:SessionParameter Name="UploadPhoto1" SessionField="UploadPhoto1" 
                Type="String" />
            <asp:SessionParameter Name="UploadPhoto2" SessionField="UploadPhoto2" 
                Type="String" />
            <asp:SessionParameter Name="UploadPhoto3" SessionField="UploadPhoto3" 
                Type="String" />
            <asp:SessionParameter Name="BathRoom" SessionField="BathRoom" Type="String" />
            <asp:SessionParameter Name="HotWater" SessionField="HotWater" Type="String" />
            <asp:SessionParameter Name="Parking" SessionField="Parking" Type="String" />
            <asp:SessionParameter Name="Wifi" SessionField="Wifi" Type="String" />
            <asp:SessionParameter Name="UserId" SessionField="UserId" Type="String" />
            <asp:ControlParameter ControlID="hfDisable" Name="Disable" PropertyName="Value" 
                Type="String" />
            <asp:ControlParameter ControlID="hfCounter" Name="Counter" PropertyName="Value" 
                Type="String" />
            <asp:ControlParameter ControlID="hfNew" Name="New" PropertyName="Value" 
                Type="String" />
            <asp:SessionParameter Name="Name" SessionField="Name" />
            <asp:SessionParameter Name="ContactNo1" SessionField="ContactNo1" />
            <asp:SessionParameter Name="ContactNo2" SessionField="ContactNo2" />
            <asp:SessionParameter Name="MoreAboutHostel" SessionField="MoreAboutHostel" />
            <asp:SessionParameter Name="State" SessionField="State" />
            <asp:SessionParameter Name="City" SessionField="City" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="UserId" SessionField="UserId" />
            <asp:ControlParameter ControlID="hfNew" Name="New" PropertyName="Value" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="HostelName" Type="String" />
            <asp:Parameter Name="HostelContactNo" Type="String" />
            <asp:Parameter Name="HostelLocation" Type="String" />
            <asp:Parameter Name="NearestLocation" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="MessFacility" Type="String" />
            <asp:Parameter Name="Scheme" Type="String" />
            <asp:Parameter Name="UploadPhoto1" Type="String" />
            <asp:Parameter Name="UploadPhoto2" Type="String" />
            <asp:Parameter Name="UploadPhoto3" Type="String" />
            <asp:Parameter Name="BathRoom" Type="String" />
            <asp:Parameter Name="HotWater" Type="String" />
            <asp:Parameter Name="Parking" Type="String" />
            <asp:Parameter Name="Wifi" Type="String" />
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="Disable" Type="String" />
            <asp:Parameter Name="Counter" Type="String" />
            <asp:Parameter Name="New" Type="String" />
            <asp:Parameter Name="HostelId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

        <asp:HiddenField ID="hfNew" runat="server" />

    <asp:HiddenField ID="hfCounter" runat="server" />

     <asp:HiddenField ID="hfHostelId" runat="server" />
    </asp:Panel>
    <asp:Panel ID="PanelUploadMess1" runat="server" Visible="false">
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <div id="Div3">
                
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                         <legend>Mess Information<i class="fa fa-pencil pull-right"></i></legend>
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
                            <asp:Label ID="lblBreakFast" runat="server" Text="BreakFast" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblBreakFast" runat="server">
                                            <asp:ListItem Selected="True">Available</asp:ListItem>
                                            <asp:ListItem>Not&nbsp;Available</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblMessRent" runat="server" Text="Mess Rent" CssClass="col-lg-4 control-label" Visible="false"></asp:Label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtMessRent" runat="server" placeholder="Mess Rent" CssClass="form-control" Visible="false"></asp:TextBox>
                            </div>
                        </div>
                                <div class="form-group">
                          <asp:Label ID="lblMessPhoto" runat="server" Text="Upload Photo" CssClass="col-lg-4 control-label"></asp:Label>                          
                            <div class="col-lg-8">
                                <asp:FileUpload ID="fuMessPhoto" runat="server" CssClass="form-control" />                           
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-5 col-lg-offset-4">
                                <asp:Button ID="Button4" runat="server" CssClass="btn btn-primary" 
                                    Text="Next" onclick="Button4_Click" />
                            </div>
                        </div>
                        <asp:HiddenField ID="hfMessPhoto" runat="server" />
                                <asp:HiddenField ID="hfDisable" runat="server" /> 
                    </fieldset>
                    <asp:SqlDataSource ID="SqlUploadMess" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        DeleteCommand="DELETE FROM [Hostel] WHERE [HostelId] = @HostelId" 
                        InsertCommand="INSERT INTO [Hostel] ([MessType], [BreakFast], [MessRent], [MessPhoto]) VALUES (@MessType, @BreakFast, @MessRent, @MessPhoto)" 
                        SelectCommand="SELECT [HostelId], [MessType], [BreakFast], [MessRent], [MessPhoto] FROM [Hostel]" 
                        
                        
                        
                        
                        
                        UpdateCommand="UPDATE [Hostel] SET [MessType] = @MessType, [BreakFast] = @BreakFast, [MessRent] = @MessRent, [MessPhoto] = @MessPhoto WHERE [HostelId] = @HostelId">
                        <DeleteParameters>
                            <asp:Parameter Name="HostelId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="MessType" Type="String" />
                            <asp:Parameter Name="BreakFast" Type="String" />
                            <asp:Parameter Name="MessRent" Type="String" />
                            <asp:Parameter Name="MessPhoto" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="rblMessType" Name="MessType" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="rblBreakFast" Name="BreakFast" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="txtMessRent" Name="MessRent" 
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="hfMessPhoto" Name="MessPhoto" 
                                PropertyName="Value" Type="String" />
                            <asp:ControlParameter ControlID="hfHostelId" Name="HostelId" 
                                PropertyName="Value" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
    </asp:Panel>
    <asp:Panel ID="PanelUploadHostel5" runat="server" Visible="False">
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
                         <asp:SqlDataSource ID="SqlDisplayDetails" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            
                            
                            
                            
                            
                            
                            
                            
                            SelectCommand="SELECT Hostel.Name, Hostel.ContactNo1, Hostel.ContactNo2, Hostel.HostelLocation, Hostel.NearestLocation, Hostel.Gender, Hostel.MessFacility, Hostel.BathRoom, Hostel.HotWater, Hostel.Parking, Hostel.Wifi, Hostel.MessType, Hostel.BreakFast, Hostel.MessRent, Hostel.MoreAboutHostel, HostelRoom.NoOfRooms, HostelRoom.PersonInEachRoom, HostelRoom.RentPerHead FROM HostelRoom INNER JOIN Hostel ON HostelRoom.HostelId = Hostel.HostelId WHERE (Hostel.HostelId = @HostelId) AND (Hostel.New = @New)">
                             <SelectParameters>
                                 <asp:ControlParameter ControlID="hfHostelId" Name="HostelId" 
                                     PropertyName="Value" />
                                 <asp:ControlParameter ControlID="hfNew" Name="New" PropertyName="Value" />
                             </SelectParameters>
                        </asp:SqlDataSource>
                         <asp:SqlDataSource ID="SqlDeleteDetails" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            DeleteCommand="DELETE FROM [Hostel] WHERE [HostelId] = @HostelId" 
                            InsertCommand="INSERT INTO [Hostel] ([HostelName], [HostelContactNo], [HostelLocation], [NearestLocation], [Gender], [MessFacility], [Scheme], [UploadPhoto1], [UploadPhoto2], [UploadPhoto3], [BathRoom], [HotWater], [Parking], [Wifi], [MessType], [BreakFast], [MessRent], [MessPhoto], [New], [Counter], [Disable], [UserId], [MoreAboutHostel], [ActivationDate]) VALUES (@HostelName, @HostelContactNo, @HostelLocation, @NearestLocation, @Gender, @MessFacility, @Scheme, @UploadPhoto1, @UploadPhoto2, @UploadPhoto3, @BathRoom, @HotWater, @Parking, @Wifi, @MessType, @BreakFast, @MessRent, @MessPhoto, @New, @Counter, @Disable, @UserId, @MoreAboutHostel, @ActivationDate)" 
                            SelectCommand="SELECT * FROM [Hostel]" 
                            
                            
                            
                            UpdateCommand="UPDATE [Hostel] SET [New] = @New WHERE [HostelId] = @HostelId">
                             <DeleteParameters>
                                 <asp:ControlParameter ControlID="hfHostelId" Name="HostelId" 
                                     PropertyName="Value" Type="Int32" />
                             </DeleteParameters>
                             <InsertParameters>
                                 <asp:Parameter Name="HostelName" Type="String" />
                                 <asp:Parameter Name="HostelContactNo" Type="String" />
                                 <asp:Parameter Name="HostelLocation" Type="String" />
                                 <asp:Parameter Name="NearestLocation" Type="String" />
                                 <asp:Parameter Name="Gender" Type="String" />
                                 <asp:Parameter Name="MessFacility" Type="String" />
                                 <asp:Parameter Name="Scheme" Type="String" />
                                 <asp:Parameter Name="UploadPhoto1" Type="String" />
                                 <asp:Parameter Name="UploadPhoto2" Type="String" />
                                 <asp:Parameter Name="UploadPhoto3" Type="String" />
                                 <asp:Parameter Name="BathRoom" Type="String" />
                                 <asp:Parameter Name="HotWater" Type="String" />
                                 <asp:Parameter Name="Parking" Type="String" />
                                 <asp:Parameter Name="Wifi" Type="String" />
                                 <asp:Parameter Name="MessType" Type="String" />
                                 <asp:Parameter Name="BreakFast" Type="String" />
                                 <asp:Parameter Name="MessRent" Type="String" />
                                 <asp:Parameter Name="MessPhoto" Type="String" />
                                 <asp:Parameter Name="New" Type="String" />
                                 <asp:Parameter Name="Counter" Type="String" />
                                 <asp:Parameter Name="Disable" Type="String" />
                                 <asp:Parameter Name="UserId" Type="String" />
                                 <asp:Parameter Name="MoreAboutHostel" Type="String" />
                                 <asp:Parameter DbType="Date" Name="ActivationDate" />
                             </InsertParameters>
                             <UpdateParameters>
                                 <asp:ControlParameter ControlID="hfNew2" Name="New" PropertyName="Value" />
                                 <asp:ControlParameter ControlID="hfHostelId" Name="HostelId" 
                                     PropertyName="Value" />
                             </UpdateParameters>
                        </asp:SqlDataSource>
                         <asp:SqlDataSource ID="SqlDeleteDetails0" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            DeleteCommand="DELETE FROM [HostelRoom] WHERE [HostelId] = @HostelId" 
                            InsertCommand="INSERT INTO [HostelRoom] ([HostelId], [NoOfRooms], [PersonInEachRoom], [RentPerHead]) VALUES (@HostelId, @NoOfRooms, @PersonInEachRoom, @RentPerHead)" 
                            SelectCommand="SELECT * FROM [HostelRoom]" 
                            UpdateCommand="UPDATE [HostelRoom] SET [HostelId] = @HostelId, [NoOfRooms] = @NoOfRooms, [PersonInEachRoom] = @PersonInEachRoom, [RentPerHead] = @RentPerHead WHERE [SrNo] = @SrNo">
                             <DeleteParameters>
                                 <asp:ControlParameter ControlID="hfHostelId" Name="HostelId" 
                                     PropertyName="Value" />
                             </DeleteParameters>
                             <InsertParameters>
                                 <asp:Parameter Name="HostelId" Type="Int32" />
                                 <asp:Parameter Name="NoOfRooms" Type="Int32" />
                                 <asp:Parameter Name="PersonInEachRoom" Type="Int32" />
                                 <asp:Parameter Name="RentPerHead" Type="Int32" />
                             </InsertParameters>
                             <UpdateParameters>
                                 <asp:Parameter Name="HostelId" Type="Int32" />
                                 <asp:Parameter Name="NoOfRooms" Type="Int32" />
                                 <asp:Parameter Name="PersonInEachRoom" Type="Int32" />
                                 <asp:Parameter Name="RentPerHead" Type="Int32" />
                                 <asp:Parameter Name="SrNo" Type="Int32" />
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
        
                 SelectCommand="SELECT [UploadPhoto1], [UploadPhoto2], [UploadPhoto3], [MessPhoto] FROM [Hostel] WHERE ([HostelId] = @HostelId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfHostelId" Name="HostelId" PropertyName="Value" 
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
