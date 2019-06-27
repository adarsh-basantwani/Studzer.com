<%@ Page Title="My Uploads" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyUploads.aspx.cs" Inherits="students1.Account.MyUploads" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
<div class="col-lg-10 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                    <asp:HiddenField ID="hfHold" runat="server" />
                    <legend>My Uploads</legend>
                        <asp:Panel ID="PanelRoom" runat="server" GroupingText="Rooms">
                            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlRooms">
                            <HeaderTemplate><h6>This ad is valid for 30 days, after that you can repost your add by clicking on 'Details' link.</h6></HeaderTemplate>
                            <ItemTemplate>
               <h4>
               RoomId: <asp:Label ID="Label1" runat="server" Text='<%# Eval("RoomId") %>' />&nbsp;&nbsp;
                <a href='../Services/Room/RoomDetails.aspx?RoomId=<%#Eval("RoomId") %>'>Details</a>
               &nbsp;&nbsp;&nbsp;&nbsp;
                Ad Seen By:
                <asp:Label ID="CounterLabel" runat="server" Text='<%# Eval("Counter") %>' />
                &nbsp;&nbsp;&nbsp;&nbsp;
                Booked By:
                <asp:Label ID="DisableLabel" runat="server" Text='<%# Eval("Expr1") %>'/></h4>
<br />
                <br />
            </ItemTemplate>
                            </asp:DataList>
    <asp:SqlDataSource ID="SqlRooms" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
            
            
                                SelectCommand="SELECT Room.RoomId, Room.Counter, COUNT(Booking.RoomId) AS Expr1 FROM Room INNER JOIN Booking ON Room.RoomId = Booking.RoomId WHERE (Room.UserId = @UserId) AND (Booking.RoomStatus = @RoomStatus) Group By Room.RoomId, Room.Counter">
        <SelectParameters>
            <asp:SessionParameter Name="UserId" SessionField="UserId" />
            <asp:ControlParameter ControlID="hfHold" Name="RoomStatus" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
                        </asp:Panel>
                        <asp:Panel ID="PanelMess" runat="server" GroupingText="Mess">
                        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlMess">
                            <HeaderTemplate><h6>This ad is valid for certain duration(scheme) which you have selected, after the duration is over you can repost your ad by clicking on 'Details' link.</h6></HeaderTemplate>
                            <ItemTemplate>
               <h4>
               MessId: <asp:Label ID="Label1" runat="server" Text='<%# Eval("MessId") %>' />&nbsp;&nbsp;
                <a href='../Services/Mess/MessDetails.aspx?MessId=<%#Eval("MessId") %>'>Details</a>
               &nbsp;&nbsp;&nbsp;&nbsp;
                Ad Seen By:
                <asp:Label ID="CounterLabel" runat="server" Text='<%# Eval("Counter") %>' />
                &nbsp;&nbsp;&nbsp;&nbsp;
                Booked By:
                <asp:Label ID="DisableLabel" runat="server" Text='<%# Eval("Expr1") %>'/></h4>
<br />
                <br />
            </ItemTemplate>
                            </asp:DataList>
    <asp:SqlDataSource ID="SqlMess" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
            
            
                                
                                SelectCommand="SELECT Mess.MessId, Mess.Counter, COUNT(Booking.MessId) AS Expr1 FROM Mess INNER JOIN Booking ON Mess.MessId = Booking.MessId WHERE (Mess.UserId = @UserId) OR (Booking.MessStatus = @MessStatus) Group By Mess.MessId, Mess.Counter">
        <SelectParameters>
            <asp:SessionParameter Name="UserId" SessionField="UserId" />
            <asp:ControlParameter ControlID="hfHold" Name="MessStatus" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
                        </asp:Panel>
                        <asp:Panel ID="PanelFlat" runat="server" GroupingText="Flats">
                        <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlFlats">
                            <HeaderTemplate><h6>This ad is valid for 30 days, after that you can repost your add by clicking on 'Details' link.</h6></HeaderTemplate>
                            <ItemTemplate>
               <h4>
               FlatId: <asp:Label ID="Label1" runat="server" Text='<%# Eval("FlatId") %>' />&nbsp;&nbsp;
                <a href='../Services/Flat/FlatDetails.aspx?FlatId=<%#Eval("FlatId") %>'>Details</a>
               &nbsp;&nbsp;&nbsp;&nbsp;
                Ad Seen By:
                <asp:Label ID="CounterLabel" runat="server" Text='<%# Eval("Counter") %>' />
                &nbsp;&nbsp;&nbsp;&nbsp;
                Booked By:
                <asp:Label ID="DisableLabel" runat="server" Text='<%# Eval("Expr1") %>'/></h4>
<br />
                <br />
            </ItemTemplate>
                            </asp:DataList>
    <asp:SqlDataSource ID="SqlFlats" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
            
            
                                
                                SelectCommand="SELECT Flat.FlatId, Flat.Counter, COUNT(Booking.FlatId) AS Expr1 FROM Flat INNER JOIN Booking ON Flat.FlatId = Booking.FlatId WHERE (Flat.UserId = @UserId) OR (Booking.FlatStatus = @FlatStatus) Group By Flat.FlatId, Flat.Counter">
        <SelectParameters>
            <asp:SessionParameter Name="UserId" SessionField="UserId" />
            <asp:ControlParameter ControlID="hfHold" Name="FlatStatus" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
                        </asp:Panel>
                        <asp:Panel ID="PanelHostel" runat="server" GroupingText="Hostels">
                        <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlHostels">
                            <HeaderTemplate><h6>This ad is valid for certain duration(scheme) which you have selected, after the duration is over you can repost your ad by clicking on 'Details' link.</h6></HeaderTemplate>
                            <ItemTemplate>
               <h4>
               HostelId: <asp:Label ID="Label1" runat="server" Text='<%# Eval("HostelId") %>' />&nbsp;&nbsp;
                <a href="../Services/Hostel/HostelDetails.aspx?HostelId=<%#Eval("HostelId") %>">Details</a>
               &nbsp;&nbsp;&nbsp;&nbsp;
                Ad Seen By:
                <asp:Label ID="CounterLabel" runat="server" Text='<%# Eval("Counter") %>' />
                &nbsp;&nbsp;&nbsp;&nbsp;
                Booked By:
                <asp:Label ID="DisableLabel" runat="server" Text='<%# Eval("Expr1") %>'/></h4>
<br />
                <br />
            </ItemTemplate>
                            </asp:DataList>
    <asp:SqlDataSource ID="SqlHostels" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
            
            
                                
                                
                                SelectCommand="SELECT Hostel.HostelId, Hostel.Counter, COUNT(Booking.HostelId) AS Expr1 FROM Hostel INNER JOIN Booking ON Hostel.HostelId = Booking.HostelId WHERE (Hostel.UserId = @UserId) OR (Booking.HostelStatus = @HostelStatus) Group By Hostel.HostelId, Hostel.Counter">
        <SelectParameters>
            <asp:SessionParameter Name="UserId" SessionField="UserId" />
            <asp:ControlParameter ControlID="hfHold" Name="HostelStatus" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
                        </asp:Panel>
                    </fieldset>
        </div>
        </div></div></div>
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
