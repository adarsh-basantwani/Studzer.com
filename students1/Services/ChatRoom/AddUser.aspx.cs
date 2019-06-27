using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace students1.Services.ChatRoom
{
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           DataView dv1 = (DataView)SqlDataSource2.Select(new DataSourceSelectArguments());
           if (dv1[0][0] != DBNull.Value && dv1[0][1] != DBNull.Value && dv1[0][2] != DBNull.Value && dv1[0][3] != DBNull.Value && dv1[0][4] != DBNull.Value)
           {
               DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
               if (dv.Count == 1)
               {
                   Server.Transfer("UserList.aspx");
               }
               else
               {
                   int n = SqlDataSource1.Insert();
                   if (n == 1)
                   {
                       Server.Transfer("UserList.aspx");
                   }
               }
           }
           else
           {
               Response.Write("<script>alert('Please Fill Up Your Profile Details First...')</script>");
               Server.Transfer("~/Account/Profile.aspx");
           }
        }
    }
}