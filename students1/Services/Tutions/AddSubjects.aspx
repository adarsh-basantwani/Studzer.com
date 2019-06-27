<%@ Page Title="Add Subjects" Language="C#" MasterPageFile="~/Services/Tutions/Site1.Master" AutoEventWireup="true" CodeBehind="AddSubjects.aspx.cs" Inherits="students1.Services.Tutions.AddSubjects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                         <legend>Subject Information<i class="fa fa-pencil pull-right"></i></legend>
                          <div class="form-group">
                            <asp:Label ID="lblCourseName" runat="server" Text="Course Name" CssClass="col-lg-4 control-label"></asp:Label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtCourseName" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtCourseName" runat="server" placeholder="Course Name" CssClass="form-control"></asp:TextBox>
                                If Your Course is available in the following list then please write same spelling in Course textbox
                               <div class="radio"> <label><asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                    DataSourceID="SqlCourse" DataTextField="Course" DataValueField="Course">
                                </asp:RadioButtonList></label></div>
                                <asp:SqlDataSource ID="SqlCourse" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    SelectCommand="SELECT DISTINCT [Course] FROM [Subject]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblSubjectName" runat="server" Text="Subject Name" CssClass="col-lg-4 control-label"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtSubjectName" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtSubjectName" runat="server" placeholder="Subject Name" CssClass="form-control"></asp:TextBox>
                                If Your Subject is available in the following list then please write same spelling in Subject textbox
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" 
                                    DataSourceID="Sql" DataTextField="Subject" DataValueField="Subject">
                                </asp:RadioButtonList>
                                <asp:SqlDataSource ID="Sql" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    SelectCommand="SELECT DISTINCT [Subject] FROM [Subject]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblFacultyName" runat="server" Text="Faculty Name" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtFacultyName" runat="server" placeholder="Faculty Name" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtFacultyName" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblBatchTiming" runat="server" Text="Batch Timing" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtBatchTiming" runat="server" placeholder="Batch Timing" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtBatchTiming" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblFees" runat="server" Text="Fees" CssClass="col-lg-4 control-label"></asp:Label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtFees" runat="server" placeholder="Fees" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtFees" ErrorMessage="RequiredFieldValidator" 
                ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-5 col-lg-offset-4">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" 
                                    Text="Submit" onclick="btnSubmit_Click" />
                                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-warning" NavigateUrl="~/Services/Tutions/TutionPanel.aspx">Cancel</asp:HyperLink>                             
                            </div>
                        </div>
              <asp:SqlDataSource ID="SqlSubject" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                             DeleteCommand="DELETE FROM [Subject] WHERE [SubjectId] = @SubjectId" 
                             InsertCommand="INSERT INTO [Subject] ([TutionId], [Course], [Subject], [Faculty], [BatchTiming], [Fees]) VALUES (@TutionId, @Course, @Subject, @Faculty, @BatchTiming, @Fees)" 
                             SelectCommand="SELECT * FROM [Subject]" 
                             
                             
                             
                             UpdateCommand="UPDATE [Subject] SET [TutionId] = @TutionId, [Course] = @Course, [Subject] = @Subject, [Faculty] = @Faculty, [BatchTiming] = @BatchTiming, [Fees] = @Fees WHERE [SubjectId] = @SubjectId">
                             <DeleteParameters>
                                 <asp:Parameter Name="SubjectId" Type="Int32" />
                             </DeleteParameters>
                             <InsertParameters>
                                 <asp:SessionParameter Name="TutionId" SessionField="TutionId" Type="Int32" />
                                 <asp:ControlParameter ControlID="txtCourseName" Name="Course" 
                                     PropertyName="Text" Type="String" />
                                 <asp:ControlParameter ControlID="txtSubjectName" Name="Subject" 
                                     PropertyName="Text" Type="String" />
                                 <asp:ControlParameter ControlID="txtFacultyName" Name="Faculty" 
                                     PropertyName="Text" Type="String" />
                                 <asp:ControlParameter ControlID="txtBatchTiming" Name="BatchTiming" 
                                     PropertyName="Text" Type="String" />
                                 <asp:ControlParameter ControlID="txtFees" Name="Fees" PropertyName="Text" 
                                     Type="String" />
                             </InsertParameters>
                             <UpdateParameters>
                                 <asp:Parameter Name="TutionId" Type="Int32" />
                                 <asp:Parameter Name="Course" Type="String" />
                                 <asp:Parameter Name="Subject" Type="String" />
                                 <asp:Parameter Name="Faculty" Type="String" />
                                 <asp:Parameter Name="BatchTiming" Type="String" />
                                 <asp:Parameter Name="Fees" Type="String" />
                                 <asp:Parameter Name="SubjectId" Type="Int32" />
                             </UpdateParameters>
                         </asp:SqlDataSource>         
</fieldset>
</div>
</div>
</div>
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
