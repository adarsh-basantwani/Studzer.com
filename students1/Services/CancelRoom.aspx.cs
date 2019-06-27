using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace students1.Services
{
    public partial class CancelRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hfStatus.Value = "No";
            hfStatus2.Value = "No";
            int n = SqlDataSource1.Update();
            if (n == 1)
            {
                SqlDataSource2.Update();
                Response.Write("<script>alert('User Cancelled Successfully..')</script>");
            }
            Server.Transfer("RoomDetails.aspx");
        }
    }
}