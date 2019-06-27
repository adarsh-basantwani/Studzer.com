<%@ Page Title="Post View" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="students1.Services.Comments.Comments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
<div class="col-lg-8 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                <fieldset>
                            <legend>Topic:&nbsp;&nbsp;
                            <asp:Label ID="TopicNameLabel" runat="server" Text="" />
                            </legend>
                <table style="width:100%;">
                    <tr>
                        <td><h5 style="color:White">Your View</h5></td>
                        <td>
                            <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" CssClass="form-control" Width="300px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtComment" ErrorMessage="Please Provide Comment" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        </td>
                    </tr><tr>
                        <td></td>
                        <td align="right">
                        <br />
                        <asp:Button ID="btn_Submit" runat="server" Text="Post Your View" OnClick="btn_Submit_Click" CssClass="btn btn-primary" />
                            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-warning" NavigateUrl="~/Services/Comments/MyViews.aspx">My Previous Views</asp:HyperLink>
                        </td>
                        <td></td>
                    </tr>
                </table>
                
               <h4 style="text-decoration:underline;color:White">Views:</h4>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div style="background-color:White">
                       <h5> <b>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("Name") %>'></asp:Label></b>&nbsp;:<br />
                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("Comment") %>'></asp:Label><br />
                        <a href='LikeComment.aspx?Id=<%#Eval("Id") %>'><img src="../../images/like.png" alt="Not Available" height="30px" width="30px" /></a><asp:Label ID="Label2" runat="server" Text='<%#Eval("Love") %>'></asp:Label>
                   </h5> </div>
                </ItemTemplate>
            </asp:Repeater>
            <div style="overflow: hidden;">
                <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnPage"
                            Style="padding: 8px; margin: 2px; background: #007acc; border: solid 1px blue; font: 8px;"
                            CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                            runat="server" ForeColor="White" Font-Bold="True" CausesValidation="false"><%# Container.DataItem %>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            </fieldset>
                </div></div></div></div>
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
