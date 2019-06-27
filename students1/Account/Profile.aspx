<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="students1.Account.Profile1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<title></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 text-center">
            <div id="banner">
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlPhoto">
    <ItemTemplate>
                    <center>
                    <a href="ChangePhoto.aspx">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Photo") %>' ToolTip='Click to Change' Height="200px" Width="200px" />
                    </a>
                    </center>
                </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlPhoto" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT Photo, ContactNo FROM Users WHERE (ContactNo = @ContactNo)">
        <SelectParameters>
            <asp:SessionParameter Name="ContactNo" SessionField="UserId" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        
            
            
            SelectCommand="SELECT What, Age, City, State, Education, EmailId FROM Users WHERE (ContactNo = @ContactNo)">
        <SelectParameters>
            <asp:SessionParameter Name="ContactNo" SessionField="UserId" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
        <asp:Panel ID="PanelProfile" runat="server">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                    <legend>Profile<i class="pull-right"><asp:ImageButton ID="Img1" runat="server" 
                            ImageUrl="~/images/edit.png" Height="30px" Width="30px" onclick="Img1_Click"/></i></legend>
                    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDisplayDetails">
                            <ItemTemplate>
                            <table style="font-size:large">
                            <tr><td>
                                <asp:Label runat="server" ID="lblName" Text="Name:" />&nbsp;&nbsp;
                           </td><td>
                                <asp:Label ID="NameLabel" runat="server" 
                                    Text='<%# Eval("Name") %>' />
                           </td></tr>
                           <tr><td>
                                <asp:Label runat="server" ID="Label1" Text="Contact No:" />&nbsp;&nbsp;
                           </td><td>
                                <asp:Label ID="Label2" runat="server" 
                                    Text='<%# Eval("ContactNo") %>' />
                           </td></tr>
                                <tr><td>
                                <asp:Label runat="server" ID="lblGender" Text="Gender:"/>&nbsp;&nbsp;
                                </td><td>
                                <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                               </td></tr>
                               <tr><td>
                                <asp:Label runat="server" ID="lblAge" Text="Age:" />&nbsp;&nbsp;
                             </td><td>
                                <asp:Label ID="AgeLabel" runat="server" Text='<%# Eval("Age") %>' />
                               </td></tr>
                             <tr><td>
                                <asp:Label runat="server" ID="lblEmailId" Text="EmailId:"  />&nbsp;&nbsp;
                             </td><td>
                             <asp:Label ID="EmailIdLabel" runat="server" Text='<%# Eval("EmailId") %>' />
                               </td></tr>
                             <tr><td>
                                <asp:Label runat="server" ID="lblWhat" Text="Work:" />&nbsp;&nbsp;
                             </td><td>
                                <asp:Label ID="WhatLabel" runat="server" Text='<%# Eval("What") %>' />
                              </td></tr>
                                 <tr><td>
                                <asp:Label runat="server" ID="lblEducation" Text="Education:" />&nbsp;&nbsp;
                                </td><td>
                                <asp:Label ID="EducationLabel" runat="server" Text='<%# Eval("Education") %>' />
                          </td></tr>
                              <tr><td>
                                <asp:Label runat="server" ID="lblCity" Text="City:" />&nbsp;&nbsp;
                                </td><td>
                                <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                               </td></tr>
                               <tr><td>
                                <asp:Label runat="server" ID="lblState" Text="State:" />&nbsp;&nbsp;
                            </td><td>
                                <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                               </td></tr>
                               <tr><td>
                                <asp:Label runat="server" ID="lblSequrityQuestion" Text="Security Question:" />&nbsp;&nbsp;
                              </td><td>
                                <asp:Label ID="SequrityQuestionLabel" runat="server" Text='<%# Eval("SecurityQuestion") %>' />
                             </td></tr>
                               <tr><td>
                                <asp:Label runat="server" ID="lblAnswer" Text="Answer:" />&nbsp;&nbsp;
                               </td><td>
                                <asp:Label ID="AnswerLabel" runat="server" Text='<%# Eval("Answer") %>' />
                               </td></tr></table>
                            </ItemTemplate>
                            
                        </asp:DataList>
                         <asp:SqlDataSource ID="SqlDisplayDetails" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            
                            
                            
                            
                            
                            
                            
                            
                            SelectCommand="SELECT Name, Gender, EmailId, What, Education, Age, City, State, SecurityQuestion, Answer, ContactNo FROM Users WHERE (ContactNo = @ContactNo)">
                             <SelectParameters>
                                 <asp:SessionParameter Name="ContactNo" SessionField="UserId" Type="String" />
                             </SelectParameters>
                        </asp:SqlDataSource>
                             </fieldset>
                </div>
                
            </div>
        </div>
        </asp:Panel>
        <asp:Panel ID="PanelFixed" runat="server">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                         <legend>Profile Information<i class="fa fa-pencil pull-right"></i></legend>
                         <div class="form-group">
                          <asp:Label ID="lblState" runat="server" Text="State" CssClass="col-lg-4 control-label"></asp:Label>  
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
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
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="ddlCity" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                       
                            <div class="col-lg-8">
                                <asp:DropDownList ID="ddlCity" runat="server" 
                                    CssClass="form-control ddl" DataSourceID="SqlCity"
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
                            <asp:Label ID="lblWhat" runat="server" Text="Currently What are you doing??" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="rblEducation" runat="server" >
                                            <asp:ListItem>Education</asp:ListItem>
                                            <asp:ListItem>Other</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                          <asp:Label ID="lblEducation" runat="server" Text="Education" CssClass="col-lg-4 control-label"></asp:Label>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtEducation" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>                          
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtEducation" runat="server" placeholder="Education" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                <div class="form-group">
                            <asp:Label ID="lblAge" runat="server" Text="Age" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="ddlAge" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <div class="col-lg-8">
                                <asp:DropDownList ID="ddlAge" runat="server" 
                                    CssClass="form-control ddl">
                                    <asp:ListItem Selected="True" Value="0">--Select Age--</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                    <asp:ListItem>13</asp:ListItem>
                                    <asp:ListItem>14</asp:ListItem>
                                    <asp:ListItem>15</asp:ListItem>
                                    <asp:ListItem>16</asp:ListItem>
                                    <asp:ListItem>17</asp:ListItem>
                                    <asp:ListItem>18</asp:ListItem>
                                    <asp:ListItem>19</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>21</asp:ListItem>
                                    <asp:ListItem>22</asp:ListItem>
                                    <asp:ListItem>23</asp:ListItem>
                                    <asp:ListItem>24</asp:ListItem>
                                    <asp:ListItem>25</asp:ListItem>
                                    <asp:ListItem>26</asp:ListItem>
                                    <asp:ListItem>27</asp:ListItem>
                                    <asp:ListItem>28</asp:ListItem>
                                    <asp:ListItem>29</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>31</asp:ListItem>
                                    <asp:ListItem>32</asp:ListItem>
                                    <asp:ListItem>33</asp:ListItem>
                                    <asp:ListItem>34</asp:ListItem>
                                    <asp:ListItem>35</asp:ListItem>
                                    <asp:ListItem>36</asp:ListItem>
                                    <asp:ListItem>37</asp:ListItem>
                                    <asp:ListItem>38</asp:ListItem>
                                    <asp:ListItem>39</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>41</asp:ListItem>
                                    <asp:ListItem>42</asp:ListItem>
                                    <asp:ListItem>43</asp:ListItem>
                                    <asp:ListItem>44</asp:ListItem>
                                    <asp:ListItem>45</asp:ListItem>
                                    <asp:ListItem>46</asp:ListItem>
                                    <asp:ListItem>47</asp:ListItem>
                                    <asp:ListItem>48</asp:ListItem>
                                    <asp:ListItem>49</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>51</asp:ListItem>
                                    <asp:ListItem>52</asp:ListItem>
                                    <asp:ListItem>53</asp:ListItem>
                                    <asp:ListItem>54</asp:ListItem>
                                    <asp:ListItem>55</asp:ListItem>
                                    <asp:ListItem>56</asp:ListItem>
                                    <asp:ListItem>57</asp:ListItem>
                                    <asp:ListItem>58</asp:ListItem>
                                    <asp:ListItem>59</asp:ListItem>
                                    <asp:ListItem>60</asp:ListItem>
                                    <asp:ListItem>61</asp:ListItem>
                                    <asp:ListItem>62</asp:ListItem>
                                    <asp:ListItem>63</asp:ListItem>
                                    <asp:ListItem>64</asp:ListItem>
                                    <asp:ListItem>65</asp:ListItem>
                                    <asp:ListItem>66</asp:ListItem>
                                    <asp:ListItem>67</asp:ListItem>
                                    <asp:ListItem>68</asp:ListItem>
                                    <asp:ListItem>69</asp:ListItem>
                                    <asp:ListItem>70</asp:ListItem>
                                    <asp:ListItem>71</asp:ListItem>
                                    <asp:ListItem>72</asp:ListItem>
                                    <asp:ListItem>73</asp:ListItem>
                                    <asp:ListItem>74</asp:ListItem>
                                    <asp:ListItem>75</asp:ListItem>
                                    <asp:ListItem>76</asp:ListItem>
                                    <asp:ListItem>77</asp:ListItem>
                                    <asp:ListItem>78</asp:ListItem>
                                    <asp:ListItem>79</asp:ListItem>
                                    <asp:ListItem>80</asp:ListItem>
                                    <asp:ListItem>81</asp:ListItem>
                                    <asp:ListItem>82</asp:ListItem>
                                    <asp:ListItem>83</asp:ListItem>
                                    <asp:ListItem>84</asp:ListItem>
                                    <asp:ListItem>85</asp:ListItem>
                                    <asp:ListItem>86</asp:ListItem>
                                    <asp:ListItem>87</asp:ListItem>
                                    <asp:ListItem>88</asp:ListItem>
                                    <asp:ListItem>89</asp:ListItem>
                                    <asp:ListItem>90</asp:ListItem>
                                    <asp:ListItem>91</asp:ListItem>
                                    <asp:ListItem>92</asp:ListItem>
                                    <asp:ListItem>93</asp:ListItem>
                                    <asp:ListItem>94</asp:ListItem>
                                    <asp:ListItem>95</asp:ListItem>
                                    <asp:ListItem>96</asp:ListItem>
                                    <asp:ListItem>97</asp:ListItem>
                                    <asp:ListItem>98</asp:ListItem>
                                    <asp:ListItem>99</asp:ListItem>
                                    <asp:ListItem>100</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                        <asp:Label ID="lblEmailId" runat="server" Text="EmailId" CssClass="col-lg-4 control-label"></asp:Label>
                        <div class="col-lg-8">
                        <asp:TextBox ID="txtEmailId" runat="server" placeholder="EmailId" CssClass="form-control"></asp:TextBox>
                        </div>
                        </div>    
                        <div class="form-group">
                            <div class="col-lg-5 col-lg-offset-4">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" 
                                    Text="Update" onclick="btnSubmit_Click" />
                                  <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Account/UserPanel.aspx" CssClass="btn btn-warning">Back</asp:HyperLink>                              
                            </div>
                        </div>
                         </fieldset>
                    <asp:SqlDataSource ID="SqlProfile" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        DeleteCommand="DELETE FROM [Users] WHERE [UserId] = @UserId" 
                        InsertCommand="INSERT INTO [Users] ([ContactNo], [EmailId], [Education], [Age], [City], [State]) VALUES (@ContactNo, @EmailId, @Education, @Age, @City, @State)" 
                        SelectCommand="SELECT [UserId], [ContactNo], [EmailId], [Education], [Age], [City], [State] FROM [Users]" 
                        
                        
                        
                        UpdateCommand="UPDATE Users SET EmailId = @EmailId, Education = @Education, Age = @Age, City = @City, State = @State, What = @What WHERE (ContactNo = @ContactNo)">
                        <DeleteParameters>
                            <asp:Parameter Name="UserId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ContactNo" Type="String" />
                            <asp:Parameter Name="EmailId" Type="String" />
                            <asp:Parameter Name="Education" Type="String" />
                            <asp:Parameter Name="Age" Type="String" />
                            <asp:Parameter Name="City" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:SessionParameter Name="ContactNo" SessionField="UserId" Type="String" />
                            <asp:ControlParameter ControlID="txtEmailId" Name="EmailId" PropertyName="Text" 
                                Type="String" />
                            <asp:ControlParameter ControlID="txtEducation" Name="Education" 
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="ddlAge" Name="Age" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="ddlCity" Name="City" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="ddlState" Name="State" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="rblEducation" Name="What" 
                                PropertyName="SelectedValue" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
        </asp:Panel>
    </div><script src="../../Scripts/main/jquery.js" type="text/javascript"></script>
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
