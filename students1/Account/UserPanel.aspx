<%@ Page Title="User Panel" Language="C#" AutoEventWireup="true" CodeBehind="UserPanel.aspx.cs" Inherits="students1.Account.UserPanel" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Home</title>
    <link href="../Styles/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/style.css" rel="stylesheet" type="text/css" />
    <!-- for feedback slider -->
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
     <link href="../Styles/feedbackslider/slicebox.css" rel="stylesheet" type="text/css" />   
    <link href="../Styles/feedbackslider/animate.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/feedbackslider/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/feedbackslider/main.css" rel="stylesheet" type="text/css" />    
    <link href="../Styles/feedbackslider/responsive.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/feedbackslider/font-awesome.css" rel="stylesheet" type="text/css" />
    <!-- for feedback slider -->
   <!-- for image slider -->
    <link href="../Styles/imageslider/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/imageslider/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/imageslider/animate.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/imageslider/prettyPhoto.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/imageslider/main.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/imageslider/responsive.css" rel="stylesheet" type="text/css" />
    <!-- #for image slider -->

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
<meta charset="utf-8" />
    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Room in Amravati, Hostel in Amravati, Amravati, Mess in Amravati, Tution in Amravati, startup, roommate, chat, live discussion, students, online" />
    </head>
    <body>
    <form id="form1" runat="server">
    <div style="width:100%;background-color:White">
        <div id="custom-bootstrap-menu" class="navbar navbar-default" role="navigation">
            <table width="100%"><tr><td align="center"><asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="~/Index.aspx"><asp:Image ID="Image2" runat="server" Height="100px" Width="120px" ImageUrl="~/images/logo.png" /></asp:HyperLink>
        </td><td align="right">
            <div class="collapse navbar-collapse navbar-menubuilder" align="right">
               <asp:Panel ID="PanelLogin" runat="server">
            <asp:HyperLink ID="HyperLink19" runat="server" NavigateUrl="~/Account/Login.aspx" ForeColor="#4782BA">
                <asp:Label ID="Label1" runat="server" Text="Login" Font-Bold="true" Font-Size="Larger"></asp:Label></asp:HyperLink>
        </asp:Panel>
        <asp:Panel ID="PanelLogout" runat="server" Visible="false">
        <table><tr><td>
            <asp:Label ID="Label2" runat="server" Text="Welcome" Font-Bold="true" Font-Size="Medium" ForeColor="#4782BA"></asp:Label>&nbsp;</td><td>
            <asp:Label ID="lblName" runat="server" Text="" Font-Bold="true" Font-Size="Medium" ForeColor="#4782BA"></asp:Label></td></tr>
            <tr><td colspan="2">
            <asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="~/Account/UserPanel.aspx" ForeColor="#4782BA"><asp:Label ID="Label3" runat="server" Font-Size="Medium" Text="My DashBoard" Font-Bold="true"></asp:Label></asp:HyperLink></td></tr>
            <tr><td><asp:HyperLink ID="HyperLink18" runat="server" NavigateUrl="~/Account/Notifications.aspx" ForeColor="#4782BA"><asp:Label ID="Label6" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label><asp:Label ID="Label5" runat="server" Text="" ForeColor="Red"></asp:Label></asp:HyperLink></td></tr><tr><td>
            <asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="~/Account/Logout.aspx" ForeColor="#4782BA"><asp:Label ID="Label4" runat="server" Font-Size="Medium" Text="LogOut" Font-Bold="true"></asp:Label></asp:HyperLink>
       </td></tr></table> </asp:Panel>
       <asp:SqlDataSource
                    ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    SelectCommand="SELECT COUNT(SenderUser) AS Expr1 FROM Chatter WHERE (ReceiverUser = @ReceiverUser) AND (Status = @Status)">
                    <SelectParameters>
                        <asp:SessionParameter Name="ReceiverUser" SessionField="UserId" Type="String" />
                        <asp:ControlParameter ControlID="HiddenField1" Name="Status" 
                            PropertyName="Value" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:HiddenField ID="HiddenField1" runat="server" />
            </div>
            </td></tr></table>
        <div class="container">
            <div class="navbar-header">
                
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span>
                </button>
            </div>
        </div>
    </div>
    </div>
    <div class="container" style="background-color:White;width:100%;">
            <div class="collapse navbar-collapse navbar-menubuilder" align="center">
                <asp:Menu ID="Menu2" runat="server" Orientation="Horizontal">
                    <Items>
                        <asp:MenuItem Text="Home" Value="Home" NavigateUrl="~/Index.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="About Us" Value="About Us" NavigateUrl="~/AboutUs.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Contact Us" Value="Contact Us"></asp:MenuItem>
                        <asp:MenuItem Text="Services" Value="Services" NavigateUrl="~/Index.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="FAQs" Value="FAQs" NavigateUrl="~/FAQs.aspx"></asp:MenuItem>
                    </Items>
                    <StaticHoverStyle BackColor="#4782BA" ForeColor="White" />
                    <StaticMenuItemStyle Font-Bold="True" Font-Names="Verdana" 
                        Font-Size="Small" ForeColor="Black" HorizontalPadding="20px" Width="200px" />
                </asp:Menu>
               
            </div>
        </div>
    <table width="100%" cellspacing="20" border="12px" style="border-color:White;border-bottom:0px; border-top:0px">
<tr valign="top">
<td style="width:150px;background-color:#4782BA">
<center>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlPhoto">
    <ItemTemplate>
        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Photo") %>' width="120px" />
                </ItemTemplate>
    </asp:DataList>
    </center>
    <asp:SqlDataSource ID="SqlPhoto" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT Photo, ContactNo FROM Users WHERE (ContactNo = @ContactNo)">
        <SelectParameters>
            <asp:SessionParameter Name="ContactNo" SessionField="UserId" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
                    <asp:Menu ID="Menu1" runat="server">
                    <Items>
                    <asp:MenuItem Text="View Profile" Value="View Profile" 
                             NavigateUrl="~/Account/Profile.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Find Roommate" Value="Find Roommate" 
                             NavigateUrl="~/Services/ChatRoom/AddUser.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Password Settings" Value="Password Settings" 
                            NavigateUrl="~/Account/PasswordSettings.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Security Question" Value="Security Question" 
                           NavigateUrl="~/Account/ChangeSecurity.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="FeedBack" Value="FeedBack" 
                          NavigateUrl="~/Account/FeedBack.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="My Uploads" Value="My Uploads" 
                            NavigateUrl="~/Account/MyUploads.aspx"></asp:MenuItem>
                    </Items>
                    <StaticHoverStyle BackColor="#4782BA" ForeColor="Black" />
                    <StaticMenuItemStyle BackColor="#4782BA" BorderColor="White" 
                        BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Verdana" 
                        Font-Size="Small" ForeColor="white" HorizontalPadding="20px" Width="200px" />
                </asp:Menu>
           
</td>
<td>
<section id="feature">
        <div class="container">
            <div class="row">
                <div class="features">
                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Services/Comments/CommentTopic.aspx"><i class="fa fa-comments-o"></i></asp:HyperLink>
                            <h2 style="color:White;">Live Discussions</h2>
                            <h3 style="color:White;">Introduce your Thought Provoking Ideas with Everyone</h3>
                        </div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Services/Blogs/BlogsList.aspx"><i class="fa fa-user"></i></asp:HyperLink>
                            <h2 style="color:White;">Blogs</h2>
                            <h3 style="color:White;">Read Inspiring Thoughts of Well-Known Personlaties</h3>
                        </div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Services/Offers/Sample.aspx"><i class="fa fa-search"></i></asp:HyperLink>
                            <h2 style="color:White;">Offers</h2>
                            <h3 style="color:White;">Get Exclusive Offers and Discount on Every Service</h3>
                        </div>
                    </div><!--/.col-md-4-->
                </div><!--/.services-->
            </div><!--/.row-->    
        </div><!--/.container-->
    </section>
    <!--/#feature-->
    <hr style="color:White;height:-12px;box-shadow:0px 0px 3px blue" />
        <section id="feature">
        <div class="container">
           <div class="center wow fadeInDown">
                <b><h2 style="color:White;">Searching Services</h2></b>
               </div>
            <div class="row">
                <div class="features">
                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                           <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Services/Room/SearchRoom.aspx"><i class="fa fa-search"></i></asp:HyperLink> 
                            <h2 style="color:White">Rooms</h2>
                            <h3 style="color:White">Find the Perfect Room near your College without Hunting Manually</h3>
                        </div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Services/Mess/SearchMess.aspx"><i class="fa fa-search"></i></asp:HyperLink>
                            <h2 style="color:White">Mess</h2>
                            <h3 style="color:White">Now eat most rated, delicious food</h3>
                        </div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Services/Flat/SearchFlat.aspx"><i class="fa fa-search"></i></asp:HyperLink>
                            <h2 style="color:White">Flats</h2>
                            <h3 style="color:White">Shift your friends into Lavish Flat System</h3>
                        </div>
                    </div><!--/.col-md-4-->
                
                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/Services/Hostel/SearchHostel.aspx"><i class="fa fa-search"></i></asp:HyperLink>
                            <h2 style="color:White">Hostels</h2>
                            <h3 style="color:White">Find Properly Structured Hostel with all facilities</h3>
                        </div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/Services/Tution/SearchTution.aspx"><i class="fa fa-search"></i></asp:HyperLink>                            
                            <h2 style="color:White">Tutions</h2>
                            <h3 style="color:White">Search Tutorials of all Subjects on your Finger Tip</h3>
                        </div>
                    </div><!--/.col-md-4-->
                </div><!--/.services-->
            </div><!--/.row-->    
        </div><!--/.container-->
    </section><hr style="color:White;height:-12px;box-shadow:0px 0px 3px blue" />
    <!--/#feature--><section id="feature">
        <div class="container">
           <div class="center wow fadeInDown">
                <b><h2 style="color:White">Uploading Services</h2></b>
                </div>
            <div class="row">
                <div class="features">
                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/Services/Room/UploadRoom.aspx"><i class="fa fa-upload"></i></asp:HyperLink>
                            <h2 style="color:White">Rooms</h2>
                            <h3 style="color:White">Show your Room to only needy Students without Getting Disturbed</h3>
                        </div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/Services/Mess/UploadMess.aspx"><i class="fa fa-upload"></i></asp:HyperLink>
                            <h2 style="color:White">Mess</h2>
                            <h3 style="color:White">Introduce your delicious food with Students</h3>
                        </div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="~/Services/Flat/UploadFlat.aspx"><i class="fa fa-upload"></i></asp:HyperLink>
                            <h2 style="color:White">Flats</h2>
                            <h3 style="color:White">Find Tenants for your Flat in easy way</h3>
                        </div>
                    </div><!--/.col-md-4-->
                
                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="~/Services/Hostel/UploadHostel.aspx"><i class="fa fa-upload"></i></asp:HyperLink>
                            <h2 style="color:White">Hostels</h2>
                            <h3 style="color:White">Now none of your Hostel Room will remain vacant</h3>
                        </div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="~/Services/Tution/UploadTution.aspx"><i class="fa fa-upload"></i></asp:HyperLink>
                            <h2 style="color:White">Tutions</h2>
                            <h3 style="color:White">Publish your advertise in simple step at exact Mob</h3>
                        </div>
                    </div><!--/.col-md-4-->
                </div><!--/.services-->
            </div><!--/.row-->    
        </div><!--/.container-->
    </section>
    <hr style="color:White;height:-12px;box-shadow:0px 0px 3px blue" /></td>
</tr>
</table>
<div style="width: 100%;background-color: #4782BA;padding-top: 40px;padding-bottom: 40px;border-bottom-style: solid;border-top-width: 1px;border-top-color: #666666;border-bottom-width: 1px;border-bottom-color: #666666;" class="wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
        <marquee BEHAVIOR="ALTERNATE" SCROLLAMOUNT="10"><asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDisplayAds" RepeatDirection="Horizontal">
        <ItemTemplate>
       <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("Photo")%>'
                Width="200px" Height="150px" Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);" />&nbsp;&nbsp;&nbsp;
        </ItemTemplate>
        </asp:DataList></marquee>
        <asp:SqlDataSource ID="SqlDisplayAds" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT Photo FROM HomePageAds WHERE (Location = @Location)">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfLocation" Name="Location" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="hfLocation" runat="server" />
    </div>
<div class="panel-footer" style="background-color:White;border-top-width:thin">
  <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    &copy; 2017 <b>studzer.com</b> All Rights Reserved.
                </div>
                <div class="col-sm-6">
                    <ul class="pull-right">
                        <li><div class="top-number"><p><i class="fa fa-thumbs-up"></i> Keep In Touch </p></div></li>
                    </ul>
                    <br />
                </div>
            </div>
        </div>
        <div class="container">
    <div class="row">
    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
      
    </div>
     <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
      <div class="social">
     <ul class="social-share">
        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>        
        <li><a href="#"><i class="fa fa-skype"></i></a></li>
     </ul>     
       
    </div>
    </div>
    </div>
        </div><%--/top-bar--%></footer>
    </div>     
        <div id="divBackground" style="display: none;position: absolute;top: 0px;left: 0px;background-color: black;z-index: 100;opacity: 0.8;filter: alpha(opacity=60);-moz-opacity: 0.8;min-height: 100%;">
</div>
<div id="divImage">
<table style="height: 100%; width: 100%">
    <tr>
        <td valign="middle" align="center">
            <img id="imgLoader" alt="" src="../images/loader.gif" />
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
<script type="text/javascript">
    jQuery(document).ready(function () {
        var offset = 300;
        var duration = 500;
        jQuery(window).scroll(function () {
            if (jQuery(this).scrollTop() > offset) {
                jQuery('.back-to-top').fadeIn(duration);
            } else {
                jQuery('.back-to-top').fadeOut(duration);
            }
        });

        jQuery('.back-to-top').click(function (event) {
            event.preventDefault();
            jQuery('html, body').animate({ scrollTop: 0 }, duration);
            return false;
        })
    });
    </script>
    <!-- /top-link-block -->
    <!-- Jscript -->
    <script src="../Scripts/imageslider/jquery.js" type="text/javascript"></script>
    <script src="../Scripts/imageslider/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Scripts/imageslider/jquery.prettyPhoto.js" type="text/javascript"></script>
    <script src="../Scripts/imageslider/jquery.isotope.min.js" type="text/javascript"></script>
    <script src="../Scripts/imageslider/main.js" type="text/javascript"></script>
    <script src="../Scripts/imageslider/wow.min.js" type="text/javascript"></script>
    </form>
    </body>
    </html>
