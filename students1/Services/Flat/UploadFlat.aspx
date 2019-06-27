<%@ Page Title="Upload Flat" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadFlat.aspx.cs" Inherits="students1.Services.Flat.UploadFlat" %>
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
    <asp:Panel ID="PanelUploadFlat1" runat="server">
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <div id="banner">
                
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                         <legend>Flat Information<i class="fa fa-pencil pull-right"></i></legend>
                        <div class="form-group">
                            <asp:Label ID="lblContactNo1" runat="server" Text="Contact No 1" CssClass="col-lg-4 control-label"></asp:Label>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtContactNo1" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtContactNo1" runat="server" CssClass="form-control" placeholder="Contact No 1"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblContactNo2" runat="server" Text="Contact No 2" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtContactNo2" runat="server" CssClass="form-control" placeholder="Contact No 2"></asp:TextBox>
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
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="ddlNearestLocation" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                                                 
                            <div class="col-lg-8">
                                <asp:DropDownList ID="ddlNearestLocation" runat="server" 
                                    CssClass="form-control ddl" DataSourceID="SqlNearestLocation" 
                                    DataTextField="NearestLocation" DataValueField="NearestLocation">
                                    <asp:ListItem Selected="True">--Select Nearest Location--</asp:ListItem>
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
                            <asp:Label ID="lblFlatLocation" runat="server" Text="Flat Location" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtFlatLocation" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                        
                          
                            <div class="col-lg-7">
                                <asp:TextBox ID="txtFlatLocation" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
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
    <asp:Panel ID="PanelUploadFlat2" runat="server" Visible="False">
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <div id="Div1">
                
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                        <legend>Flat Information<i class="fa fa-pencil pull-right"></i></legend>
                         
                        <div class="form-group">
                            <asp:Label ID="lblFlatType" runat="server" Text="Flat Type" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="ddlFlatType" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                        
                          
                            <div class="col-lg-8">
                               <asp:DropDownList ID="ddlFlatType" runat="server" 
                                    CssClass="form-control ddl">
                                  
                                   <asp:ListItem>--Select Flat Type--</asp:ListItem>
                                   <asp:ListItem>1 BHK</asp:ListItem>
                                   <asp:ListItem>2 BHK</asp:ListItem>
                                   <asp:ListItem>3 BHK</asp:ListItem>
                                   <asp:ListItem>4 BHK</asp:ListItem>
                                   <asp:ListItem>5 BHK</asp:ListItem>
                                   </asp:DropDownList>                              
                                
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblBathRoom" runat="server" Text="Bath Room" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="txtBathRoom" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                        
                          
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtBathRoom" runat="server" placeholder="Number of BathRoom" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="lblFloor" runat="server" Text="Floor" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ControlToValidate="txtFloor" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                        
                          
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtFloor" runat="server" placeholder="Floor" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblRent" runat="server" Text="Rent" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                ControlToValidate="txtRent" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                        
                          
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtRent" runat="server" placeholder="Rent Per Month" CssClass="form-control"></asp:TextBox>
                            </div>
                            </div>
                            <div class="form-group">
                            <asp:Label ID="lblSecurityDeposit" runat="server" Text="Security Deposit" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                ControlToValidate="txtSecurityDeposit" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                        
                          
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtSecurityDeposit" runat="server" placeholder="Rupees" CssClass="form-control"></asp:TextBox>
                            </div>
                            </div>
                             <div class="form-group">
                            <asp:Label ID="lblFlatArea" runat="server" Text="Flat Area" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                ControlToValidate="txtFlatArea" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                        
                          
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtFlatArea" runat="server" placeholder="Number of Square feets" CssClass="form-control"></asp:TextBox>
                            </div>
                            </div>
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
                            <asp:Label ID="lblMoreAboutFlat" runat="server" Text="More About Flat" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtMoreAboutFlat" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
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
    <asp:SqlDataSource ID="SqlUploadFlat" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    DeleteCommand="DELETE FROM [Flat] WHERE [FlatId] = @FlatId" 
                                    InsertCommand="INSERT INTO Flat(OwnerName, ContactNo1, ContactNo2, FlatLocation, NearestLocation, UploadPhoto1, UploadPhoto2, UploadPhoto3, FlatType, BathRoom, Floor, Rent, SecurityDeposit, FlatArea, LightBill, Parking, MoreAboutFlat, Status, Counter, Confirm, Disable, New, Gender, UserId, City, State) VALUES (@OwnerName, @ContactNo1, @ContactNo2, @FlatLocation, @NearestLocation, @UploadPhoto1, @UploadPhoto2, @UploadPhoto3, @FlatType, @BathRoom, @Floor, @Rent, @SecurityDeposit, @FlatArea, @LightBill, @Parking, @MoreAboutFlat, @Status, @Counter, @Confirm, @Disable, @New, @Gender, @UserId, @City, @State)" 
                                    SelectCommand="SELECT FlatId FROM Flat WHERE (OwnerName = @OwnerName) AND (New = @New)" 
                                    
        
        
        
            
            
            
            
            
            
            
            
            
            UpdateCommand="UPDATE [Flat] SET [OwnerName] = @OwnerName, [ContactNo1] = @ContactNo1, [ContactNo2] = @ContactNo2, [FlatLocation] = @FlatLocation, [NearestLocation] = @NearestLocation, [UploadPhoto1] = @UploadPhoto1, [UploadPhoto2] = @UploadPhoto2, [UploadPhoto3] = @UploadPhoto3, [FlatType] = @FlatType, [BathRoom] = @BathRoom, [Floor] = @Floor, [Rent] = @Rent, [SecurityDeposit] = @SecurityDeposit, [FlatArea] = @FlatArea, [LightBill] = @LightBill, [Parking] = @Parking, [MoreAboutFlat] = @MoreAboutFlat, [Status] = @Status, [Counter] = @Counter, [Confirm] = @Confirm, [Disable] = @Disable, [New] = @New WHERE [FlatId] = @FlatId">
        <DeleteParameters>
            <asp:Parameter Name="FlatId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:SessionParameter Name="OwnerName" SessionField="Name" Type="String" />
            <asp:SessionParameter Name="ContactNo1" SessionField="ContactNo1" 
                Type="String" />
            <asp:SessionParameter Name="ContactNo2" SessionField="ContactNo2" 
                Type="String" />
            <asp:SessionParameter Name="FlatLocation" SessionField="FlatLocation" 
                Type="String" />
            <asp:SessionParameter Name="NearestLocation" SessionField="NearestLocation" 
                Type="String" />
            <asp:SessionParameter Name="UploadPhoto1" SessionField="UploadPhoto1" 
                Type="String" />
            <asp:SessionParameter Name="UploadPhoto2" SessionField="UploadPhoto2" 
                Type="String" />
            <asp:SessionParameter Name="UploadPhoto3" SessionField="UploadPhoto3" 
                Type="String" />
            <asp:SessionParameter Name="FlatType" SessionField="FlatType" Type="String" />
            <asp:SessionParameter Name="BathRoom" SessionField="BathRoom" Type="String" />
            <asp:SessionParameter Name="Floor" SessionField="Floor" Type="String" />
            <asp:SessionParameter Name="Rent" SessionField="Rent" Type="String" />
            <asp:SessionParameter Name="SecurityDeposit" SessionField="SecurityDeposit" 
                Type="String" />
            <asp:SessionParameter Name="FlatArea" SessionField="FlatArea" Type="String" />
            <asp:SessionParameter Name="LightBill" SessionField="LightBill" Type="String" />
            <asp:SessionParameter Name="Parking" SessionField="Parking" Type="String" />
            <asp:SessionParameter Name="MoreAboutFlat" SessionField="MoreAboutFlat" 
                Type="String" />
            <asp:ControlParameter ControlID="hfStatus" Name="Status" PropertyName="Value" 
                Type="String" />
            <asp:ControlParameter ControlID="hfCounter" Name="Counter" PropertyName="Value" 
                Type="String" />
            <asp:ControlParameter ControlID="hfConfirm" Name="Confirm" PropertyName="Value" 
                Type="String" />
            <asp:ControlParameter ControlID="hfNo" Name="Disable" PropertyName="Value" 
                Type="String" />
            <asp:ControlParameter ControlID="hfNew" Name="New" PropertyName="Value" 
                Type="String" />
            <asp:SessionParameter Name="Gender" SessionField="FlatGender" />
            <asp:SessionParameter Name="UserId" SessionField="UserId" />
            <asp:SessionParameter Name="City" SessionField="City" />
            <asp:SessionParameter Name="State" SessionField="State" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="OwnerName" SessionField="OwnerName" />
            <asp:ControlParameter ControlID="hfNew" Name="New" PropertyName="Value" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="OwnerName" Type="String" />
            <asp:Parameter Name="ContactNo1" Type="String" />
            <asp:Parameter Name="ContactNo2" Type="String" />
            <asp:Parameter Name="FlatLocation" Type="String" />
            <asp:Parameter Name="NearestLocation" Type="String" />
            <asp:Parameter Name="UploadPhoto1" Type="String" />
            <asp:Parameter Name="UploadPhoto2" Type="String" />
            <asp:Parameter Name="UploadPhoto3" Type="String" />
            <asp:Parameter Name="FlatType" Type="String" />
            <asp:Parameter Name="BathRoom" Type="String" />
            <asp:Parameter Name="Floor" Type="String" />
            <asp:Parameter Name="Rent" Type="String" />
            <asp:Parameter Name="SecurityDeposit" Type="String" />
            <asp:Parameter Name="FlatArea" Type="String" />
            <asp:Parameter Name="LightBill" Type="String" />
            <asp:Parameter Name="Parking" Type="String" />
            <asp:Parameter Name="MoreAboutFlat" Type="String" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Counter" Type="String" />
            <asp:Parameter Name="Confirm" Type="String" />
            <asp:Parameter Name="Disable" Type="String" />
            <asp:Parameter Name="New" Type="String" />
            <asp:Parameter Name="FlatId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:HiddenField ID="hfStatus" runat="server" />

        <asp:HiddenField ID="hfNo" runat="server" />

        <asp:HiddenField ID="hfNew" runat="server" />

    <asp:HiddenField ID="hfConfirm" runat="server" />

    <asp:HiddenField ID="hfCounter" runat="server" />

     <asp:HiddenField ID="hfFlatId" runat="server" />
    </asp:Panel>
    <asp:Panel ID="PanelUploadFlat3" runat="server" Visible="False">
    <div class="container">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
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
                            
                            
                            
                            
                            
                            
                            SelectCommand="SELECT [OwnerName], [ContactNo1], [ContactNo2], [FlatLocation], [Gender], [NearestLocation], [FlatType], [BathRoom], [Floor], [Rent], [SecurityDeposit], [FlatArea], [LightBill], [Parking], [MoreAboutFlat] FROM [Flat] WHERE (([FlatId] = @FlatId) AND ([New] = @New))">
                             <SelectParameters>
                                 <asp:ControlParameter ControlID="hfFlatId" Name="FlatId" PropertyName="Value" 
                                     Type="Int32" />
                                 <asp:ControlParameter ControlID="hfNew" Name="New" PropertyName="Value" 
                                     Type="String" />
                             </SelectParameters>
                        </asp:SqlDataSource>
                         <asp:SqlDataSource ID="SqlDeleteDetails" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            DeleteCommand="DELETE FROM Flat WHERE (FlatId = @FlatId)" 
                            InsertCommand="INSERT INTO [Room] ([Date], [RoomLocation], [NearestLocation], [NoOfPerson], [RentPerHead], [Gender], [UploadPhoto1], [UploadPhoto2], [UploadPhoto3], [LightBill], [BathRoom], [HotWater], [Cooking], [Parking], [Wifi], [MoreAboutRoom], [UserId], [Status], [Counter], [Confirm]) VALUES (@Date, @RoomLocation, @NearestLocation, @NoOfPerson, @RentPerHead, @Gender, @UploadPhoto1, @UploadPhoto2, @UploadPhoto3, @LightBill, @BathRoom, @HotWater, @Cooking, @Parking, @Wifi, @MoreAboutRoom, @UserId, @Status, @Counter, @Confirm)" 
                            SelectCommand="SELECT * FROM [Room]" 
                            
                            
                            UpdateCommand="UPDATE Flat SET New = @New WHERE (FlatId = @FlatId)">
                             <DeleteParameters>
                                 <asp:ControlParameter ControlID="hfFlatId" Name="FlatId" PropertyName="Value" />
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
                                 <asp:ControlParameter ControlID="hfNew2" Name="New" PropertyName="Value" />
                                 <asp:ControlParameter ControlID="hfFlatId" Name="FlatId" PropertyName="Value" />
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
            <asp:ControlParameter ControlID="hfFlatId" Name="FlatId" PropertyName="Value" />
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

