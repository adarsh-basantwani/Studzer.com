<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="students1.Account.ForgotPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Forgot Password</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <style type="text/css">
     @import url(http://fonts.googleapis.com/css?family=Roboto:400,100);
body {
  background: url(https://dl.dropboxusercontent.com/u/23299152/Wallpapers/wallpaper-22705.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  font-family: 'Roboto', sans-serif;
}

.login-card {
  padding: 40px;
  width: 274px;
  background-color: #F7F7F7;
  margin: 0 auto 10px;
  border-radius: 2px;
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  overflow: hidden;
}

.login-card h1 {
  font-weight: 100;
  text-align: center;
  font-size: 2.3em;
}

.login-card input[type=submit] {
  width: 100%;
  display: block;
  margin-bottom: 10px;
  position: relative;
}

.login-card input[type=text], input[type=password] {
  height: 44px;
  font-size: 16px;
  width: 100%;
  margin-bottom: 10px;
  -webkit-appearance: none;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  /* border-radius: 2px; */
  padding: 0 8px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}

.login-card input[type=text]:hover, input[type=password]:hover {
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
}

.login {
  text-align: center;
  font-size: 14px;
  font-family: 'Arial', sans-serif;
  font-weight: 700;
  height: 36px;
  padding: 0 8px;
/* border-radius: 3px; */
/* -webkit-user-select: none;
  user-select: none; */
}

.login-submit {
  /* border: 1px solid #3079ed; */
  border: 0px;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1); 
  background-color: #4d90fe;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
}

.login-submit:hover {
  /* border: 1px solid #2f5bb7; */
  border: 0px;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #357ae8;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
}

.login-card a {
  text-decoration: none;
  color: #666;
  font-weight: 400;
  text-align: center;
  display: inline-block;
  opacity: 0.6;
  transition: opacity ease 0.5s;
}

.login-card a:hover {
  opacity: 1;
}

.login-help {
  width: 100%;
  text-align: center;
  font-size: 15px;
}
</style>
</head>
<body>
<div class="login-card">
    <h1>Forgot Password</h1> <br/>
<form runat="server" id="form1">
                         <asp:TextBox ID="txtContactNo" runat="server" placeholder="Contact No."></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtContactNo" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlQuestion" runat="server" style="height: 44px;font-size: 16px;width: 100%;margin-bottom: 10px;-webkit-appearance: none;background: #fff;border: 1px solid #d9d9d9; border-top: 1px solid #c0c0c0;/* border-radius: 2px; */padding: 0 8px;box-sizing: border-box;-moz-box-sizing: border-box;">
                                    <asp:ListItem Selected="True">--Select Security Question--</asp:ListItem>
                                    <asp:ListItem>What is your Nick Name??</asp:ListItem>
                                    <asp:ListItem>Which is your favourite Colour??</asp:ListItem>
                                    <asp:ListItem>What is the name of your First School??</asp:ListItem>
                                    <asp:ListItem>In Which year your Father was Born??</asp:ListItem>
                                    <asp:ListItem>Which Place you like to visit the most??</asp:ListItem>
                                </asp:DropDownList>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="ddlQuestion" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator> 
                <asp:TextBox ID="txtAnswer" runat="server" placeholder="Answer" CssClass="form-control"></asp:TextBox>                        
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtAnswer" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                                <asp:Button ID="Button1" runat="server" CssClass="login login-submit" 
                                    Text="Submit" onclick="btnSubmit_Click"  />
                                  <asp:Button ID="btnCancel" runat="server" CssClass="login login-submit" 
                                    Text="Cancel" onclick="btnCancel_Click" />                              
                                <asp:SqlDataSource ID="SqlRegister" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    
                                    
                                    SelectCommand="SELECT SecurityQuestion, Answer, Password FROM Users WHERE (ContactNo = @ContactNo) AND (SecurityQuestion = @SecurityQuestion) AND (Answer = @Answer)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtContactNo" Name="ContactNo" 
                                            PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="ddlQuestion" Name="SecurityQuestion" 
                                            PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="txtAnswer" Name="Answer" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                          
  </form> 
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

</body>

</html>