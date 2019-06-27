<%@ Page Title="View My Add" Language="C#" MasterPageFile="~/Services/Tutions/Site1.Master" AutoEventWireup="true" CodeBehind="ViewMyAdd.aspx.cs" Inherits="students1.Services.Tutions.ViewMyAdd" %>
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
    <div class="container">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform"> 
                <div class="form-horizontal">
                    <fieldset>
                    <legend>Tution Information</legend>
                        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDisplayDetails">
                            <ItemTemplate>
                            <table style="font-size:large">
                            <tr><td>
                                <asp:Label runat="server" ID="lblName" Text="Owner Name:" />&nbsp;&nbsp;
                              </td><td>
                                <asp:Label ID="OwnerNameLabel" runat="server" 
                                    Text='<%# Eval("OwnerName") %>' />
                             </td></tr>
                           <tr><td>
                                <asp:Label runat="server" ID="lblTutionName" Text="Tution Name:" />&nbsp;&nbsp;
                            </td><td>
                                <asp:Label ID="TutionLabel" runat="server" 
                                    Text='<%# Eval("TutionName") %>' />
                          </td></tr>
                          <tr><td>
                                <asp:Label runat="server" ID="lblContactNo" Text="Contact No:" />&nbsp;&nbsp;
                               </td><td>
                                <asp:Label ID="ContactNoLabel" runat="server" 
                                    Text='<%# Eval("ContactNo") %>' />
                           </td></tr>
                           <tr><td>
                                <asp:Label runat="server" ID="lblEmailId" Text="EmailId:" />&nbsp;&nbsp;
                            </td><td>
                                <asp:Label ID="EmailIdLabel" runat="server" 
                                    Text='<%# Eval("EmailId") %>'/>
                          </td></tr>
                          <tr><td>
                                <asp:Label runat="server" ID="lblAddress" Text="Address:" />&nbsp;&nbsp;
                             </td><td>
                                <asp:Label ID="AddressLabel" runat="server" 
                                    Text='<%# Eval("Address") %>' />
                            </td></tr>
                             <tr><td>
                                <asp:Label runat="server" ID="lblNearestLocation" Text="Nearest Location:" />&nbsp;&nbsp;
                             </td><td>
                                <asp:Label ID="NearestLocationLabel" runat="server" 
                                    Text='<%# Eval("NearestLocation") %>' />
                              </td></tr></table>
                            </ItemTemplate>
                        </asp:DataList>
                         <asp:SqlDataSource ID="SqlDisplayDetails" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            
                            
                            
                            
                            
                            SelectCommand="SELECT NearestLocation, OwnerName, TutionName, EmailId, ContactNo, State, City, Address FROM Tution WHERE (TutionId = @TutionId)">
                             <SelectParameters>
                                 <asp:QueryStringParameter Name="TutionId" QueryStringField="TutionId" />
                             </SelectParameters>
                        </asp:SqlDataSource>
                        <legend>Subjects</legend><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="SqlSubject" Width="100%">
                            <Columns>
                                <asp:BoundField DataField="Course" HeaderText="Course" 
                                    SortExpression="Course" />
                                <asp:BoundField DataField="Subject" HeaderText="Subject" 
                                    SortExpression="Subject" />
                                <asp:BoundField DataField="Faculty" HeaderText="Faculty" 
                                    SortExpression="Faculty" />
                                <asp:BoundField DataField="BatchTiming" HeaderText="BatchTiming" 
                                    SortExpression="BatchTiming" />
                                <asp:BoundField DataField="Fees" HeaderText="Fees" SortExpression="Fees" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlSubject" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [Course], [Subject], [Faculty], [BatchTiming], [Fees] FROM [Subject] WHERE ([TutionId] = @TutionId)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="TutionId" QueryStringField="TutionId" 
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <legend>Toppers</legend><asp:GridView ID="GridView2" runat="server" 
                                AutoGenerateColumns="False" DataSourceID="SqlTopper" Width="100%">
                            <Columns>
                                 <asp:ImageField DataImageUrlField="Photo" ControlStyle-Width="100"
        ControlStyle-Height = "100" HeaderText = "Photo"></asp:ImageField>
            <asp:BoundField DataField="Details" HeaderText="Details" 
                                    SortExpression="Details" />
                            </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlTopper" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="SELECT [Photo], [Details] FROM [Topper] WHERE ([TutionId] = @TutionId)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="TutionId" QueryStringField="TutionId" 
                                        Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                    </fieldset>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
             <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDisplayTution" > 
    <ItemTemplate>
      <table>
          <tr><td> <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("Photo")%>'
                Width="200px" Height="200px" Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);" />
                </td></tr>
    </table>
        </ItemTemplate> 
    </asp:DataList> 
        
    <asp:SqlDataSource ID="SqlDisplayTution" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [Photo] FROM [Tution] WHERE ([TutionId] = @TutionId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="TutionId" QueryStringField="TutionId" 
                Type="Int32" />
        </SelectParameters>
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
