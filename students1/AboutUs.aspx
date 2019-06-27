<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="students1.AboutUs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Room in Amravati, Hostel in Amravati, Amravati, Mess in Amravati, Tution in Amravati, startup, roommate, chat, live discussion, students, online" />
    <title>About Us</title>
    <link href="Styles/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="Styles/style.css" rel="stylesheet" type="text/css" />
    
    <!-- for feedback slider -->
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
     <link href="Styles/feedbackslider/slicebox.css" rel="stylesheet" type="text/css" />   
    <link href="Styles/feedbackslider/animate.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/feedbackslider/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/feedbackslider/main.css" rel="stylesheet" type="text/css" />    
    <link href="Styles/feedbackslider/responsive.css" rel="stylesheet" type="text/css" />
    <link href="Styles/feedbackslider/font-awesome.css" rel="stylesheet" type="text/css" />
   
    <link href="Styles/imageslider/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/imageslider/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/imageslider/animate.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/imageslider/prettyPhoto.css" rel="stylesheet" type="text/css" />
    <link href="Styles/imageslider/main.css" rel="stylesheet" type="text/css" />
    <link href="Styles/imageslider/responsive.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:100%;background-color:White">
        <div id="custom-bootstrap-menu" class="navbar navbar-default" role="navigation">
            <table width="100%"><tr><td align="center"><asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="~/Index.aspx"><asp:Image ID="Image2" runat="server" Height="100px" Width="120px" ImageUrl="~/images/logo.png" /></asp:HyperLink>
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
    
    <center>
    <div class="jumbotron" style="font-family:'Times New Roman',Times, serif;font-size:x-large;color:#FFFFFF;width:50%;">
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Studzer.com is a rising venture which provides a Provision to easily search and upload the facilities like room, mess, flat and tutorials. Team studzer.com brought a very new concept of “roommate”.
     </p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Studzer.com is a platform for all the service providers who are concern with students. It also make student’s life easy by providing them all the facilities they need at one place, which reduces the issue of hunting for perfect accommodation and many other things.
     </p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Studzer.com will always look forward for making student life easier. It will always provide a convenient platform for service provider to keep a friendly contact with students. The team studzer.com will keep inventing more creative ideas for betterment of mankind.     
    </p><hr /><table width="100%"><tr><td align="center">Inventors:</td><td align="center">Kaushal Balte</td><td align="center">Shatam Bhagat</td></tr>
    <tr><td></td><td align="center">Adarsh Basantwani</td><td align="center">Omkumar Badhai</td></tr></table></div></center>
    <br />
    <br /><br />
    <div class="panel-footer" style="background-color:Gray;border-top-width:thin">
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
    </form>
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
</body>
</html>
