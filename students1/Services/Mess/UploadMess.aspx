<%@ Page Title="Upload Mess" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadMess.aspx.cs" Inherits="students1.Services.Mess.UploadMess" %>
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
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="PanelUploadMess1" runat="server">
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <div id="banner">
                
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                         <legend>Mess Information<i class="fa fa-pencil pull-right"></i></legend>
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
                            <asp:Label ID="lblMessLocation" runat="server" Text="Mess Location" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtMessLocation" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            
                            <div class="col-lg-7">
                                <asp:TextBox ID="txtMessLocation" runat="server" TextMode="MultiLine" Rows="3" 
                                    CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblMonthlyPrice" runat="server" Text="Monthly Price" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="txtMonthlyPrice" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtMonthlyPrice" runat="server" placeholder="Monthly Price" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="lblTiffinFacility" runat="server" Text="Tiffin Facility" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblTiffinFacility" runat="server">
                                            <asp:ListItem Selected="True">Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
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
                            <asp:Label ID="lblScheme" runat="server" Text="Scheme" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblScheme" runat="server">
                                            <asp:ListItem Selected="True" Value="3 Months">Rs&nbsp;99&nbsp;for&nbsp;3&nbsp;Months</asp:ListItem>
                                            <asp:ListItem Value="6 Months">Rs&nbsp;149&nbsp;for&nbsp;5&nbsp;Months</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
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
                                <asp:HiddenField ID="hfCounter" runat="server" /> 
                                <asp:HiddenField ID="hfDisable" runat="server" /> 
                    </fieldset>
                    <asp:SqlDataSource ID="SqlUploadMess" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        DeleteCommand="DELETE FROM [Mess] WHERE [MessId] = @MessId" 
                        InsertCommand="INSERT INTO Mess(TiffinFacility, MonthlyPrice, NearestLocation, MessLocation, MessType, UserId, UploadPhoto1, UploadPhoto2, New, Counter, Disable, Scheme, Name, ContactNo1, ContactNo2, State, City) VALUES (@TiffinFacility, @MonthlyPrice, @NearestLocation, @MessLocation, @MessType, @UserId, @UploadPhoto1, @UploadPhoto2, @New, @Counter, @Disable, @Scheme, @Name, @ContactNo1, @ContactNo2, @State, @City)" 
                        SelectCommand="SELECT MessId FROM Mess WHERE (UserId = @UserId) AND (New = @New)" 
                        
                        
                        
                        
                        
                        
                        UpdateCommand="UPDATE [Mess] SET [TiffinFacility] = @TiffinFacility, [MonthlyPrice] = @MonthlyPrice, [NearestLocation] = @NearestLocation, [MessLocation] = @MessLocation, [MessType] = @MessType, [Date] = @Date, [UserId] = @UserId WHERE [MessId] = @MessId">
                        <DeleteParameters>
                            <asp:Parameter Name="MessId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:SessionParameter Name="TiffinFacility" SessionField="TiffinFacility" 
                                Type="String" />
                            <asp:SessionParameter Name="MonthlyPrice" SessionField="MonthlyPrice" 
                                Type="String" />
                            <asp:SessionParameter Name="NearestLocation" SessionField="NearestLocation" 
                                Type="String" />
                            <asp:SessionParameter Name="MessLocation" SessionField="MessLocation" 
                                Type="String" />
                            <asp:SessionParameter Name="MessType" SessionField="MessType" Type="String" />
                            <asp:SessionParameter Name="UserId" SessionField="UserId" Type="String" />
                            <asp:ControlParameter ControlID="hfNew" Name="New" PropertyName="Value" />
                            <asp:SessionParameter Name="UploadPhoto1" SessionField="UploadPhoto1" />
                            <asp:SessionParameter Name="UploadPhoto2" SessionField="UploadPhoto2" />
                            <asp:SessionParameter Name="Counter" SessionField="Counter" />
                            <asp:SessionParameter Name="Disable" SessionField="Disable" />
                            <asp:SessionParameter Name="Scheme" SessionField="Scheme" />
                            <asp:SessionParameter Name="Name" SessionField="Name" />
                            <asp:SessionParameter Name="ContactNo1" SessionField="ContactNo1" />
                            <asp:SessionParameter Name="ContactNo2" SessionField="ContactNo2" />
                            <asp:SessionParameter Name="State" SessionField="State" />
                            <asp:SessionParameter Name="City" SessionField="City" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="UserId" SessionField="UserId" />
                            <asp:ControlParameter ControlID="hfNew" Name="New" PropertyName="Value" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="TiffinFacility" Type="String" />
                            <asp:Parameter Name="MonthlyPrice" Type="String" />
                            <asp:Parameter Name="NearestLocation" Type="String" />
                            <asp:Parameter Name="MessLocation" Type="String" />
                            <asp:Parameter Name="MessType" Type="String" />
                            <asp:Parameter DbType="Date" Name="Date" />
                            <asp:Parameter Name="UserId" Type="String" />
                            <asp:Parameter Name="MessId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
    </asp:Panel>
    <asp:Panel ID="PanelUploadMess2" runat="server" Visible="False">
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <div id="Div1">
                
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                        <legend>Tiffin Facility<i class="fa fa-pencil pull-right"></i></legend>
                        <legend>Full Tiffin</legend>
                        <div class="form-group">
                            <asp:Label ID="lblChapati" runat="server" Text="Chapati" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                ControlToValidate="txtChapati" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtChapati" runat="server" placeholder="Number of Chapati" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblSabji" runat="server" Text="Sabji" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                ControlToValidate="txtSabji" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtSabji" runat="server" placeholder="Number of Sabji" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblRice" runat="server" Text="Rice" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblRice" runat="server">
                                            <asp:ListItem Selected="True">Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblDal" runat="server" Text="Dal" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblDal" runat="server">
                                            <asp:ListItem Selected="True">Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblSalad" runat="server" Text="Salad" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblSalad" runat="server">
                                            <asp:ListItem Selected="True">Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="lblMonthlyPrice1" runat="server" Text="Monthly Price" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                ControlToValidate="txtMonthlyPrice1" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtMonthlyPrice1" runat="server" placeholder="Monthly Price" CssClass="form-control"></asp:TextBox>
                                
                            </div>
                        </div>
                        <legend>Half Tiffin</legend>
                        <div class="form-group">
                            <asp:Label ID="lblChapati1" runat="server" Text="Chapati" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                ControlToValidate="txtChapati1" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtChapati1" runat="server" placeholder="Number of Chapati" CssClass="form-control"></asp:TextBox>
                                
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblSabji1" runat="server" Text="Sabji" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                ControlToValidate="txtSabji1" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtSabji1" runat="server" placeholder="Number of Sabji" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblRice1" runat="server" Text="Rice" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblRice1" runat="server">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblDal1" runat="server" Text="Dal" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblDal1" runat="server">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblSalad1" runat="server" Text="Salad" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblSalad1" runat="server">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="lblMonthlyPrice2" runat="server" Text="Monthly Price" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                ControlToValidate="txtMonthlyPrice2" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtMonthlyPrice2" runat="server" placeholder="Monthly Price" CssClass="form-control"></asp:TextBox>
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

    <asp:SqlDataSource ID="SqlUploadMess1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    DeleteCommand="DELETE FROM [Mess] WHERE [MessId] = @MessId" 
                                    InsertCommand="INSERT INTO Mess(UserId, MessType, MessLocation, NearestLocation, MonthlyPrice, TiffinFacility, FullChapati, FullSabji, FullRice, FullDal, FullSalad, FullMonthlyPrice, HalfChapati, Halfsabji, HalfRice, HalfDal, HalfSalad, HalfMonthlyPrice, New, UploadPhoto1, UploadPhoto2, Scheme, Disable, Counter, Name, ContactNo1, ContactNo2, State, City) VALUES (@UserId, @MessType, @MessLocation, @NearestLocation, @MonthlyPrice, @TiffinFacility, @FullChapati, @FullSabji, @FullRice, @FullDal, @FullSalad, @FullMonthlyPrice, @HalfChapati, @Halfsabji, @HalfRice, @HalfDal, @HalfSalad, @HalfMonthlyPrice, @New, @UploadPhoto1, @UploadPhoto2, @Scheme, @Disable, @Counter, @Name, @ContactNo1, @ContactNo2, @State, @City)" 
                                    SelectCommand="SELECT * FROM [Mess]" 
                                    
        
        
        
            
            
            
            
            
            
            
            
            UpdateCommand="UPDATE [Mess] SET [UserId] = @UserId, [Date] = @Date, [MessType] = @MessType, [MessLocation] = @MessLocation, [NearestLocation] = @NearestLocation, [MonthlyPrice] = @MonthlyPrice, [TiffinFacility] = @TiffinFacility, [FullChapati] = @FullChapati, [FullSabji] = @FullSabji, [FullRice] = @FullRice, [FullDal] = @FullDal, [FullSalad] = @FullSalad, [FullMonthlyPrice] = @FullMonthlyPrice, [HalfChapati] = @HalfChapati, [Halfsabji] = @Halfsabji, [HalfRice] = @HalfRice, [HalfDal] = @HalfDal, [HalfSalad] = @HalfSalad, [HalfMonthlyPrice] = @HalfMonthlyPrice, [New] = @New WHERE [MessId] = @MessId">
        <DeleteParameters>
            <asp:Parameter Name="MessId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:SessionParameter Name="UserId" SessionField="UserId" Type="String" />
            <asp:SessionParameter Name="MessType" SessionField="MessType" Type="String" />
            <asp:SessionParameter Name="MessLocation" SessionField="MessLocation" 
                Type="String" />
            <asp:SessionParameter Name="NearestLocation" SessionField="NearestLocation" 
                Type="String" />
            <asp:SessionParameter Name="MonthlyPrice" SessionField="MonthlyPrice" 
                Type="String" />
            <asp:SessionParameter Name="TiffinFacility" SessionField="TiffinFacility" 
                Type="String" />
            <asp:SessionParameter Name="FullChapati" SessionField="FullChapati" 
                Type="String" />
            <asp:SessionParameter Name="FullSabji" SessionField="FullSabji" Type="String" />
            <asp:SessionParameter Name="FullRice" SessionField="FullRice" Type="String" />
            <asp:SessionParameter Name="FullDal" SessionField="FullDal" Type="String" />
            <asp:SessionParameter Name="FullSalad" SessionField="FullSalad" Type="String" />
            <asp:SessionParameter Name="FullMonthlyPrice" SessionField="FullMonthlyPrice" 
                Type="String" />
            <asp:SessionParameter Name="HalfChapati" SessionField="HalfChapati" 
                Type="String" />
            <asp:SessionParameter Name="Halfsabji" SessionField="Halfsabji" Type="String" />
            <asp:SessionParameter Name="HalfRice" SessionField="HalfRice" Type="String" />
            <asp:SessionParameter Name="HalfDal" SessionField="HalfDal" Type="String" />
            <asp:ControlParameter ControlID="rblSalad1" Name="HalfSalad" 
                PropertyName="SelectedValue" Type="String" />
            <asp:SessionParameter Name="HalfMonthlyPrice" SessionField="HalfMonthlyPrice" 
                Type="String" />
            <asp:ControlParameter ControlID="hfNew" Name="New" PropertyName="Value" 
                Type="String" />
            <asp:SessionParameter Name="UploadPhoto1" SessionField="UploadPhoto1" />
            <asp:SessionParameter Name="UploadPhoto2" SessionField="UploadPhoto2" />
            <asp:SessionParameter Name="Scheme" SessionField="Scheme" />
            <asp:SessionParameter Name="Disable" SessionField="Disable" />
            <asp:SessionParameter Name="Counter" SessionField="Counter" />
            <asp:SessionParameter Name="Name" SessionField="Name" />
            <asp:SessionParameter Name="ContactNo1" SessionField="ConactNo1" />
            <asp:SessionParameter Name="ContactNo2" SessionField="ContactNo2" />
            <asp:SessionParameter Name="State" SessionField="State" />
            <asp:SessionParameter Name="City" SessionField="City" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="Date" DbType="Date" />
            <asp:Parameter Name="MessType" Type="String" />
            <asp:Parameter Name="MessLocation" Type="String" />
            <asp:Parameter Name="NearestLocation" Type="String" />
            <asp:Parameter Name="MonthlyPrice" Type="String" />
            <asp:Parameter Name="TiffinFacility" Type="String" />
            <asp:Parameter Name="FullChapati" Type="String" />
            <asp:Parameter Name="FullSabji" Type="String" />
            <asp:Parameter Name="FullRice" Type="String" />
            <asp:Parameter Name="FullDal" Type="String" />
            <asp:Parameter Name="FullSalad" Type="String" />
            <asp:Parameter Name="FullMonthlyPrice" Type="String" />
            <asp:Parameter Name="HalfChapati" Type="String" />
            <asp:Parameter Name="Halfsabji" Type="String" />
            <asp:Parameter Name="HalfRice" Type="String" />
            <asp:Parameter Name="HalfDal" Type="String" />
            <asp:Parameter Name="HalfSalad" Type="String" />
            <asp:Parameter Name="HalfMonthlyPrice" Type="String" />
            <asp:Parameter Name="New" Type="String" />
            <asp:Parameter Name="MessId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

        <asp:HiddenField ID="hfNew" runat="server" />

     <asp:HiddenField ID="hfMessId" runat="server" />
    </asp:Panel>
    <asp:Panel ID="PanelUploadMess3" runat="server" Visible="False">
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
                                 <asp:ControlParameter ControlID="hfMessId" Name="MessId" PropertyName="Value" 
                                     Type="Int32" />
                             </SelectParameters>
                        </asp:SqlDataSource>
                         <asp:SqlDataSource ID="SqlDeleteDetails" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            DeleteCommand="DELETE FROM Mess WHERE (MessId = @MessId)" 
                            InsertCommand="INSERT INTO [Room] ([Date], [RoomLocation], [NearestLocation], [NoOfPerson], [RentPerHead], [Gender], [UploadPhoto1], [UploadPhoto2], [UploadPhoto3], [LightBill], [BathRoom], [HotWater], [Cooking], [Parking], [Wifi], [MoreAboutRoom], [UserId], [Status], [Counter], [Confirm]) VALUES (@Date, @RoomLocation, @NearestLocation, @NoOfPerson, @RentPerHead, @Gender, @UploadPhoto1, @UploadPhoto2, @UploadPhoto3, @LightBill, @BathRoom, @HotWater, @Cooking, @Parking, @Wifi, @MoreAboutRoom, @UserId, @Status, @Counter, @Confirm)" 
                            SelectCommand="SELECT * FROM [Room]" 
                            
                            
                            UpdateCommand="UPDATE Mess SET New = @New WHERE (MessId = @MessId)">
                             <DeleteParameters>
                                 <asp:ControlParameter ControlID="hfMessId" Name="MessId" PropertyName="Value" />
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
                                 <asp:ControlParameter ControlID="hfMessId" Name="MessId" PropertyName="Value" />
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
             <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDisplayMess" > 
    <ItemTemplate>
      <table>
          <tr><td> <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("UploadPhoto1")%>'
                Width="100px" Height="100px" Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);" />
                </td></tr>
               <tr><td> <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl='<%# Eval("UploadPhoto2")%>'
                Width="100px" Height="100px" Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);" />
                </td></tr>
    </table>
        </ItemTemplate> 
    </asp:DataList> 
        
    <asp:SqlDataSource ID="SqlDisplayMess" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
                 SelectCommand="SELECT UploadPhoto1, UploadPhoto2 FROM Mess WHERE (MessId = @MessId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfMessId" Name="MessId" PropertyName="Value" />
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
