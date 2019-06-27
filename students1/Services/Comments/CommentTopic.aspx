<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentTopic.aspx.cs" Inherits="students1.Services.Comments.CommentTopic" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        
                        SelectCommand="SELECT TopicName FROM CommentTopic WHERE (TopicId = (SELECT MAX(TopicId) AS Expr1 FROM CommentTopic AS CommentTopic_1))"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
