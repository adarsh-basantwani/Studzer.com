<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="students1.Account.Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
     <link href="../Styles/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/style.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/font-awesome.css" rel="stylesheet" type="text/css" />
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
        <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <div id="banner">
               
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                         <legend>Registration<i class="fa fa-pencil pull-right"></i></legend>
                        <div class="form-group">
                            <asp:Label ID="lblName" runat="server" Text="Name" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtFirstName" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtLastName" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                                 <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblGender" runat="server" Text="Gender" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-6">
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
                          <asp:Label ID="lblContactNo" runat="server" Text="Contact No." CssClass="col-lg-4 control-label"></asp:Label>  
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtContactNo" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                              <div class="col-lg-6">
                                <asp:TextBox ID="txtContactNo" runat="server" placeholder="This will be your Login Id" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="lbl" runat="server" Text="" ForeColor="Red" CssClass="col-lg-3 control-label"></asp:Label>
                                <asp:SqlDataSource ID="SqlCheckUser" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    SelectCommand="SELECT ContactNo FROM Users WHERE (ContactNo = @ContactNo)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtContactNo" Name="ContactNo" 
                                            PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="lblEmailId" runat="server" Text="Email Id" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtEmailId" runat="server" placeholder="Email Id (Optional)" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="lbl1" runat="server" ForeColor="Red" 
                                    CssClass="col-lg-3 control-label"></asp:Label>
                                <asp:SqlDataSource ID="SqlCheckUser1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    SelectCommand="SELECT EmailId FROM Users WHERE (EmailId = @EmailId)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtEmailId" Name="EmailId" 
                                            PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                       
                        <div class="form-group">
                            <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtPassword" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtconfirmPassword" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" 
                ErrorMessage="CompareValidator" ForeColor="Red" Display="Dynamic">Not Matching</asp:CompareValidator>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtConfirmPassword" runat="server" placeholder="Confirm Password" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                          <asp:Label ID="lblSecurityQuestion" runat="server" Text="Security Question" CssClass="col-lg-4 control-label"></asp:Label>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="ddlState" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                          
                            <div class="col-lg-6">
                                <asp:DropDownList ID="ddlState" runat="server" 
                                    CssClass="form-control ddl">
                                    <asp:ListItem Selected="True">--Select Security Question--</asp:ListItem>
                                    <asp:ListItem>What is your Nick Name??</asp:ListItem>
                                    <asp:ListItem>Which is your favourite Colour??</asp:ListItem>
                                    <asp:ListItem>What is the name of your First School??</asp:ListItem>
                                    <asp:ListItem>In Which year your Father was Born??</asp:ListItem>
                                    <asp:ListItem>Which Place you like to visit the most??</asp:ListItem>
                                </asp:DropDownList>                              
                         </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblAnswer" runat="server" Text="Answer" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="txtAnswer" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <div class="col-lg-6">
                                <asp:TextBox ID="txtAnswer" runat="server" placeholder="Answer" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                       <div class="form-group">
                            <div class="col-lg-5 col-lg-offset-4">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" 
                                    Text="Submit" onclick="btnSubmit_Click"  />
                                  <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Text="Cancel" />                              
                                <asp:HiddenField ID="hfName" runat="server" />
                                <asp:HiddenField ID="hfPassword" runat="server" />
                                <asp:HiddenField ID="hfPhoto" runat="server" />
                                <asp:SqlDataSource ID="SqlRegister" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    DeleteCommand="DELETE FROM [Users] WHERE [UserId] = @UserId" 
                                    InsertCommand="INSERT INTO Users(Name, Gender, ContactNo, Password, Photo, SecurityQuestion, Answer, EmailId) VALUES (@Name, @Gender, @ContactNo, @Password, @Photo, @SecurityQuestion, @Answer, @EmailId)" 
                                    SelectCommand="SELECT * FROM [Users]" 
                                    
                                    
                                    
                                    UpdateCommand="UPDATE [Users] SET [Name] = @Name, [Gender] = @Gender, [ContactNo] = @ContactNo, [Password] = @Password WHERE [UserId] = @UserId">
                                    <DeleteParameters>
                                        <asp:Parameter Name="UserId" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:ControlParameter ControlID="hfName" Name="Name" PropertyName="Value" 
                                            Type="String" />
                                        <asp:ControlParameter ControlID="rblGender" Name="Gender" 
                                            PropertyName="SelectedValue" Type="String" />
                                        <asp:ControlParameter ControlID="txtContactNo" Name="ContactNo" 
                                            PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="hfPassword" Name="Password" 
                                            PropertyName="Value" Type="String" />
                                        <asp:ControlParameter ControlID="hfPhoto" Name="Photo" PropertyName="Value" />
                                        <asp:ControlParameter ControlID="ddlState" Name="SecurityQuestion" 
                                            PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="txtAnswer" Name="Answer" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txtEmailId" Name="EmailId" 
                                            PropertyName="Text" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Name" Type="String" />
                                        <asp:Parameter Name="Gender" Type="String" />
                                        <asp:Parameter Name="ContactNo" Type="String" />
                                        <asp:Parameter Name="Password" Type="String" />
                                        <asp:Parameter Name="UserId" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
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
    </form>
</body>
</html>
