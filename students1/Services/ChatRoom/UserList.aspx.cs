using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace students1.Services.ChatRoom
{
    public partial class UserList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            Panelsearch.Visible = true;
            Panelall.Visible = false;
        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Delete();
            Response.Write("<script>alert('You are Deleted from roommate chat')</script>");
            Server.Transfer("~/Account/UserPanel.aspx");
        }
    }
}