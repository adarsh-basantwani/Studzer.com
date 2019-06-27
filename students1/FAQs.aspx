<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FAQs.aspx.cs" Inherits="students1.FAQs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FAQs</title>
    <meta charset="utf-8" />
    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Room in Amravati, Hostel in Amravati, Amravati, Mess in Amravati, Tution in Amravati, startup, roommate, chat, live discussion, students, online" />
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
    <div class="jumbotron">
    <section id="middle">
        <div class="container">
               <div class="col-sm-6 wow fadeInDown">
                    <div class="accordion">
                        <h2>Any Problem?? Here is the Solution</h2>
                        <div class="panel-group" id="accordion1">
                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1">
                                   1. Is there any participation of brokers in studzer.com ?
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseOne1" class="panel-collapse collapse">
                              <div class="panel-body">
                               Ans. No... studzer.com is a platform where owners and customers can communicate directly, there is no interference of third party like brokers.
                              </div>
                            </div>
                          </div>

                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseTwo1">
                                 2. Does studzer.com charge anything to student ?
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseTwo1" class="panel-collapse collapse">
                              <div class="panel-body">
                               Ans. No...  It is totally free for students.
                              </div>
                            </div>
                          </div>

                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseThree1">
                                  3. When owners advertise will be online ?
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseThree1" class="panel-collapse collapse">
                              <div class="panel-body">
                                Ans. After uploading your advertise it will be online within next 24 hours.
                              </div>
                            </div>
                          </div>

                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseFour1">
                                   4. What if "nearest location" is not according to my convinence ?
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseFour1" class="panel-collapse collapse">
                              <div class="panel-body">
                               Ans. Then please contact us we will be happy to add more well known locations.
                              </div>
                            </div>
                          </div>
                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseFive1">
                                   5. How to give advertise on studzer.com ?
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseFive1" class="panel-collapse collapse">
                              <div class="panel-body">
                            Ans. To publish your advertise with us contact us on any contact detail.
                              </div>
                            </div>
                          </div>
                        </div><!--/#accordion1-->
                    </div>
                </div>
            </div><!--/.row-->     <!--/.container-->
    </section>
    <!--/#middle-->        
    </div>
    
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
